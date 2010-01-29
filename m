From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jan 2010 15:00:16 +0100
Subject: [Buildroot] [git commit master] Bump php to 5.2.12
Message-ID: <20100129140040.1833277751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e052e9709ae64384f1d4ab39d1e95ad980ffb070
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    6 +++---
 package/php/php.mk |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 311d906..8f37e50 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,9 +9,9 @@
 	e2fsprogs, gstreamer, gperf, gst-plugins-bad, gvfs, flex, hal,
 	iptables, iw, jpeg, kismet, libfuse, libglib2, libpcap, libungif,
 	libxml2, libxslt, lighttpd, mesa, mpg123, mtd-utils, neon,
-	netstat-nat, openvpn, pcre, qt, readline, rpm, sawman, sdl, sdl_ttf,
-	ser2net, sqlite, sshfs, tremor, u-boot, usb_modeswitch, usbutils,
-	webkit, wpa_supplicant, xfsprogs, zlib
+	netstat-nat, openvpn, pcre, php, qt, readline, rpm, sawman, sdl,
+	sdl_ttf, ser2net, sqlite, sshfs, tremor, u-boot, usb_modeswitch,
+	usbutils, webkit, wpa_supplicant, xfsprogs, zlib
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/php/php.mk b/package/php/php.mk
index eaf39c3..0747498 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.2.11
+PHP_VERSION = 5.2.12
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.6.3.3
