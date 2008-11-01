From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 1 Nov 2008 20:00:20 +0100
Subject: [Buildroot] [PATCH 4b/4] qtopia4: remove default n,
	fix whitespace/spelling
Message-ID: <200811012000.20728.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
The previos patch 4/4 was quoted-printable, here's a proper one.

 package/qtopia4/Config.gfx.in   |    3 ---
 package/qtopia4/Config.in       |    2 +-
 package/qtopia4/Config.mouse.in |    9 +--------
 package/qtopia4/Config.sql.in   |    6 +++---
 4 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/package/qtopia4/Config.gfx.in b/package/qtopia4/Config.gfx.in
index 9a1d00b..8147886 100644
--- a/package/qtopia4/Config.gfx.in
+++ b/package/qtopia4/Config.gfx.in
@@ -6,15 +6,12 @@ config BR2_PACKAGE_QTOPIA4_GFX_LINUXFB
 
 config BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED
 	bool "Transformed"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_GFX_QVFB
 	bool "Qt Virtual Framebuffer"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_GFX_VNC
 	bool "VNC"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN
 	bool "multiscreen"
diff --git a/package/qtopia4/Config.in b/package/qtopia4/Config.in
index 1c2f948..fb156af 100644
--- a/package/qtopia4/Config.in
+++ b/package/qtopia4/Config.in
@@ -185,7 +185,7 @@ choice
 	  Select freetype2 support.
 
 config BR2_PACKAGE_QTOPIA4_NOFREETYPE
-        bool "no freetype2 support"
+	bool "no freetype2 support"
 	help
 	  Do not compile in Freetype2 support.
 
diff --git a/package/qtopia4/Config.mouse.in b/package/qtopia4/Config.mouse.in
index 5ca4046..7b39460 100644
--- a/package/qtopia4/Config.mouse.in
+++ b/package/qtopia4/Config.mouse.in
@@ -2,30 +2,23 @@ menu "Mouse drivers"
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_PC
 	bool "pc"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_BUS
 	bool "bus"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP
 	bool "linuxtp"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_YOPY
 	bool "yopy"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX
-	bool "vxr41xx"
-	default n
+	bool "vr41xx"
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB
 	bool "tslib"
-	default n
 
 config BR2_PACKAGE_QTOPIA4_MOUSE_QVFB
 	bool "qvfb"
-	default n
 
 endmenu
diff --git a/package/qtopia4/Config.sql.in b/package/qtopia4/Config.sql.in
index 881f7ed..4c5f405 100644
--- a/package/qtopia4/Config.sql.in
+++ b/package/qtopia4/Config.sql.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_QTOPIA4_SQL_MODULE
-    bool "SQL Module"
-    help
-      Compile Qtopia SQL Module
+	bool "SQL Module"
+	help
+	  Compile Qtopia SQL Module
 
 if BR2_PACKAGE_QTOPIA4_SQL_MODULE
 config BR2_PACKAGE_QTOPIA4_MYSQL
-- 
1.6.0.3.536.gb5136
