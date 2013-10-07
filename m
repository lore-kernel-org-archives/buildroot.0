From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 07 Oct 2013 17:56:14 +0800
Subject: [Buildroot] [PATCH] gtest: add license information
Message-ID: <1381139774.12106.3.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/gtest/gtest.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 60aeb49..e661d73 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -9,6 +9,8 @@ GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
 GTEST_SITE = http://googletest.googlecode.com/files/
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
+GTEST_LICENSE = BSD-3c
+GTEST_LICENSE_FILES = LICENSE
 
 define GTEST_EXTRACT_CMDS
 	unzip $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
-- 
1.8.1.2
