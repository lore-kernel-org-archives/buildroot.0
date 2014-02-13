From: kuyurix at gmail.com <kuyurix@gmail.com>
Date: Thu, 13 Feb 2014 18:38:33 +0000
Subject: [Buildroot] [PATCH 1/1] ti-gfx: bump to version 5_01_00_01
Message-ID: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcelo Gutierrez <kuyurix@gmail.com>


Signed-off-by: Marcelo Gutierrez <kuyurix@gmail.com>
---
 package/ti-gfx/ti-gfx.mk |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index a94f00d..5ea6b92 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TI_GFX_VERSION = 4_09_00_01
-TI_GFX_SO_VERSION = 1.9.2188537
+TI_GFX_VERSION = 5_01_00_01
+TI_GFX_SO_VERSION = 1.10.2359475
 
 ifeq ($(BR2_ARM_EABIHF),y)
-TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_hardfp_minimal_demos.bin
+TI_GFX_SOURCE = Graphics_SDK_setuplinux_hardfp_$(TI_GFX_VERSION).bin
 else
-TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
+TI_GFX_SOURCE = Graphics_SDK_setuplinux_softfp_$(TI_GFX_VERSION).bin
 endif
 
 TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
-- 
1.7.9.5
