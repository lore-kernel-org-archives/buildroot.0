From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:28:10 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: add missing select
	BR2_LEGACY
Message-ID: <20151009132822.F18FB81F52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=758c5c7f1931d91e4978eee52d7d26eea5c6d799
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy |   40 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3c7fe36..921c7ef 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -109,6 +109,7 @@ comment "Legacy options removed in 2015.11"
 
 config BR2_PACKAGE_SCHIFRA
 	bool "schifra package has been removed"
+	select BR2_LEGACY
 	help
 	  Schifra package has been maked broken since 2014.11 release and
 	  haven't been fixed since then.
@@ -126,6 +127,7 @@ config BR2_PACKAGE_ZXING
 config BR2_PACKAGE_FREERDP_CLIENT
 	bool "freerdp client option renamed"
 	depends on BR2_PACKAGE_FREERDP
+	select BR2_LEGACY
 	select BR2_PACKAGE_FREERDP_CLIENT_X11
 
 config BR2_PACKAGE_BLACKBOX
@@ -177,6 +179,7 @@ config BR2_KERNEL_HEADERS_3_15
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
 	bool "DirectFB example df_andi has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -185,6 +188,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD
 	bool "DirectFB example df_bltload has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -193,6 +197,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD
 	bool "DirectFB example df_cpuload has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -201,6 +206,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER
 	bool "DirectFB example df_databuffer has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -209,6 +215,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD
 	bool "DirectFB example df_dioload has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -217,6 +224,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK
 	bool "DirectFB example df_dok has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -225,6 +233,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
 	bool "DirectFB example df_drivertest has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -234,6 +243,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
 	bool "DirectFB example df_fire has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -242,6 +252,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP
 	bool "DirectFB example df_flip has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -250,6 +261,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS
 	bool "DirectFB example df_fonts has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -258,6 +270,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT
 	bool "DirectFB example df_input has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -266,6 +279,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
 	bool "DirectFB example df_joystick has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -274,6 +288,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
 	bool "DirectFB example df_knuckles has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -282,6 +297,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
 	bool "DirectFB example df_layer has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -290,6 +306,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX
 	bool "DirectFB example df_matrix has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -298,6 +315,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER
 	bool "DirectFB example df_matrix_water has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -306,6 +324,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
 	bool "DirectFB example df_neo has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -314,6 +333,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD
 	bool "DirectFB example df_netload has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -330,6 +350,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE
 	bool "DirectFB example df_particle has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -338,6 +359,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER
 	bool "DirectFB example df_porter has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -354,6 +376,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE
 	bool "DirectFB example df_texture has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -362,6 +385,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO
 	bool "DirectFB example df_video has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -370,6 +394,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE
 	bool "DirectFB example df_video_particle has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -378,6 +403,7 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW
 	bool "DirectFB example df_window has been removed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The per-DirectFB example options have been removed. The
@@ -492,6 +518,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
 	depends on BR2_PACKAGE_PYTHON
 	bool "libsemanage python bindings removed"
+	select BR2_LEGACY
 	help
 	  This option has been removed, since the libsemanage Python
 	  bindings on the target were not useful.
@@ -569,6 +596,7 @@ config BR2_PACKAGE_TIFF_TIFFCP
 
 config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
 	bool "RTAI patch file path has been removed"
+	select BR2_LEGACY
 	help
 	  This option has never worked, so it has been removed.
 
@@ -903,6 +931,7 @@ config BR2_PACKAGE_XLIB_LIBPCIACCESS
 
 config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
 	bool "Xceive xc5000 option has been renamed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_LINUX_FIRMWARE_XCx000
 	help
 	  The Xceive xc5000 option now also handles older firmwares from
@@ -911,6 +940,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
 
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
 	bool "Chelsio T4 option has been renamed"
+	select BR2_LEGACY
 	select BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
 	help
 	  The Chelsio T4 option BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
@@ -919,6 +949,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
 	bool "BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7 has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7 was
 	  renamed to BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7. You must
@@ -929,6 +960,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_7
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8
 	bool "BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8 has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_8 was
 	  renamed to BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_8. You must
@@ -1140,6 +1172,7 @@ config BR2_TARGET_TZ_ZONELIST
 
 config BR2_PACKAGE_TZDATA_ZONELIST
 	string "tzdata: the timezone list option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_PACKAGE_TZDATA_ZONELIST has been renamed to
 	  BR2_TARGET_TZ_ZONELIST, and moved to the "System configuration"
@@ -1266,18 +1299,21 @@ comment "Legacy options removed in 2014.02"
 
 config BR2_sh2
 	bool "sh2 support removed"
+	select BR2_LEGACY
 	help
 	  Due to an inexistent user base and generally poor Linux
 	  support, the support for the SH2 architecture was removed.
 
 config BR2_sh3
 	bool "sh3 support removed"
+	select BR2_LEGACY
 	help
 	  Due to an inexistent user base and generally poor Linux
 	  support, the support for the SH3 architecture was removed.
 
 config BR2_sh3eb
 	bool "sh3eb support removed"
+	select BR2_LEGACY
 	help
 	  Due to an inexistent user base and generally poor Linux
 	  support, the support for the SH3eb architecture was removed.
@@ -1491,6 +1527,7 @@ config BR2_PACKAGE_MODULE_INIT_TOOLS
 
 config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
 	string "u-boot: the git repository URL option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL has
 	  been renamed to BR2_TARGET_UBOOT_CUSTOM_REPO_URL.
@@ -1505,6 +1542,7 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL_WRAP
 
 config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
 	string "u-boot: the git repository version option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION has
 	  been renamed to BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION.
@@ -1519,6 +1557,7 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION_WRAP
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
 	string "linux: the git repository URL option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL has
 	  been renamed to
@@ -1534,6 +1573,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL_WRAP
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 	string "linux: the git repository version option has been renamed"
+	select BR2_LEGACY
 	help
 	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION has
 	  been renamed to
