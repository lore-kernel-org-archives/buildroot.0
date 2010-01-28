From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] Bump netstat-nat to 1.4.10
Message-ID: <20100128150631.44F6477719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=60ce1b0842de5897b943017c404855c25ffe33da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #967.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |   10 ++++++----
 package/netstat-nat/netstat-nat.mk |    3 +--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index a0a6e08..48b958f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,10 +5,11 @@
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
-	directfb, dnsmasq, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
-	iw, jpeg, kismet, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
-	mtd-utils, neon, openvpn, pcre, qt, rpm, sdl, sdl_ttf, sqlite, sshfs,
-	tremor, u-boot, usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
+	directfb, dnsmasq, e2fsprogs, gstreamer, gst-plugins-bad, hal,
+	iptables, iw, jpeg, kismet, libfuse, libpcap, libungif, lighttpd,
+	mesa, mpg123, mtd-utils, neon, netstat-nat, openvpn, pcre, qt, rpm,
+	sdl, sdl_ttf, sqlite, sshfs, tremor, u-boot, usb_modeswitch,
+	usbutils, wpa_supplicant, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -38,6 +39,7 @@
 	#937: Bump openvpn package to 2.1.1
 	#943: Bump sqlite package to 3.6.22
 	#961: Bump dnsmasq to 2.52
+	#967: Bump netstat-nat to 1.4.10
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
index a3d4309..412b6fe 100644
--- a/package/netstat-nat/netstat-nat.mk
+++ b/package/netstat-nat/netstat-nat.mk
@@ -4,8 +4,7 @@
 #
 #############################################################
 
-NETSTAT_NAT_VERSION = 1.4.9
-NETSTAT_NAT_SOURCE = netstat-nat-$(NETSTAT_NAT_VERSION).tar.gz
+NETSTAT_NAT_VERSION = 1.4.10
 NETSTAT_NAT_SITE = http://tweegy.nl/download
 
 $(eval $(call AUTOTARGETS,package,netstat-nat))
-- 
1.6.3.3
