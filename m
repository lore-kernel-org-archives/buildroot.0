From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:59:22 +0200
Subject: [Buildroot] [git commit] package/xorg-server: do not force-select
	xf86driproto for mesa3d
Message-ID: <20140417210125.516EB9C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ef1e8735eb4afdb35d68959100cb5abd63c023e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is already handled by mesa3d itself.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index dfa7d10..e191dce 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -45,7 +45,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
