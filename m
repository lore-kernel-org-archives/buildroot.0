From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 23:01:12 +0100
Subject: [Buildroot] [git commit] package/kodi: fix typos
Message-ID: <20160201224705.0F1847F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8159efff7be4c6ffde03ad8ee406d18b3e8ffae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
