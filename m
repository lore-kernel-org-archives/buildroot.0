From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 14 Apr 2012 21:28:31 +0200
Subject: [Buildroot] [git commit] qt: tweak help text
Message-ID: <20120414192948.061DC96ABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8eaf4e5281c98f97a453e67547ec740174d9d417
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream URL of Qt is qt-project.org nowadays, and there's a single Qt
release for everyone.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3a552d0..1ce6348 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -5,9 +5,10 @@ menuconfig BR2_PACKAGE_QT
 	bool "Qt"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  Qt for Embedded Linux.
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
 
-	  http://www.qtsoftware.com/products/platform/qt-for-embedded-linux
+	  http://qt-project.org
 
 if BR2_PACKAGE_QT
 
