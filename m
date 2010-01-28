From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] Bump dnsmasq to 2.52
Message-ID: <20100128150631.0F44077719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3416f262f9c1120eb7900b83615b453f99896258
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #961.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 ++-
 package/dnsmasq/dnsmasq.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 25b955c..a0a6e08 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
-	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
+	directfb, dnsmasq, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
 	iw, jpeg, kismet, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
 	mtd-utils, neon, openvpn, pcre, qt, rpm, sdl, sdl_ttf, sqlite, sshfs,
 	tremor, u-boot, usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
@@ -37,6 +37,7 @@
 	#931: Bump kismet package to 2010-01-R1
 	#937: Bump openvpn package to 2.1.1
 	#943: Bump sqlite package to 3.6.22
+	#961: Bump dnsmasq to 2.52
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 6d66d09..86b3eef 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.51
+DNSMASQ_VERSION = 2.52
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_AUTORECONF = NO
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
-- 
1.6.3.3
