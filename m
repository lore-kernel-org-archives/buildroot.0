From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 21:26:58 +0100
Subject: [Buildroot] [git commit] uboot-tools: bump to version 2012.10
Message-ID: <20130104211237.D228C9A60C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=150564a8bb82f5577362030b8354aaa68e08a0ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...h => uboot-tools-drop-configh-from-tools.patch} |    0
 ...h => uboot-tools-hostcflags-override-fix.patch} |    0
 package/uboot-tools/uboot-tools.mk                 |    2 +-
 3 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-drop-configh-from-tools.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch
rename to package/uboot-tools/uboot-tools-drop-configh-from-tools.patch
diff --git a/package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch b/package/uboot-tools/uboot-tools-hostcflags-override-fix.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch
rename to package/uboot-tools/uboot-tools-hostcflags-override-fix.patch
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 75cda8e..5957a3d 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -3,7 +3,7 @@
 # uboot-tools
 #
 #############################################################
-UBOOT_TOOLS_VERSION = 2012.07
+UBOOT_TOOLS_VERSION = 2012.10
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
