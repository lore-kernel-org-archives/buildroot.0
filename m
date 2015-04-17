From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 18 Apr 2015 00:31:22 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: add nconfig to editors
Message-ID: <1429309882-6918-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 95fdfec..764768f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -46,7 +46,7 @@ ifndef BUSYBOX_CONFIG_FILE
 endif
 
 BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
-BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
+BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
 define BUSYBOX_PERMISSIONS
-- 
2.1.4
