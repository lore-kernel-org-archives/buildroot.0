From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 20:44:46 +0200
Subject: [Buildroot] [git commit] tiff: bump to version 4.0.6
Message-ID: <20151002184453.3934F81D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7319bba9ee2ef7f15b248a03e3513e11ffbb6f4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tiff/tiff.hash |    2 +-
 package/tiff/tiff.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 9cb31dc..7ff746f 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	e25eaa83ed7fab43ddd278b9b14d91a406a4b674cedc776adb95535f897f309c	tiff-4.0.5.tar.gz
+sha256	4d57a50907b510e3049a4bba0d7888930fdfc16ce49f1bf693e5b6247370d68c	tiff-4.0.6.tar.gz
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 9a2bf70..c2e713c 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.0.5
+TIFF_VERSION = 4.0.6
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
