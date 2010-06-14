From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] grub/grub2: update splash image
	location
Message-ID: <20100614203439.5570D80E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bff56ab5484ac4d0ad593a20590cf570637f3f0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
