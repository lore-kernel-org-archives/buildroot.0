From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Sep 2015 12:34:39 +0200
Subject: [Buildroot] [PATCH 5/5] package/tvheadend: bump version
In-Reply-To: <1442658879-5494-1-git-send-email-bernd.kuhls@t-online.de>
References: <1442658879-5494-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1442658879-5494-5-git-send-email-bernd.kuhls@t-online.de>
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
index ec04e6f..db4ee3a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = d9cf931f9f7242f070ae990c4765cbdd5276fd66
+TVHEADEND_VERSION = 7b327910eefa3b89901e86aaec7acc3cd8d15b90
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.1.4
