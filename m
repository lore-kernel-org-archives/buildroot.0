From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 27 Apr 2015 01:40:20 +0200
Subject: [Buildroot] [PATCH 3/4] expect: bump to version 5.45.3
In-Reply-To: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
References: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1430091621-4698-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Download it from the cvs repository because it is not avaialbe as a
downloadable file.
Also because a tag isn't avaiable use the date.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/expect/expect.hash | 2 --
 package/expect/expect.mk   | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 package/expect/expect.hash

diff --git a/package/expect/expect.hash b/package/expect/expect.hash
deleted file mode 100644
index 09e68e7..0000000
--- a/package/expect/expect.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040  expect5.45.tar.gz
diff --git a/package/expect/expect.mk b/package/expect/expect.mk
index 8ef7e90..d78ff6c 100644
--- a/package/expect/expect.mk
+++ b/package/expect/expect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EXPECT_VERSION = 5.45
-EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
-EXPECT_SITE = http://downloads.sourceforge.net/project/expect/Expect/$(EXPECT_VERSION)
+# Version 5.45.3
+EXPECT_VERSION = 2014-05-02
+EXPECT_SITE = cvs://expect.cvs.sourceforge.net:/cvsroot/expect
 EXPECT_LICENSE = Public domain
 EXPECT_LICENSE_FILES = README
 
-- 
2.3.5
