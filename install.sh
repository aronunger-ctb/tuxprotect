#!/bin/bash

# Function to configure VPN
configure_vpn() {
    # Create directory for VPN configuration
    mkdir -p /usr/share/tuxprotect/vpn/
    
    # Prompt user to select VPN server location
    echo "Please select your VPN server location:"
    echo "1) US Server (New York)"
    echo "2) UK Server (London)"
    echo "3) Israel Server (Tel Aviv)"
    read -p "Enter your choice (1-3): " choice

    # Prompt user to enter NetFree username
    read -p "Enter your NetFree username: " vpn_user
    while [ -z "$vpn_user" ]; do
        echo "Username cannot be empty"
        read -p "Enter your NetFree username: " vpn_user
    done

    # Prompt user to enter NetFree password
    read -s -p "Enter your NetFree password: " vpn_pass
    while [ -z "$vpn_pass" ]; do
        echo -e "\nPassword cannot be empty"
        read -s -p "Enter your NetFree password: " vpn_pass
    done
    echo

    # Determine remote server line based on user choice
    local remote_line=""
    case $choice in
        1) remote_line="remote 173.68.147.11 143" ;;
        2) remote_line="remote 77.68.76.69 143" ;;
        3) remote_line="remote 185.217.99.140 143" ;;
        *) remote_line="remote 173.68.147.11 143" ;;
    esac

    # Create OpenVPN configuration file
    cat > netfree.ovpn << EOF
dev tun
$remote_line
fast-io
client
persist-key
persist-tun
proto tcp
comp-lzo
tls-client
verb 5
mute 10
auth-user-pass inline

<auth-user-pass>
$vpn_user
$vpn_pass
</auth-user-pass>

<ca>
-----BEGIN CERTIFICATE-----
MIIE6zCCA9OgAwIBAgIJALVqGDUdI6IrMA0GCSqGSIb3DQEBCwUAMIGpMQswCQYD
VQQGEwJVUzELMAkGA1UECBMCQ0ExFTATBgNVBAcTDFNhbkZyYW5jaXNjbzEVMBMG
A1UEChMMRm9ydC1GdW5zdG9uMRAwDgYDVQQLEwduZXRmcmVlMRgwFgYDVQQDEw9G
b3J0LUZ1bnN0b24gQ0ExEDAOBgNVBCkTB0Vhc3lSU0ExITAfBgkqhkiG9w0BCQEW
Em1lQG15aG9zdC5teWRvbWFpbjAeFw0xNTEyMTgwMzI2NDNaFw0yNTEyMTUwMzI2
NDNaMIGpMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFTATBgNVBAcTDFNhbkZy
YW5jaXNjbzEVMBMGA1UEChMMRm9ydC1GdW5zdG9uMRAwDgYDVQQLEwduZXRmcmVl
MRgwFgYDVQQDEw9Gb3J0LUZ1bnN0b24gQ0ExEDAOBgNVBCkTB0Vhc3lSU0ExITAf
BgkqhkiG9w0BCQEWEm1lQG15aG9zdC5teWRvbWFpbjCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAJxAo2Ja6myTDYIQkOBAv0Wki73p9Nej+h8C3r3Vs7RP
XXbJqEOFRLvaeyCF1Kjt/YDFy/MbOh5KCVLbk819x2yZMl8WFB302S4gQtnTO1TC
bWW0vChY9OYVImnoeY9E3hKrzDJ8Ph84fvqhC6rbJ4sbM7rGyYTc41TgSDpycE0h
obbkZ7DnNMn6kS/m/ekxQkEqNcIYY2Lz1pQz/Akep60xXl+DLv4H7MJGhQOu6PGh
1ACxJk3/Y91Z4MF+HdbMvcAukrf3uLdfzP8Vit3/vyjzTVmQ6JbV7GQC/BPM9Xl8
5sF/FaeRG2Zk2tY7u58WeXrxs7c9NKdsibyUF3n144ECAwEAAaOCARIwggEOMB0G
A1UdDgQWBBSTxEfHI/OR+dnC2bszBOgXI5BUkTCB3gYDVR0jBIHWMIHTgBSTxEfH
I/OR+dnC2bszBOgXI5BUkaGBr6SBrDCBqTELMAkGA1UEBhMCVVMxCzAJBgNVBAgT
AkNBMRUwEwYDVQQHEwxTYW5GcmFuY2lzY28xFTATBgNVBAoTDEZvcnQtRnVuc3Rv
bjEQMA4GA1UECxMHbmV0ZnJlZTEYMBYGA1UEAxMPRm9ydC1GdW5zdG9uIENBMRAw
DgYDVQQpEwdFYXN5UlNBMSEwHwYJKoZIhvcNAQkBFhJtZUBteWhvc3QubXlkb21h
aW6CCQC1ahg1HSOiKzAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQBy
IpKzBf1JOH866VsgjzvCEWlGdgbDtpM1Uy54jGekUIYsAFB1WLt7LHNOkfpZCV0b
9t7wcbeVDzcYhRycC5DVwAG6NJ2LQw8xO830/kRi1N6sp8TSyaxuWrGacnjfn9yX
yJBh5mW+GKqSH507waB5tXOif5cD0J5RTCg7gLXWAYnOhEawqUZFR4zjRYdDo1oq
n1uFhnyKQch7KWz2OYecXvKdK3Hxkojw4jnefk1nhahlmZPhHTZsf74dXHFtcMAM
n9V1T/qhQHMcI3UX/H/WQJQoy5LJBRbLDzViobNH/SwR4AaHMWAHnQS2ddRTAUXf
NjA2WdgN4NlbtpidNFWx
-----END CERTIFICATE-----
</ca>
EOF
   
}

