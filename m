From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 19 Mar 2013 17:12:41 +0100
Subject: [Buildroot] [PATCH] kexec: bump to version 2.0.4
Message-ID: <1363709561-4091-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2.0.4 has improved support for handling of device-tree
blobs on the ARM platform.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/kexec/kexec.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index a8192f7..6510b17 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -3,8 +3,9 @@
 # kexec
 #
 #############################################################
-KEXEC_VERSION = 2.0.3
-KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
+
+KEXEC_VERSION = 2.0.4
+KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
-- 
1.7.10.4
