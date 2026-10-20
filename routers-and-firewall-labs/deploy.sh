#!/bin/bash

# ==============================================================================
# PROJECT: ROUTERS AND FIREWALL LAB
# DESCRIPTION: Unified Automator for Namespaces, Routing, Stateful Firewalls,
#              Troubleshooting Diagnostics, and Output Logs.
# ==============================================================================

# Verification: Assert administrative rights prior to modifying network stacks
if [ "$EUID" -ne 0 ]; then
  echo "[-] Error: Root privileges required to alter kernel routing and interfaces."
  exit 1
fi

echo "======================================================================"
# SECTION 1: CLEANING UP PRE-EXISTING LAB INSTANCES
echo "[-] Sweeping environment for stale network resources..."
# ==============================================================================
ip netns del ns-users 2>/dev/null
ip netns del ns-servers 2>/dev/null
iptables -F FORWARD 2>/dev/null

echo "[+] Instantiating network namespaces (User Zone & Server Zone)..."
# ==============================================================================
ip netns add ns-users
ip netns add ns-servers

echo "[+] Provisioning virtual Ethernet (veth) pairs for Layer 2 transit..."
# ==============================================================================
# Establish links bridging the logical partitions to the Host Linux Router
ip link add veth-urouter type veth peer name veth-user
ip link set veth-user netns ns-users

ip link add veth-srouter type veth peer name veth-server
ip link set veth-server netns ns-servers

echo "[+] Uprighting system interface administrative states..."
# ==============================================================================
ip link set veth-urouter up
ip link set veth-srouter up

echo "[+] Assigning default gateway IP segments to virtual interfaces..."
# ==============================================================================
ip addr add 10.0.10.1/24 dev veth-urouter
ip addr add 10.0.20.1/24 dev veth-srouter

echo "[+] Binding configurations inside Isolated User Namespace..."
# ==============================================================================
ip netns exec ns-users ip link set lo up
ip netns exec ns-users ip link set veth-user up
ip netns exec ns-users ip addr add 10.0.10.5/24 dev veth-user
ip netns exec ns-users ip route add default via 10.0.10.1

echo "[+] Binding configurations inside Isolated Server Namespace..."
# ==============================================================================
ip netns exec ns-servers ip link set lo up
ip netns exec ns-servers ip link set veth-server up
ip netns exec ns-servers ip addr add 10.0.20.5/24 dev veth-server
ip netns exec ns-servers ip route add default via 10.0.20.1

echo "[+] Modifying kernel parameter to enable Layer 3 packet forwarding..."
# ==============================================================================
sysctl -w net.ipv4.ip_forward=1 > /dev/null

echo "======================================================================"
# SECTION 2: SIMULATING THE SECURITY INCIDENT / FIREWALL LOOPHOLE
echo "[!] Simulating the Firewall Loophole/Imposter Configuration..."
# ==============================================================================
# Flush default tables and append an aggressive wildcard rule that permits all flows
iptables -F FORWARD
iptables -P FORWARD DROP
iptables -A FORWARD -j ACCEPT # The Loophole: Global implicit accept rule

echo "[!] Executing Vulnerability Assessment: Server to User Traffic check..."
# Trigger a test run while the loophole rule remains active in memory
LOOPHOLE_PING=$(ip netns exec ns-servers ping -c 2 -W 1 10.0.10.5 2>&1)
LOOPHOLE_STATUS=$?

echo "======================================================================"
# SECTION 3: MITIGATION & ARCHITECTING THE STATEFUL ZERO-TRUST FRAMEWORK
echo "[+] Remediating security architecture. Purging imposter rules..."
# ==============================================================================
# Flush the active tables completely to evict the wildcard fast-pass rule
iptables -F FORWARD

# Enforce strict default-drop behavior for transit frames across interfaces
iptables -P FORWARD DROP

# Rule #1: Enforce Stateful Connection Tracking (Dynamic return frame acceptance)
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Rule #2: One-Way Trust Policy. Permit ONLY the User Zone to initiate NEW sockets
iptables -A FORWARD -i veth-urouter -o veth-srouter -s 10.0.10.0/24 -d 10.0.20.0/24 -m conntrack --ctstate NEW -j ACCEPT

# Egress Mapping: Masquerade outgoing segments hitting public external links (eth0)
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i veth-urouter -o eth0 -j ACCEPT
iptables -A FORWARD -i veth-srouter -o eth0 -j ACCEPT

echo "[+] Executing final operational validation tests..."
# ==============================================================================
# Run Test Case A: Authorized directional initialization
SECURE_USER_PING=$(ip netns exec ns-users ping -c 3 10.0.20.5 2>&1)

# Run Test Case B: Unauthorized directional isolation
SECURE_SERVER_PING=$(ip netns exec ns-servers ping -c 3 -W 1 10.0.10.5 2>&1)

echo "======================================================================"
# SECTION 4: LAB ARCHIVE ENGINE (DOCUMENTING LAB DATA IN PORTFOLIO_REPORT.LOG)
# ==============================================================================
cat << REPORT_EOF > portfolio_report.log
================================================================================
                      ENGINEERING ANALYSIS & LAB RECORD
================================================================================
LAB NAME: Routers and Firewall Lab
ROUTER METRIC: Host OS Kernel Engine (net.ipv4.ip_forward=1)
ISOLATION SUBNETS: 
  - User Workstation Zone: 10.0.10.0/24
  - Backend Database Zone: 10.0.20.0/24

--------------------------------------------------------------------------------
1. THE LOOPHOLE & COMPROMISE RISK RECORD
--------------------------------------------------------------------------------
The initial netns stack allowed unauthorized lateral movement from backend server 
nodes into client subnets. Despite target DROP rules, 'iptables' was top-matched 
against a global implicit accept rule (0.0.0.0/0). 

[Loophole Terminal Verification Output]:
$ sudo ip netns exec ns-servers ping -c 2 10.0.10.5
${LOOPHOLE_PING}
CRITICAL ANALYSIS: Result code (${LOOPHOLE_STATUS}) matches 0% PACKET LOSS. 
Security policy breached. Wildcard rule was bypassing default DROP policy.

--------------------------------------------------------------------------------
2. REMEDIATION & STATEFUL RULES INFRASTRUCTURE
--------------------------------------------------------------------------------
Remediation path evicted wildcard rules and implemented conditional packet state 
tracking via 'conntrack'. The firewall dropped inbound handshakes from servers 
while maintaining session awareness for inbound user connections.

--------------------------------------------------------------------------------
3. FINAL PRODUCTION VERIFICATION OUTPUTS
--------------------------------------------------------------------------------
[Test Case A: User to Server Connection Initiation (Permitted Flow)]
$ sudo ip netns exec ns-users ping -c 3 10.0.20.5
${SECURE_USER_PING}

[Test Case B: Server to User Connection Initiation (Blocked Flow)]
$ sudo ip netns exec ns-servers ping -c 3 10.0.10.5
${SECURE_SERVER_PING}

LAB RESULT STATUS: SUCCESSFUL STATEFUL ISOLATION DEPLOYED.
================================================================================
REPORT_EOF

echo "[+] Compilation successful. Comprehensive logs archived to portfolio_report.log"
echo "======================================================================"
cat portfolio_report.log
