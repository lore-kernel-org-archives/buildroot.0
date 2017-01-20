From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 14:09:13 +1100
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump to version
	20170116
Message-ID: <20170120030930.45DFB81E53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd72e3234caa1b991077697d79d6503d35bfa867
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/ltp-testsuite.hash | 6 ++----
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index a6041e6..b8311e0 100644
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
index 4f325ba..f892dc0 100644
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
