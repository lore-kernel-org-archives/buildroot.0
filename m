From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 09:25:24 +0100
Subject: [Buildroot] [git commit] package/*/Config.in: fix consecutive lines
 check-package warnings
Message-ID: <20171218083058.715EC834F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b51fa44d038e055d205f98a3dcc37b31283a5d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in    | 1 -
 package/qt5/qt53d/Config.in | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index de8adcd..b7c8c41 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -218,7 +218,6 @@ comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads, dynamic lib
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
 
-
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
 	bool "gstreamer-1.x"
 	depends on BR2_USE_MMU # gstreamer1 -> libglib2
diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
index c7f4127..78602a7 100644
--- a/package/qt5/qt53d/Config.in
+++ b/package/qt5/qt53d/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_QT53D
 
 	  This package corresponds to the qt53d module.
 
-
 	  This module was in tech preview in Qt 5.6, and promoted
 	  to a core module in Qt 5.7.0.
 
