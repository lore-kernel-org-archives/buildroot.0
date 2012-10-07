From: Valentine Barshak <gvaxon@gmail.com>
Date: Mon,  8 Oct 2012 02:40:27 +0400
Subject: [Buildroot] [PATCH] sylpheed: Bump version to 3.2
Message-ID: <1349649627-12659-1-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/sylpheed/sylpheed.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 32c0a82..491737e 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -3,7 +3,7 @@
 # sylpheed
 #
 #############################################################
-SYLPHEED_VERSION_MAJOR = 3.1
+SYLPHEED_VERSION_MAJOR = 3.2
 SYLPHEED_VERSION_MINOR = 0
 SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
-- 
1.7.11.4
