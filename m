From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:32 +0200
Subject: [Buildroot] [PATCH 20/35] grub2: bump version
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9d9b63c0f9aab93ae6cf9252b1d8b0f50c606c5a.1271170913.git.thomas.petazzoni@free-electrons.com>
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
index 24f1e1a..9543183 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -3,12 +3,12 @@
 # grub2
 #
 #############################################################
-GRUB2_SOURCE:=grub2_1.95.orig.tar.gz
-GRUB2_PATCH:=grub2_1.95-5.diff.gz
+GRUB2_SOURCE:=grub2_1.98~20100115.orig.tar.gz
+GRUB2_PATCH:=grub2_1.98~20100115-1.diff.gz
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
1.6.3.3
