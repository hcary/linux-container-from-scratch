# Linux Container From Scratch

This project demonstrates how to build a minimal Linux container environment from scratch using Bash scripts, Linux namespaces, cgroups, and basic networking tools. It is intended for educational purposes and for those interested in understanding the low-level mechanics behind containerization.

## Features

- **Root Filesystem Creation:** Uses `debootstrap` to create a minimal Debian root filesystem.
- **Namespace Isolation:** Sets up new mount, UTS, IPC, PID, and network namespaces for the container.
- **Virtual Networking:** Creates a virtual Ethernet pair and configures a dedicated network namespace.
- **NAT and Forwarding:** Uses `iptables` to enable NAT and forwarding between the container and the host.
- **Resource Limits:** Example scripts for cgroup v2 memory limiting.
- **Cleanup:** Automated teardown of namespaces, interfaces, iptables rules, and root filesystem.

## Requirements

- Linux system (tested on kernel 6.x)
- Root privileges
- `debootstrap`, `iproute2`, `iptables`, `unshare`
- Network interface name (default: `enp0s3`, adjust as needed)

## Usage

### 1. Environment Setup

Edit `env-setup` to set the `TARGET` directory and any other environment variables.

### 2. Build and Start Container

```bash
sudo ./mk-container
```

This will:
- Create a new root filesystem at `$TARGET`
- Set up namespaces and networking
- Configure NAT and forwarding

### 3. Run a Demo Process (Optional)

You can use the provided Python memory leak demo:

```bash
sudo python3 src/cgroup-demo/mem-leak.py
```

### 4. Cleanup

To undo all changes and clean up:

```bash
sudo ./mk-container-cleanup
```

This will:
- Remove network namespaces and veth pairs
- Delete iptables rules
- Unmount filesystems
- Remove the root filesystem

## Notes

- The scripts assume the use of `enp0s3` as the host network interface. Change this in the scripts if your interface is different.
- All destructive actions (like removing `$TARGET`) are performed without confirmation.
- Use with caution on production systems.

## Files

- `mk-container` — Main script to build and start the container environment
- `mk-container-cleanup` — Script to tear down and clean up everything
- `env-setup` — Environment variable definitions (edit as needed)
- `src/cgroup-demo/mem-leak.py` — Python demo for cgroup memory limiting

## License

MIT License

---

**For educational use only.**