From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:22:00 +0200
Subject: [Buildroot] [PATCH 26/49] grub2: bump version
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7aaf4e899531fa98d24eda698e76be4625e64c80.1276352308.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
