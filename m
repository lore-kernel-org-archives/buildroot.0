From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 08:48:56 +0100
Subject: [Buildroot] [PATCH] kbd: add license information
Message-ID: <1366012136-32387-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/kbd/kbd.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 325978e..08cb077 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -1,6 +1,14 @@
+#############################################################
+#
+# kbd
+#
+#############################################################
+
 KBD_VERSION = 1.15.2
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
+KBD_LICENSE = GPLv2+
+KBD_LICENSE_FILES = COPYING
 
 KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
-- 
1.7.10.4
