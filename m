From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 22:56:47 +0100
Subject: [Buildroot] [git commit] syslinux: bump to version 4.04
Message-ID: <20120122222047.27D5290358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48558c83cbc961dac6e4a51cc202a98374436fbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/syslinux/syslinux-3.85-makefile.patch |   17 -----------------
 boot/syslinux/syslinux.mk                  |    4 ++--
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/boot/syslinux/syslinux-3.85-makefile.patch b/boot/syslinux/syslinux-3.85-makefile.patch
deleted file mode 100644
index ff85b8d..0000000
--- a/boot/syslinux/syslinux-3.85-makefile.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: syslinux-3.85/Makefile
-===================================================================
---- syslinux-3.85.orig/Makefile
-+++ syslinux-3.85/Makefile
-@@ -43,7 +43,7 @@
- 	mbr/mbr_c.bin mbr/altmbr_c.bin mbr/gptmbr_c.bin \
- 	mbr/mbr_f.bin mbr/altmbr_f.bin mbr/gptmbr_f.bin \
- 	core/pxelinux.0 core/isolinux.bin core/isolinux-debug.bin \
--	gpxe/gpxelinux.0 dos/syslinux.com win32/syslinux.exe \
-+	gpxe/gpxelinux.0 dos/syslinux.com \
- 	dosutil/*.com dosutil/*.sys \
- 	$(MODULES)
- 
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index fa5af07..da30d5a 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-SYSLINUX_VERSION = 3.85
+SYSLINUX_VERSION = 4.04
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
-SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/3.xx/
+SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
 
 SYSLINUX_INSTALL_TARGET = NO
 SYSLINUX_INSTALL_IMAGES = YES
