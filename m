From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 11:37:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: remove unneeded comment
Message-ID: <1461577020-26676-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.busybox.net/buildroot/commit/package/mesa3d?id=f1894ec95728806e09405d26663e0ea371afaeab
removed the dependency on X.org for DRI drivers but forgot to remove
the corresponding comment.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a87f53d..45ca69c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -97,9 +97,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 	  virgl is the 3D acceleration backend for the virtio-gpu
 	  shipping with qemu.
 
-comment "DRI drivers need X.Org"
-	depends on !BR2_PACKAGE_XORG7
-
 comment "DRI drivers"
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
-- 
2.8.0.rc3
