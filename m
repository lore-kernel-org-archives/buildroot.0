From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Feb 2019 11:35:22 +0100
Subject: [Buildroot] [git commit] packages: update sysv S* scripts to 644
Message-ID: <20190208103753.7D6468149C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=590e9e05b683ee521d4984b5cb77a590ebb3fd17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpid/S02acpid                           | 0
 package/am33x-cm3/S93-am335x-pm-firmware-load    | 0
 package/at/S99at                                 | 0
 package/avahi/S05avahi-setup.sh                  | 0
 package/avahi/S50avahi-daemon                    | 0
 package/busybox/S50telnet                        | 0
 package/chrony/S49chrony                         | 0
 package/connman/S45connman                       | 0
 package/darkhttpd/S50darkhttpd                   | 0
 package/dhcp/S80dhcp-relay                       | 0
 package/dhcp/S80dhcp-server                      | 0
 package/dhcpcd/S41dhcpcd                         | 0
 package/dnsmasq/S80dnsmasq                       | 0
 package/docker-engine/S60dockerd                 | 0
 package/eudev/S10udev                            | 0
 package/haveged/S21haveged                       | 0
 package/ifupdown-scripts/S40network              | 0
 package/initscripts/init.d/S20urandom            | 0
 package/input-event-daemon/S99input-event-daemon | 0
 package/kodi/S50kodi                             | 0
 package/linuxptp/S65linuxptp                     | 0
 package/lirc-tools/S25lircd                      | 0
 package/modem-manager/S44modem-manager           | 0
 package/neard/S53neard                           | 0
 package/netatalk/S50netatalk                     | 0
 package/netplug/S29netplug                       | 0
 package/netsnmp/S59snmpd                         | 0
 package/network-manager/S45network-manager       | 0
 package/nfs-utils/S60nfs                         | 0
 package/nginx/S50nginx                           | 0
 package/nodm/S90nodm                             | 0
 package/ofono/S46ofono                           | 0
 package/olsr/S50olsr                             | 0
 package/openntpd/S49ntp                          | 0
 package/openvpn/S60openvpn                       | 0
 package/owfs/S25owserver                         | 0
 package/owfs/S30owfs                             | 0
 package/proftpd/S50proftpd                       | 0
 package/ptpd/S65ptpd                             | 0
 package/ptpd2/S65ptpd2                           | 0
 package/pulseaudio/S50pulseaudio                 | 0
 package/rabbitmq-server/S50rabbitmq-server       | 0
 package/radvd/S50radvd                           | 0
 package/rng-tools/S21rngd                        | 0
 package/rpi-userland/S94vcfiled                  | 0
 package/squid/S97squid                           | 0
 package/supervisor/S99supervisord                | 0
 package/targetcli-fb/S50target                   | 0
 package/tcf-agent/S55tcf-agent                   | 0
 package/tftpd/S80tftpd-hpa                       | 0
 package/tinyhttpd/S85tinyhttpd                   | 0
 package/tpm2-abrmd/S80tpm2-abrmd                 | 0
 package/triggerhappy/S10triggerhappy             | 0
 package/vsftpd/S70vsftpd                         | 0
 package/x11r7/xserver_xorg-server/S40xorg        | 0
 55 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/acpid/S02acpid b/package/acpid/S02acpid
