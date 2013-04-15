From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 08:29:19 +0100
Subject: [Buildroot] [PATCH] kmod: add license information
Message-ID: <1366010959-30378-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/kmod/kmod.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index c0b223d..5c733b9 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -1,6 +1,14 @@
+#############################################################
+#
+# kmod
+#
+#############################################################
+
 KMOD_VERSION = 13
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
+KMOD_LICENSE = GPLv2+ LGPLv2.1+
+KMOD_LICENSE_FILES = COPYING libkmod/COPYING
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 
-- 
1.7.10.4
