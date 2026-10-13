---
title: "SSH hardening basics for a new Linux server"
description: "Four small changes that make a fresh server much harder to break into."
date: 2026-10-13
tags: ["linux", "hardening"]
---

A fresh Linux server with SSH open to the internet starts getting login attempts within minutes. These four changes remove most of the easy wins for attackers.

## 1. Use keys instead of passwords

Passwords can be guessed. SSH keys effectively cannot. Copy your public key to the server first, and confirm you can log in with it:

```bash
ssh-copy-id user@your-server
ssh user@your-server
```

## 2. Edit the SSH configuration

Open `/etc/ssh/sshd_config` and set:

```text
PasswordAuthentication no
PermitRootLogin no
```

The first turns off password logins. The second stops anyone logging in directly as `root`.

## 3. Check the config, then reload

Keep your current session open while you do this. A typo can lock you out.

```bash
sudo sshd -t
sudo systemctl reload ssh
```

Open a second terminal and confirm you can still log in before closing the first one. On some distributions the service is called `sshd` instead of `ssh`.

## 4. Keep the system updated

Most breaches use known flaws that already have fixes. Turn on automatic security updates, for example with `unattended-upgrades` on Debian and Ubuntu.

## Next steps

These are the basics, not the whole job. A firewall, login monitoring and tools like `fail2ban` are good follow-ups, and I'll cover them in later posts.
