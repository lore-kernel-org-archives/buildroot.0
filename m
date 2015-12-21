From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Dec 2015 23:04:57 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad/Config.in: indentation
	cleanup
Message-ID: <20151221220508.1950C81D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b50d84d68c386fd7cd636c92e1477232910a63b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 134e1aa..a834f13 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -70,8 +70,8 @@ comment "glx not supported with rpi-userland"
 
 comment "glx needs the opengl API and modular X.org"
 	depends on !BR2_PACKAGE_RPI_USERLAND && \
-			(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL || \
-			!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
+		(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL || \
+		!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
 	bool "egl"
@@ -82,7 +82,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
 
 comment "egl needs an API and an EGL backend"
 	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_API || \
-			!BR2_PACKAGE_HAS_LIBEGL
+		!BR2_PACKAGE_HAS_LIBEGL
 
 comment "Window systems"
 
@@ -104,8 +104,8 @@ comment "x11 not supported with rpi-userland"
 
 comment "x11 needs a platform and X.org"
 	depends on !BR2_PACKAGE_RPI_USERLAND && \
-			(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM || \
-			!BR2_PACKAGE_XORG7)
+		(!BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_PLATFORM || \
+		!BR2_PACKAGE_XORG7)
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
 	bool "wayland"
@@ -116,7 +116,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
 
 comment "wayland needs the egl platform and the wayland package"
 	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL || \
-			!BR2_PACKAGE_WAYLAND
+		!BR2_PACKAGE_WAYLAND
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX
 	bool "dispmanx"
@@ -129,7 +129,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX
 
 comment "dispmanx needs the egl platform and rpi-userland"
 	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL || \
-			!BR2_PACKAGE_RPI_USERLAND
+		!BR2_PACKAGE_RPI_USERLAND
 
 endif
 
