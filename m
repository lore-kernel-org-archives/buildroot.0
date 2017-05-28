From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:34:10 +0200
Subject: [Buildroot] [git commit branch/next] package/fftw: bump version to
	3.3.6-pl2
Message-ID: <20170528133447.75D1E7F9C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8e133e28c3a03ea45ea27b06eb2d4c41b300e08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fftw/fftw.hash | 6 ++++--
 package/fftw/fftw.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/fftw/fftw.hash b/package/fftw/fftw.hash
index 62b8f0f..b00f447 100644
--- a/package/fftw/fftw.hash
+++ b/package/fftw/fftw.hash
@@ -1,2 +1,4 @@
-# From http://www.fftw.org/fftw-3.3.4.tar.gz.md5sum
-md5	2edab8c06b24feeb3b82bbb3ebf3e7b3	fftw-3.3.4.tar.gz
+# From http://www.fftw.org/fftw-3.3.6-pl2.tar.gz.md5sum
+md5 927e481edbb32575397eb3d62535a856  fftw-3.3.6-pl2.tar.gz
+# Locally computed
+sha256 a5de35c5c824a78a058ca54278c706cdf3d4abba1c56b63531c2cb05f5d57da2  fftw-3.3.6-pl2.tar.gz
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 671c99b..0f32f79 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3.4
+FFTW_VERSION = 3.3.6-pl2
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPL-2.0+
