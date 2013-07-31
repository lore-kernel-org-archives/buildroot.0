From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:00:59 +0200
Subject: [Buildroot] [git commit] uboot-tools: bump to version 2013.07
Message-ID: <20130731160445.AB1659A1A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a7a850ca5142170c427d2234064558551a327c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...> uboot-tools-01-drop-configh-from-tools.patch} |    0
 ...> uboot-tools-02-hostcflags-override-fix.patch} |    0
 package/uboot-tools/uboot-tools.mk                 |    2 +-
 3 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uboot-tools/uboot-tools-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-drop-configh-from-tools.patch
rename to package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
diff --git a/package/uboot-tools/uboot-tools-hostcflags-override-fix.patch b/package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-hostcflags-override-fix.patch
rename to package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index ceda3c5..f8935af 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2013.04
+UBOOT_TOOLS_VERSION = 2013.07
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
