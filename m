From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 11:58:36 +0200
Subject: [Buildroot] [git commit] gtest: add license information
Message-ID: <20131007100134.ED9D29B97B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27966dc8d8f9f5264b6c8d4809f919cc9336712d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtest/gtest.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
