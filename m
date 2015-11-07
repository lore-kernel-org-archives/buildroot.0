From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Nov 2015 11:34:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <1446892457-6990-1-git-send-email-bernd.kuhls@t-online.de>
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
index 4ffb357..6b8fdea 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 1b682a46a11ea821c4ed183a274bc78993ef40a0
+TVHEADEND_VERSION = a27b0af2b82dae83cf8a41e01ee1174b911f3aa3
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.6.2
