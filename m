From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 20:55:37 +0100
Subject: [Buildroot] [git commit] ti-gfx: bump to version 5_01_00_01
Message-ID: <20140228133416.3D9C99BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83fb9bb738ae17bf2f11ae3e25250c035a8a7dba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcelo Gutierrez <kuyurix@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-gfx/ti-gfx.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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
