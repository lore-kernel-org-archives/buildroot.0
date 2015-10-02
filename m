From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 13:46:28 -0300
Subject: [Buildroot] [PATCH] tiff: bump to version 4.0.6
Message-ID: <1443804388-17743-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tiff/tiff.hash | 2 +-
 package/tiff/tiff.mk   | 2 +-
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
-- 
2.4.9
