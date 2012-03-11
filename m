From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 21:25:09 +0100
Subject: [Buildroot] [git commit] tiff: bump to 4.0.1
Message-ID: <20120311203130.4C30E90D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f65decfa7a3dcaa49d63a367a872094167b5edc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tiff/tiff.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index ed05bf1..3ab0d4f 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -3,11 +3,10 @@
 # tiff
 #
 #############################################################
-TIFF_VERSION:=3.9.4
-TIFF_SITE:=ftp://ftp.remotesensing.org/pub/libtiff
-TIFF_SOURCE:=tiff-$(TIFF_VERSION).tar.gz
+TIFF_VERSION = 4.0.1
+TIFF_SITE = ftp://ftp.remotesensing.org/pub/libtiff
+TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.gz
 TIFF_INSTALL_STAGING = YES
-TIFF_INSTALL_TARGET = YES
 TIFF_CONF_OPT = \
 	--disable-cxx \
 	--without-x \
