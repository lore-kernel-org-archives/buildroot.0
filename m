From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:42:18 +0200
Subject: [Buildroot] [git commit] package/kodi: remove RPi-specific
	restriction from Config.in
Message-ID: <20170429134228.E1F3482140@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4aff2d4e9c7afe86e13f977b053ac2834a18f529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Requested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2017-April/190780.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 613cf48..6bc8133 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -28,7 +28,6 @@ config BR2_PACKAGE_KODI_GL_EGL
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on !BR2_PACKAGE_RPI_USERLAND # rpi depends on gles
 
 comment "kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend"
 	depends on !BR2_PACKAGE_KODI_GL_EGL && !BR2_PACKAGE_KODI_EGL_GLES
