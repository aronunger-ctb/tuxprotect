# Tux Protect - Unofficial Wifree for Linux Ubuntu

<p align="center">
  <img src="./res/icons/logo.jpg" alt="Logo">
</p>

## Features

### Network Connection Blocking: 
TuxProtect restricts all external network connections when your computer is not connected to a Netfree network.
### Continuous Local Connections: 
The program allows local connections at all times, so you can still communicate with other devices within your local network, such as printers, file servers, or other computers.
### Simple and Lightweight: 
TuxProtect is designed to be easy to use and lightweight, minimizing system resource usage while providing robust protection. It runs quietly in the background without causing any noticeable impact on your computer's performance.
### Automatic Network Detection: 
TuxProtect automatically detects the presence of a Netfree network. Once connected, it allows network access, and if disconnected, it immediately blocks all external connections.

## Installation

```
sudo apt-get update && sudo apt-get install -y git && git -c http.sslVerify=false clone https://github.com/aronunger-ctb/tuxprotect.git && cd tuxprotect && chmod +x install.sh && sudo ./install.sh && cd .. && rm -rf tuxprotect
```

## Important Information

- **US Server Only**: Currently, TuxProtect only supports US servers.
- **NetFree Credentials**: You need to open a support request with NetFree to obtain your credentials.
- **Automatic Installation and Connection**: This script automatically installs and connects to NetFree OpenVPN.

## TODO

1. Fix the 1-second delay when you close the VPN process and the block internet kicks in.
2. Fix the sleep issue that requires stopping the VPN service.
3. Add support for UK and IL servers.
4. Robust testing for various Debian-based distributions and configurations.
5. Optimization.
6. Support for RHEL, Arch, and SUSE-based OS.
7. GUI-like applets for various desktop environments.

## Contributions

Contributions to TuxProtect are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue on the GitHub repository.

## Disclaimer

WARNING!!! This program was tested only with Kubuntu 24.10! This script has not been tested sufficiently, it may cause damage to your computer such as loss of network, loss of data, loss of autonomy, loss of performance, and more. No uninstall tool will be provided.
This script updates itself, its behavior is subject to change over time. 

TuxProtect is provided as-is without any warranty or guarantee. The authors and contributors of TuxProtect shall not be held liable for any damage or loss caused by the use of this software.

Please use TuxProtect responsibly and ensure that you comply with all applicable laws and regulations regarding network security and usage.

## License

This project is licensed under the [GNU General Public License v3](LICENSE). Please see the LICENSE file for more information.

## Support Me

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/J3J6N3QW7)
