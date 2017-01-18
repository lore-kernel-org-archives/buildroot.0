From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 18 Jan 2017 11:12:35 +0100
Subject: [Buildroot] [PATCH 1/2] package/ltp-testsuite: bump to version
	20170116
Message-ID: <20170118101236.24594-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.hash | 6 ++----
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index a6041e6a0..b8311e094 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20160920/ltp-full-20160920.tar.xz.md5
-md5 d1d5b7389d209fe0afca16d8d73a8357  ltp-full-20160920.tar.xz
-# From: https://github.com/linux-test-project/ltp/releases/download/20160920/ltp-full-20160920.tar.xz.sha1
-sha1 79f3311ecbcf02f070e601745243c9757638c4ef  ltp-full-20160920.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20170116/ltp-full-20170116.tar.xz.sha1
+sha1 b42047fe0d30db9b2c760bd1ab901ecb133835fc  ltp-full-20170116.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 4f325baa7..f892dc00e 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20160920
+LTP_TESTSUITE_VERSION = 20170116
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2, GPLv2+
-- 
2.11.0
