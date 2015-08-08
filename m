From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:34 -0000
Subject: [Buildroot] [git commit branch/next] expect: bump to version 5.45.3
Message-ID: <20150808105624.67B9B7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7859f892e52d9c88c8bee67447132130f78790a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Download it from the cvs repository because it is not availabe as a
downloadable file. Also because a tag isn't available use the date.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/expect/expect.hash |    2 --
 package/expect/expect.mk   |    6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)

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
 
