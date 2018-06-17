From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jun 2018 16:01:21 +0200
Subject: [Buildroot] [PATCH 02/13] package/efl: switch to xorgproto
In-Reply-To: <20180617140132.2752-1-bernd.kuhls@t-online.de>
References: <20180617140132.2752-1-bernd.kuhls@t-online.de>
Message-ID: <20180617140132.2752-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/efl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index b9b285d8da..5be6d63765 100644
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
2.17.1
