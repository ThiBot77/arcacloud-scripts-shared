# Arcacloud Scripts

Collection of system administration and security scripts for Arcacloud infrastructure.

## Structure

```
scripts/
├── security/      # Security patching and hardening scripts
```

## Scripts

### Security

- **`scripts/security/patch-cve.sh`** — Patches critical CVEs by blacklisting vulnerable kernel modules and updating the kernel
  - Handles CVE-2026-31431 (Copy Fail)
  - Handles CVE-2026 (Dirty Frag)
  - Requires root privileges
  - Requires system reboot after execution

## Usage

```bash
sudo ./scripts/security/patch-cve.sh
```

## Requirements

- Linux system (Debian/Ubuntu)
- Root privileges
- Internet connectivity for package updates

## Notes

- All security scripts require `sudo` or root access
- Some scripts may require system reboot
- Always review scripts before execution on production systems
