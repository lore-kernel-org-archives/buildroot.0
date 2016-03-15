From: Ricardo Crudo <ricardo.crudo@gmail.com>
Date: Tue, 15 Mar 2016 12:31:50 +0100
Subject: [Buildroot] [PATCH 1/1] mxml: add host-autotools-package macro
Message-ID: <1458041510-19966-1-git-send-email-ricardo.crudo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages need to process xml at host side

Signed-off-by: Ricardo Crudo <ricardo.crudo@gmail.com>
---
 package/mxml/mxml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 7e9b4d6..ba70603 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -14,3 +14,4 @@ MXML_INSTALL_STAGING_OPTS = DSTROOT=$(STAGING_DIR) install
 MXML_INSTALL_TARGET_OPTS = DSTROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.3
