From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 07 Sep 2013 01:25:18 +0200
Subject: [Buildroot] [PATCH 1/1] syslinux: bump to version 4.07
Message-ID: <522A645E.9080803@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 boot/syslinux/syslinux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

-- 
1.8.4
