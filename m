From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Feb 2010 12:11:37 +0100
Subject: [Buildroot] [git commit master] CHANGES: ser2net is a new package
Message-ID: <20100204111215.CAFFB77771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=731f3c3ea80f1d8f2e5b04db6ce4c47bc7fc8cbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c97a64b..40b5ae5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,8 @@
 
 	Toolchain: uClibc 0.9.30.2, gcc 4.4.3
 
-	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
+	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, ser2net,
+	tcpreplay
 
 	Updated/fixed packages: alsa-lib, alsa-utils, at, autoconf, bash,
 	bind, binutils, bootutils, busybox, dbus, directfb, dnsmasq,
@@ -10,8 +11,8 @@
 	iptables, iw, jpeg, kismet, libfuse, libglib2, libpcap, libungif,
 	libxml2, libxslt, lighttpd, mesa, mpg123, mtd-utils, nbd, neon,
 	netstat-nat, openvpn, pcre, php, qt, readline, rpm, sawman, sdl,
-	sdl_ttf, ser2net, sqlite, sshfs, tremor, u-boot, usb_modeswitch,
-	usbutils, webkit, wpa_supplicant, xfsprogs, zlib
+	sdl_ttf, sqlite, sshfs, tremor, u-boot, usb_modeswitch, usbutils,
+	webkit, wpa_supplicant, xfsprogs, zlib
 
 	Issues resolved (http://bugs.uclibc.org):
 
-- 
1.6.3.3
