From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 23:22:09 +0100
Subject: [Buildroot] [git commit] uboot-tools: also bump to 2013.01.01
Message-ID: <20130204222253.0D5FC9A932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c42bb1f3af67a063400a3926c5614d06da17d47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uboot-tools/uboot-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 3470b60..9d7596a 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -3,7 +3,7 @@
 # uboot-tools
 #
 #############################################################
-UBOOT_TOOLS_VERSION = 2013.01
+UBOOT_TOOLS_VERSION = 2013.01.01
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
