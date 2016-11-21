From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 21 Nov 2016 10:13:50 +0000
Subject: [Buildroot] [PATCH] tiff: bump version to 4.0.7 (security)
Message-ID: <20161121101350.31299-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed CVEs:
 - CVE-2016-3622
 - CVE-2016-3623
 - CVE-2016-5321
 - CVE-2016-5323
 - CVE-2016-5652
 - CVE-2016-5875
 - CVE-2014-8127
 - CVE-2015-8665
 - CVE-2015-8683
 - CVE-2016-9273
 - CVE-2016-9448

Release notes: http://www.simplesystems.org/libtiff/v4.0.7.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tiff/tiff.hash | 2 +-
 package/tiff/tiff.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 7ff746f..4439a35 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	4d57a50907b510e3049a4bba0d7888930fdfc16ce49f1bf693e5b6247370d68c	tiff-4.0.6.tar.gz
+sha256 9f43a2cfb9589e5cecaa66e16bf87f814c945f22df7ba600d63aac4632c4f019  tiff-4.0.7.tar.gz
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index a53d7bb..ffb1a42 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.0.6
+TIFF_VERSION = 4.0.7
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
-- 
2.10.1