old mode 100755
new mode 100644
diff --git a/package/am33x-cm3/S93-am335x-pm-firmware-load b/package/am33x-cm3/S93-am335x-pm-firmware-load
old mode 100755
new mode 100644
diff --git a/package/at/S99at b/package/at/S99at
old mode 100755
new mode 100644
diff --git a/package/avahi/S05avahi-setup.sh b/package/avahi/S05avahi-setup.sh
old mode 100755
new mode 100644
diff --git a/package/avahi/S50avahi-daemon b/package/avahi/S50avahi-daemon
old mode 100755
new mode 100644
diff --git a/package/busybox/S50telnet b/package/busybox/S50telnet
old mode 100755
new mode 100644
diff --git a/package/chrony/S49chrony b/package/chrony/S49chrony
old mode 100755
new mode 100644
diff --git a/package/connman/S45connman b/package/connman/S45connman
old mode 100755
new mode 100644
diff --git a/package/darkhttpd/S50darkhttpd b/package/darkhttpd/S50darkhttpd
old mode 100755
new mode 100644
diff --git a/package/dhcp/S80dhcp-relay b/package/dhcp/S80dhcp-relay
old mode 100755
new mode 100644
diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
old mode 100755
new mode 100644
diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
old mode 100755
new mode 100644
diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
old mode 100755
new mode 100644
diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
old mode 100755
new mode 100644
diff --git a/package/eudev/S10udev b/package/eudev/S10udev
old mode 100755
new mode 100644
diff --git a/package/haveged/S21haveged b/package/haveged/S21haveged
old mode 100755
new mode 100644
diff --git a/package/ifupdown-scripts/S40network b/package/ifupdown-scripts/S40network
old mode 100755
new mode 100644
diff --git a/package/initscripts/init.d/S20urandom b/package/initscripts/init.d/S20urandom
old mode 100755
new mode 100644
diff --git a/package/input-event-daemon/S99input-event-daemon b/package/input-event-daemon/S99input-event-daemon
old mode 100755
new mode 100644
diff --git a/package/kodi/S50kodi b/package/kodi/S50kodi
old mode 100755
new mode 100644
diff --git a/package/linuxptp/S65linuxptp b/package/linuxptp/S65linuxptp
old mode 100755
new mode 100644
diff --git a/package/lirc-tools/S25lircd b/package/lirc-tools/S25lircd
old mode 100755
new mode 100644
diff --git a/package/modem-manager/S44modem-manager b/package/modem-manager/S44modem-manager
old mode 100755
new mode 100644
diff --git a/package/neard/S53neard b/package/neard/S53neard
old mode 100755
new mode 100644
diff --git a/package/netatalk/S50netatalk b/package/netatalk/S50netatalk
old mode 100755
new mode 100644
diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
old mode 100755
new mode 100644
diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
old mode 100755
new mode 100644
diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
old mode 100755
new mode 100644
diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
old mode 100755
new mode 100644
diff --git a/package/nginx/S50nginx b/package/nginx/S50nginx
old mode 100755
new mode 100644
diff --git a/package/nodm/S90nodm b/package/nodm/S90nodm
old mode 100755
new mode 100644
diff --git a/package/ofono/S46ofono b/package/ofono/S46ofono
old mode 100755
new mode 100644
diff --git a/package/olsr/S50olsr b/package/olsr/S50olsr
old mode 100755
new mode 100644
diff --git a/package/openntpd/S49ntp b/package/openntpd/S49ntp
old mode 100755
new mode 100644
diff --git a/package/openvpn/S60openvpn b/package/openvpn/S60openvpn
old mode 100755
new mode 100644
diff --git a/package/owfs/S25owserver b/package/owfs/S25owserver
old mode 100755
new mode 100644
diff --git a/package/owfs/S30owfs b/package/owfs/S30owfs
old mode 100755
new mode 100644
diff --git a/package/proftpd/S50proftpd b/package/proftpd/S50proftpd
old mode 100755
new mode 100644
diff --git a/package/ptpd/S65ptpd b/package/ptpd/S65ptpd
old mode 100755
new mode 100644
diff --git a/package/ptpd2/S65ptpd2 b/package/ptpd2/S65ptpd2
old mode 100755
new mode 100644
diff --git a/package/pulseaudio/S50pulseaudio b/package/pulseaudio/S50pulseaudio
old mode 100755
new mode 100644
diff --git a/package/rabbitmq-server/S50rabbitmq-server b/package/rabbitmq-server/S50rabbitmq-server
old mode 100755
new mode 100644
diff --git a/package/radvd/S50radvd b/package/radvd/S50radvd
old mode 100755
new mode 100644
diff --git a/package/rng-tools/S21rngd b/package/rng-tools/S21rngd
old mode 100755
new mode 100644
diff --git a/package/rpi-userland/S94vcfiled b/package/rpi-userland/S94vcfiled
old mode 100755
new mode 100644
diff --git a/package/squid/S97squid b/package/squid/S97squid
old mode 100755
new mode 100644
diff --git a/package/supervisor/S99supervisord b/package/supervisor/S99supervisord
old mode 100755
new mode 100644
diff --git a/package/targetcli-fb/S50target b/package/targetcli-fb/S50target
old mode 100755
new mode 100644
diff --git a/package/tcf-agent/S55tcf-agent b/package/tcf-agent/S55tcf-agent
old mode 100755
new mode 100644
diff --git a/package/tftpd/S80tftpd-hpa b/package/tftpd/S80tftpd-hpa
old mode 100755
new mode 100644
diff --git a/package/tinyhttpd/S85tinyhttpd b/package/tinyhttpd/S85tinyhttpd
old mode 100755
new mode 100644
diff --git a/package/tpm2-abrmd/S80tpm2-abrmd b/package/tpm2-abrmd/S80tpm2-abrmd
old mode 100755
new mode 100644
diff --git a/package/triggerhappy/S10triggerhappy b/package/triggerhappy/S10triggerhappy
old mode 100755
new mode 100644
diff --git a/package/vsftpd/S70vsftpd b/package/vsftpd/S70vsftpd
old mode 100755
new mode 100644
diff --git a/package/x11r7/xserver_xorg-server/S40xorg b/package/x11r7/xserver_xorg-server/S40xorg
old mode 100755
new mode 100644
