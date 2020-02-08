From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  8 Feb 2020 00:45:28 -0700
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: don't select kmsro for iris
 driver
Message-ID: <20200208074528.39326-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 94e3f2cb9e..850d306add 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -116,7 +116,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	help
 	  Mesa driver for iris-based Intel GPUs.
 
-- 
2.20.1