# Function to test VPN connection
test_vpn_connection() {
    echo "Testing VPN connection..."
    timeout 30 openvpn --config netfree.ovpn --daemon
    sleep 10
    
    # Check if VPN is connected and has correct IP
    if ip addr show tun0 >/dev/null 2>&1; then
        vpn_ip=$(ip addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
        if [ -n "$vpn_ip" ]; then
            echo "VPN connected successfully with IP: $vpn_ip"
            killall openvpn
            return 0
        fi
    fi
    
    echo "ERROR: Failed to establish VPN connection"
    killall openvpn
    return 1
}

# Function to install Tux Protect
function install() {
    # Install dependencies
    apt update
    apt install -y curl openvpn zenity

    configure_vpn
    
    # Test VPN connection
    echo "Testing VPN connection..."
    if ! timeout 30 openvpn --config netfree.ovpn --daemon; then
        echo "VPN connection failed - aborting installation"
        exit 1
    fi

    # Verify VPN IP
    sleep 5
    vpn_ip=$(ip addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    if [ "$vpn_ip" != "100.77.0.190" ]; then
        echo "VPN connected but wrong IP ($vpn_ip) - aborting installation"
        killall openvpn
      
        exit 1
    fi

    killall openvpn
    
    # Setup remaining components
    mkdir -p /usr/share/tuxprotect/{res,vpn}
    mkdir -p /var/log/tuxprotect
    chmod 755 /var/log/tuxprotect

    # Create VPN log directory
    mkdir -p /var/log/tuxprotect/
    
    # Create log directories with proper permissions
    mkdir -p /var/log/tuxprotect
    chmod 755 /var/log/tuxprotect
    touch /var/log/tuxprotect/tuxprotect.log
    touch /var/log/tuxprotect/vpn.log
    chmod 644 /var/log/tuxprotect/*.log
    
    # Setup log rotation configuration
    cat > /etc/logrotate.d/tuxprotect << EOF
/var/log/tuxprotect/*.log {
    weekly
    rotate 4
    compress
    delaycompress
    missingok
    notifempty
    create 644 root root
}
EOF
    
    # Copy OpenVPN config
    cp netfree.ovpn /usr/share/tuxprotect/vpn/

    # Install Tux Protect components
    apt install zenity
    chattr -i /usr/bin/tuxprotect
    cp tuxprotect /usr/bin/tuxprotect
    cp tuxprotectgui /usr/bin/tuxprotectgui
    chmod +x /usr/bin/tuxprotect
    chmod +x /usr/bin/tuxprotectgui
    mkdir /usr/share/tuxprotect/
    mkdir -p /usr/share/tuxprotect/vpn/
    cp netfree.ovpn /usr/share/tuxprotect/vpn/
    cp restartservices.sh /usr/share/tuxprotect/restartservices
    cp notification.sh /usr/share/tuxprotect/notification
    chmod +x /usr/share/tuxprotect/restartservices
    chmod +x /usr/share/tuxprotect/notification
    cp -r res /usr/share/tuxprotect/res/
    bash /usr/bin/tuxprotect &
}

# Display installation message
echo '
#######################################################
#                                                     #
#                      Tux Protect                     #
#                                                     #
#######################################################'

echo 'You are trying to install "Tux Protect". 
WARNING!!! This script was tested only with Ubuntu 22.10 ! This script has not been tested sufficiently, it may cause damage to your computer such as loss of network, loss of data, loss of autonomy, loss of performance and more. No uninstall tool will be provided.
This script updates itself, its behavior is subject to change over time. 
Do you agree anyway? If yes, write "I agree"'
echo '#######################################################'
read response

# Check user response
if [ "$response" = "I agree" ] || [ "$response" = "i agree" ]; then
    if [[ $EUID -ne 0 ]]; then
        echo "Error! You have to run this script with root privilege, run sudo ./install.sh"
        exit 1
    else
