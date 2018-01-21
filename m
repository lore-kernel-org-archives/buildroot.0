From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 21 Jan 2018 21:27:21 +0100
Subject: [Buildroot] [PATCH] uclibc-ng-test: update to latest
Message-ID: <20180121202721.GA10675@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc-ng-test/uclibc-ng-test.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 3fdfe37..0e6433c 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = c4d54bde7772b55df04399ecb355769c5ac31015
+UCLIBC_NG_TEST_VERSION = c6d62cbc60504c7f6867b486248b0ef7cc2da554
 UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
 UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
-- 
2.1.4
