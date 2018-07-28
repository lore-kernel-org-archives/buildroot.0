From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 22:32:51 +0200
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: switch to
 xorgproto
Message-ID: <20180728211151.DE41B8A392@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c36dcba54c3f495afda296d6a41d2d06a527983
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xkeyboard-config/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
index 5d1d6a72ed..c941742421 100644
--- a/package/x11r7/xkeyboard-config/Config.in
+++ b/package/x11r7/xkeyboard-config/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_XKEYBOARD_CONFIG
 	# Runtime dependencies
 	select BR2_PACKAGE_XAPP_XKBCOMP if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XPROTO_XPROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7
 	help
 	  keyboard configuration database for X
 
