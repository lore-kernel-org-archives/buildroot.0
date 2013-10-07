From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 07 Oct 2013 13:26:28 +0800
Subject: [Buildroot] [PATCH] gtest: bump to version 1.7.0
Message-ID: <1381123588.28461.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/gtest/gtest.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 52028f5..60aeb49 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.6.0
+GTEST_VERSION = 1.7.0
 GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
 GTEST_SITE = http://googletest.googlecode.com/files/
 GTEST_INSTALL_STAGING = YES
-- 
1.8.1.2
