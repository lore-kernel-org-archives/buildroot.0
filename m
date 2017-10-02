From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  2 Oct 2017 11:36:43 +0200
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Bump to version 20170929
Message-ID: <20171002093643.25433-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 68b95234dd..42feaade27 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20170516/ltp-full-20170516.tar.xz.sha1
-sha1 bd5210b73b14708c88449089a3a3c64ace3cd22a  ltp-full-20170516.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20170929/ltp-full-20170929.tar.xz.sha1
+sha1 a170db3bc7203c9a998a277a369e7020dc61a382  ltp-full-20170929.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index eb9453af6f..bbeee5b23d 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20170516
+LTP_TESTSUITE_VERSION = 20170929
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
-- 
2.14.1
