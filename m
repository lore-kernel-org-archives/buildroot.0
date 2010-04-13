From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:31 +0200
Subject: [Buildroot] [PATCH 19/35] grub/grub2: update splash image location
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <31840f050b4e43253417ad64eaf69f65d3eaa1f7.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk   |    2 +-
 boot/grub2/grub2.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 74ea77f..3805afe 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -11,7 +11,7 @@ GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
 GRUB_BINARY:=grub/grub
 GRUB_TARGET_BINARY:=sbin/grub
-GRUB_SPLASHIMAGE=$(TOPDIR)/target/x86/grub/splash.xpm.gz
+GRUB_SPLASHIMAGE=$(TOPDIR)/boot/grub/splash.xpm.gz
 
 
 GRUB_CFLAGS=-DSUPPORT_LOOPDEV
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 06e1524..24f1e1a 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -11,7 +11,7 @@ GRUB2_CAT:=$(ZCAT)
 GRUB2_DIR:=$(BUILD_DIR)/grub-1.95
 GRUB2_BINARY:=grub2/grub2
 GRUB2_TARGET_BINARY:=sbin/grub2
-GRUB2_SPLASHIMAGE=$(TOPDIR)/target/x86/grub/splash.xpm.gz
+GRUB2_SPLASHIMAGE=$(TOPDIR)/boot/grub/splash.xpm.gz
 
 
 GRUB2_CFLAGS=-DSUPPORT_LOOPDEV
-- 
1.6.3.3
