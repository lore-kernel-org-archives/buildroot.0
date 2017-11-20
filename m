From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 09:16:45 -0500
Subject: [Buildroot] [NEXT 1/1] fftw: bump to 3.3.7
Message-ID: <20171120141645.5445-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition, add a hash for the license file

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/fftw/fftw.hash | 7 ++++---
 package/fftw/fftw.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/fftw/fftw.hash b/package/fftw/fftw.hash
index b00f447..faf4b90 100644
--- a/package/fftw/fftw.hash
+++ b/package/fftw/fftw.hash
@@ -1,4 +1,5 @@
-# From http://www.fftw.org/fftw-3.3.6-pl2.tar.gz.md5sum
-md5 927e481edbb32575397eb3d62535a856  fftw-3.3.6-pl2.tar.gz
+# From http://www.fftw.org/fftw-3.3.7.tar.gz.md5sum
+md5 0d5915d7d39b3253c1cc05030d79ac47  fftw-3.3.7.tar.gz
 # Locally computed
-sha256 a5de35c5c824a78a058ca54278c706cdf3d4abba1c56b63531c2cb05f5d57da2  fftw-3.3.6-pl2.tar.gz
+sha256 3b609b7feba5230e8f6dd8d245ddbefac324c5a6ae4186947670d9ac2cd25573	fftw-3.3.7.tar.gz
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c	COPYING
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 0f32f79..b3aa4b6 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3.6-pl2
+FFTW_VERSION = 3.3.7
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPL-2.0+
-- 
2.13.6
