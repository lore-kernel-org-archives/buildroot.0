From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] grub2: bump version
Message-ID: <20100614203439.88DB680E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7aaf4e899531fa98d24eda698e76be4625e64c80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/grub2.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 24f1e1a..4af6c02 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -3,12 +3,12 @@
 # grub2
 #
 #############################################################
-GRUB2_SOURCE:=grub2_1.95.orig.tar.gz
-GRUB2_PATCH:=grub2_1.95-5.diff.gz
+GRUB2_SOURCE:=grub2_1.98.orig.tar.gz
+GRUB2_PATCH:=grub2_1.98-1.diff.gz
 GRUB2_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub2
-GRUB2_PATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub2
+GRUB2_PATCH_SITE:=$(GRUB2_SITE)
 GRUB2_CAT:=$(ZCAT)
-GRUB2_DIR:=$(BUILD_DIR)/grub-1.95
+GRUB2_DIR:=$(BUILD_DIR)/grub-1.98
 GRUB2_BINARY:=grub2/grub2
 GRUB2_TARGET_BINARY:=sbin/grub2
 GRUB2_SPLASHIMAGE=$(TOPDIR)/boot/grub/splash.xpm.gz
-- 
1.7.1
