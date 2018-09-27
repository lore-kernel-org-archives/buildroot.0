From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 21:18:02 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: Bump to version 20180926
Message-ID: <20180927191952.DB47B88FA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=061784404faaffb7b72fdbe2c28346fc4498d23f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 93ab41d3b7..1f04aee482 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20180515/ltp-full-20180515.tar.xz.sha1
-sha1 db424d391987ff62664662210ef98cd42c7cc6b5  ltp-full-20180515.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20180926/ltp-full-20180926.tar.xz.sha1
+sha1 da5c8e847ed909dbd0b859c6918bc526cf6c2695  ltp-full-20180926.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index b536dbd369..da039bddae 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20180515
+LTP_TESTSUITE_VERSION = 20180926
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
