#!/bin/bash
set -e

echo "=== Patching CVEs ==="

# Patch CVE-2026-31431 (Copy Fail)
echo "[*] Patching CVE-2026-31431..."
cat > /etc/modprobe.d/cve-2026-31431-copy-fail.conf <<EOF
blacklist algif_aead
install algif_aead /bin/false
EOF
modprobe -r algif_aead 2>/dev/null || true

# Patch CVE-2026 (Dirty Frag)
echo "[*] Patching CVE-2026 Dirty Frag..."
cat > /etc/modprobe.d/cve-2026-dirty-frag.conf <<EOF
blacklist esp4
install esp4 /bin/false
blacklist esp6
install esp6 /bin/false
blacklist rxrpc
install rxrpc /bin/false
EOF
modprobe -r esp4 2>/dev/null || true
modprobe -r esp6 2>/dev/null || true
modprobe -r rxrpc 2>/dev/null || true
echo 3 > /proc/sys/vm/drop_caches

# Update kernel
echo "[*] Updating kernel..."
apt-get update
apt-get upgrade -y

echo "[!] Reboot required"
