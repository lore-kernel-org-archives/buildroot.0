From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 14:46:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix typos
Message-ID: <1453556804-22157-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 124c8d5..e697b52 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -81,9 +81,9 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_TINYXML
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_XLIB_XMU if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
-	select BR2_PACKAGE_XLIB_XRANDR if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
+	select BR2_PACKAGE_XLIB_LIBXMU if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_KODI_GL
+	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
-- 
2.7.0.rc3
