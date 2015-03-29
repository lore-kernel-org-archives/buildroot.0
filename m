From: Karoly Kasza <kaszak@gmail.com>
Date: Sun, 29 Mar 2015 09:46:00 +0200
Subject: [Buildroot] [PATCH] package/irqbalance: bump to 1.0.9
Message-ID: <1427615160-8650-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/irqbalance/irqbalance.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 4e6b181..1872c88 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = v1.0.8
+IRQBALANCE_VERSION = v1.0.9
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPLv2
 IRQBALANCE_LICENSE_FILES = COPYING
-- 
1.7.10.4
