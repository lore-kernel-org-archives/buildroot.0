From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 11:44:59 +0200
Subject: [Buildroot] [git commit] gtest: bump to version 1.7.0
Message-ID: <20131007094613.9C2FB9B3BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9d5a367c0517c546a85d79b49baf39f077f1750
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtest/gtest.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
