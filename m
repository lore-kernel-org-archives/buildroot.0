From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 00:38:19 +0200
Subject: [Buildroot] [git commit master 1/1] tiff: bump to 3.9.4
Message-ID: <20100925223832.E02EE8B43F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=750889288c879a5734e2aad970bd1fcfeb744af4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tiff/tiff.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index ca6f562..748e58f 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -3,7 +3,7 @@
 # tiff
 #
 #############################################################
-TIFF_VERSION:=3.8.2
+TIFF_VERSION:=3.9.4
 TIFF_SITE:=ftp://ftp.remotesensing.org/pub/libtiff
 TIFF_SOURCE:=tiff-$(TIFF_VERSION).tar.gz
 TIFF_LIBTOOL_PATCH = NO
-- 
1.7.1
