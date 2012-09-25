From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Sep 2012 20:29:17 +0200
Subject: [Buildroot] [git commit] tiff: security bump to version 4.0.3
Message-ID: <20120925195200.5297099701@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36833f0c37c4939ace27af89e4c7bb71c99fbcfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2012-3401 and CVE-2012-3386.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tiff/tiff.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 227047b..145d929 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -3,9 +3,9 @@
 # tiff
 #
 #############################################################
-TIFF_VERSION = 4.0.1
-TIFF_SITE = ftp://ftp.remotesensing.org/pub/libtiff
-TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.gz
+
+TIFF_VERSION = 4.0.3
+TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPT = \
 	--disable-cxx \
