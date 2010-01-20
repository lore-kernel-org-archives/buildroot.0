From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jan 2010 16:36:02 +0100
Subject: [Buildroot] [git commit master] Bump sqlite to 3.6.22
Message-ID: <20100120153638.859D6776E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c623a2379cb41c0967d53fad54241122fc33c9a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #943.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                           |    5 +++--
 package/database/sqlite/sqlite.mk |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index bd7d59d..4f780e7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
 	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
 	iw, jpeg, kismet, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
-	mtd-utils, neon, openvpn, pcre, qt, rpm, sshfs, tremor, u-boot,
-	usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
+	mtd-utils, neon, openvpn, pcre, qt, rpm, sqlite, sshfs, tremor,
+	u-boot, usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -36,6 +36,7 @@
 	#925: Bump wpa_supplicant package to 0.6.10
 	#931: Bump kismet package to 2010-01-R1
 	#937: Bump openvpn package to 2.1.1
+	#943: Bump sqlite package to 3.6.22
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/database/sqlite/sqlite.mk b/package/database/sqlite/sqlite.mk
index 6d240d5..375ab42 100644
--- a/package/database/sqlite/sqlite.mk
+++ b/package/database/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.20
+SQLITE_VERSION = 3.6.22
 SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
-- 
1.6.3.3
