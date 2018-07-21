From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 16:16:32 +0200
Subject: [Buildroot] [PATCH v4 02/18] package/efl: switch to xorgproto
In-Reply-To: <20180721141648.29939-1-bernd.kuhls@t-online.de>
References: <20180721141648.29939-1-bernd.kuhls@t-online.de>
Message-ID: <20180721141648.29939-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/efl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index cfb803c6df..e965d4d142 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -168,7 +168,7 @@ config BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
 	select BR2_PACKAGE_XLIB_LIBXTST
-	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XORGPROTO
 
 config BR2_PACKAGE_EFL_WAYLAND
 	bool "Wayland support"
-- 
2.18.0
