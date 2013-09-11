From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 12:53:53 +0200
Subject: [Buildroot] [git commit] syslinux: bump to version 4.07
Message-ID: <20130911110611.BF5609B6F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41b351a6f06983a076eb9c99fe125fbc85740753
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/syslinux/syslinux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 1b0ef4e..b6b804e 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSLINUX_VERSION = 4.06
+SYSLINUX_VERSION = 4.07
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
 
