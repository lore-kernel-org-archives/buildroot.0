From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:21:32 +0200
Subject: [Buildroot] [git commit] package/mesa3d: remove unneeded comment
Message-ID: <20160425192429.CCCF5803C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80e2c3138be7a062333bf9b64937f599fdedc826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.busybox.net/buildroot/commit/package/mesa3d?id=f1894ec95728806e09405d26663e0ea371afaeab
removed the dependency on X.org for DRI drivers but forgot to remove
the corresponding comment.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
