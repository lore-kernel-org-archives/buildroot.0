From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Feb 2010 15:32:52 +0100
Subject: [Buildroot] [git commit master] newt: needs slang
Message-ID: <20100208151038.2E7587770F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fdb2b2d6a0dd10d47f6e36feabac460acaab844d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/newt/Config.in |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 088de1f..a387063 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,7 @@
 	bind, binutils, bootutils, busybox, dbus, directfb, dnsmasq,
 	e2fsprogs, gstreamer, gperf, gst-plugins-bad, gvfs, fbdump, flex, hal,
 	iptables, iw, jpeg, kismet, libfuse, libglib2, libpcap, libungif,
-	libxml2, libxslt, lighttpd, mesa, mpg123, mtd-utils, nbd, neon,
+	libxml2, libxslt, lighttpd, mesa, mpg123, mtd-utils, newt, nbd, neon,
 	netstat-nat, openvpn, pcre, php, qt, readline, rpm, sawman, sdl,
 	sdl_ttf, sqlite, sshfs, tremor, u-boot, usb_modeswitch, usbutils,
 	webkit, wpa_supplicant, xfsprogs, zlib
diff --git a/package/newt/Config.in b/package/newt/Config.in
index 067d811..ae6b69c 100644
--- a/package/newt/Config.in
+++ b/package/newt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NEWT
 	bool "newt"
+	select BR2_PACKAGE_SLANG
 	help
 	  Programming library for color text mode, widget based user interfaces.
 
-- 
1.6.3.3
