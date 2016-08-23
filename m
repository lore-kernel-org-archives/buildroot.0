From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 22:00:46 +0200
Subject: [Buildroot] [git commit branch/next] package/mesa3d: also
	implements the EGL wayland extensions
Message-ID: <20160823200112.CB0EB8211A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aab7cab8220466fa2043f59e45051341ecd27946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

mesa3d implements the EGL extensions for wayland. State so.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 45ca69c..6f60ee1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -150,6 +150,7 @@ comment "Additional API Support"
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
 	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	help
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL applications
 	  similar to GLX, for X, and WGL, for Windows.
