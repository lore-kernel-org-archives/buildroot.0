From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 23:21:23 +0200
Subject: [Buildroot] [git commit] qt/qt5quick1, qt/qt5script,
	qt/qt5webkit: tag as legacy compatibility
Message-ID: <20150721213954.A025F7FC5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=751f6f5af501983cc2b05fc9519fb0b1c7b57733
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                    |    9 +++++----
 package/qt5/qt5quick1/Config.in          |    4 ++++
 package/qt5/qt5script/Config.in          |    4 ++++
 package/qt5/qt5webkit-examples/Config.in |    4 ++++
 package/qt5/qt5webkit/Config.in          |    4 ++++
 5 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index e8ec7d9..737a789 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -36,15 +36,16 @@ source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
-source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
-source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
-source "package/qt5/qt5webkit/Config.in"
-source "package/qt5/qt5webkit-examples/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
+comment "legacy compatibility"
+source "package/qt5/qt5quick1/Config.in"
+source "package/qt5/qt5script/Config.in"
+source "package/qt5/qt5webkit/Config.in"
+source "package/qt5/qt5webkit-examples/Config.in"
 endif
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 16076eb..345ffae 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -15,6 +15,10 @@ config BR2_PACKAGE_QT5QUICK1
 
 	  This package corresponds to the qt5quick1 module.
 
+	  This package has been tagged as deprecated since version
+	  5.5.0 and should be replaced by Qt Quick module in new
+	  design.
+
 	  http://qt.io
 
 comment "qt5quick1 needs a toolchain w/ dynamic library"
diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index 5313e90..0d15ef2 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -8,4 +8,8 @@ config BR2_PACKAGE_QT5SCRIPT
 
 	  This package corresponds to the qt5script module.
 
+	  This package has been tagged as deprecated since version
+	  5.5.0 and should be replaced by Qt QML module in new
+	  design.
+
 	  http://qt.io
diff --git a/package/qt5/qt5webkit-examples/Config.in b/package/qt5/qt5webkit-examples/Config.in
index e7610c2..3f9c243 100644
--- a/package/qt5/qt5webkit-examples/Config.in
+++ b/package/qt5/qt5webkit-examples/Config.in
@@ -7,4 +7,8 @@ config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
 
 	  This package contains examples for the qt5webkit module.
 
+	  This package has been tagged as deprecated since version
+	  5.5.0 and should be replaced by Qt WebEngine module in
+	  new design.
+
 	  http://qt.io
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 3507a9d..eee82e8 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -17,4 +17,8 @@ config BR2_PACKAGE_QT5WEBKIT
 
 	  This package corresponds to the qt5webkit module.
 
+	  This package has been tagged as deprecated since version
+	  5.5.0 and should be replaced by Qt WebEngine module in
+	  new design.
+
 	  http://qt.io
