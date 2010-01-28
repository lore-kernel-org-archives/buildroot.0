From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 17:33:03 +0100
Subject: [Buildroot] [git commit master] sawman: bump to 1.4.3
Message-ID: <20100128163327.79F667774D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fee19b6a843de37289a323da913d0259fe78a769
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    4 ++--
 package/sawman/sawman.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1dd027b..eff3baf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	busybox, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
 	gst-plugins-bad, flex, hal, iptables, iw, jpeg, kismet, libfuse,
 	libglib2, libpcap, libungif, lighttpd, mesa, mpg123, mtd-utils, neon,
-	netstat-nat, openvpn, pcre, qt, rpm, sdl, sdl_ttf, ser2net, sqlite,
-	sshfs, tremor, u-boot, usb_modeswitch, usbutils, webkit,
+	netstat-nat, openvpn, pcre, qt, rpm, sawman, sdl, sdl_ttf, ser2net,
+	sqlite, sshfs, tremor, u-boot, usb_modeswitch, usbutils, webkit,
 	wpa_supplicant, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 01bb3da..1b53ea9 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,7 +3,7 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION:=1.4.2
+SAWMAN_VERSION:=1.4.3
 SAWMAN_SOURCE:=SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
-- 
1.6.3.3
