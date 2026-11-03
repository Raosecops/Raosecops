---
title: "Automated Terraform Security & Compliance Pipeline with Checkov and GitHub Actions"
description: "How to catch infrastructure security flaws early by automating Checkov static analysis in CI/CD pipelines using GitHub Actions."
pubDate: 2026-10-20
author: "Rao T"
tags: ["DevSecOps", "Terraform", "GitHub Actions", "Checkov", "AWS"]
---

## Introduction

In modern Cloud and Infrastructure as Code (IaC) environments, misconfigurations can directly lead to security breaches. Waiting for manual code reviews or post-deployment audits to find vulnerabilities is inefficient and risky. 

In this project, I built an automated DevSecOps pipeline that integrates **Checkov** static analysis into **GitHub Actions** to automatically audit Terraform configurations on every code push and pull request.

---

## Key Security Architecture & Workflow

The pipeline acts as a security gatekeeper for IaC deployments:

1. **Local Infrastructure Definition:** Developers write Terraform code to provision AWS resources.
2. **Local Security Audit:** Checkov is executed locally to identify immediate security flaws before committing code.
3. **Automated CI/CD Gating (`security.yml`):** Upon pushing code to GitHub, GitHub Actions triggers the `security.yml` workflow, provisioning an isolated runner that automatically scans all `.tf` files with Checkov.
4. **Compliance Assurance:** If any security check fails, the pipeline blocks the deployment until compliance issues are remediated.

---

## Remediating Infrastructure Vulnerabilities

During development, Checkov flagged critical security findings that were remediated before reaching production:

### 1. Restricting Open SSH Ingress (`CKV_AWS_24`)
* **Issue:** Security Groups permitted unrestricted SSH access (`0.0.0.0/0` on Port 22), exposing instances to brute-force attacks across the public internet.
* **Remediation:** Restricted SSH ingress rules strictly to authorized internal corporate IP CIDR blocks (`10.0.0.0/8`).

### 2. Customer-Managed KMS Key Encryption for CloudWatch (`CKV_AWS_158`)
* **Issue:** VPC Flow Logs were set to stream to AWS CloudWatch Log Groups without customer-managed encryption.
* **Remediation:** Provisioned a dedicated AWS Key Management Service (KMS) key (`aws_kms_key`) with strict access policies (`CKV2_AWS_64`) to encrypt log data at rest.

---

## Key Takeaways

By embedding automated security tooling directly into the version control workflow, security checks shift left into the development cycle. This guarantees that infrastructure flaws are identified and resolved before code is ever merged into main or deployed to AWS.
