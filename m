From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Jul 2015 22:03:27 +0200
Subject: [Buildroot] [PATCH 2/4] package/tvheadend: bump version
In-Reply-To: <1438373009-5745-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438373009-5745-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1438373009-5745-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 7ad725b..ec04e6f 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 8d561f11d6e3678f801803d7c69cf32d5b915ec2
+TVHEADEND_VERSION = d9cf931f9f7242f070ae990c4765cbdd5276fd66
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.1.4
