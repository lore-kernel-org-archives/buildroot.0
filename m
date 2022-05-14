Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E568CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 17:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A039B40926;
	Sat, 14 May 2022 17:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oOUVn8Yh93va; Sat, 14 May 2022 17:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFB5409E8;
	Sat, 14 May 2022 17:58:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94B561BF3DE
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF61040917
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LV7t54Ozi76I for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 17:56:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94A584090E
 for <buildroot@buildroot.org>; Sat, 14 May 2022 17:56:20 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout09.t-online.de (Postfix) with SMTP id 696D3D889;
 Sat, 14 May 2022 19:56:16 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.4.164]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npvzy-2ZkJXx0; Sat, 14 May 2022 19:56:14 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41714)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npvzy-0005N1-0P;
 Sat, 14 May 2022 19:56:14 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 19:56:12 +0200
Message-Id: <20220514175612.2510884-19-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652550974-00010BFA-F0DF4B68/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ec925fc-22b3-46bf-af46-997619d8a959
Subject: [Buildroot] [PATCH 19/19] package/{mesa3d,
 mesa3d-headers}: bump version to 22.0.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2022-April/000670.html
https://lists.freedesktop.org/archives/mesa-announce/2022-March/000667.html
https://lists.freedesktop.org/archives/mesa-announce/2022-March/000665.html
https://lists.freedesktop.org/archives/mesa-announce/2022-May/000673.html
https://www.phoronix.com/scan.php?page=news_item&px=Mesa-22.0-Released

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                         | 24 +++++++++
 package/mesa3d-headers/mesa3d-headers.mk | 12 +----
 package/mesa3d/Config.in                 | 69 ++----------------------
 package/mesa3d/mesa3d.hash               |  9 ++--
 package/mesa3d/mesa3d.mk                 | 16 +-----
 5 files changed, 35 insertions(+), 95 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 95b9d784d3..d9aa778f83 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,30 @@ endif
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
+	bool "mesa DRI i915 driver removed"
+	select BR2_LEGACY
+	help
+	  The DRI i915 driver was removed upstream.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
+	bool "mesa DRI i965 driver removed"
+	select BR2_LEGACY
+	help
+	  The DRI i965 driver was removed upstream.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
+	bool "mesa DRI nouveau driver removed"
+	select BR2_LEGACY
+	help
+	  The DRI radeon nouveau was removed upstream.
+
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
+	bool "mesa DRI radeon r100 driver removed"
+	select BR2_LEGACY
+	help
+	  The DRI radeon r100 driver was removed upstream.
+
 config BR2_KERNEL_HEADERS_5_16
 	bool "kernel headers version 5.16.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 760c5368e5..fb3763297d 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.3.8
+MESA3D_HEADERS_VERSION = 22.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
@@ -33,19 +33,9 @@ MESA3D_HEADERS_DIRS += GL
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 
-# Not using $(SED) because we do not want to work in-place, and $(SED)
-# contains -i.
-define MESA3D_HEADERS_BUILD_DRI_PC
-	sed -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
-	    package/mesa3d-headers/dri.pc \
-	    >$(@D)/src/mesa/drivers/dri/dri.pc
-endef
-
 define MESA3D_HEADERS_INSTALL_DRI_PC
 	$(INSTALL) -D -m 0644 $(@D)/include/GL/internal/dri_interface.h \
 		$(STAGING_DIR)/usr/include/GL/internal/dri_interface.h
-	$(INSTALL) -D -m 0644 $(@D)/src/mesa/drivers/dri/dri.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/dri.pc
 endef
 
 endif # Xorg
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e41da562dc..7468c2c804 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -63,16 +63,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
 
-config BR2_PACKAGE_MESA3D_DRI_DRIVER
-	bool
-	select BR2_PACKAGE_MESA3D_DRI3 if \
-		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4 && \
-			!BR2_RISCV_32)
-	select BR2_PACKAGE_MESA3D_DRIVER
-	select BR2_PACKAGE_MESA3D_GBM if \
-		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
-		!BR2_PACKAGE_MESA3D_OPENGL_EGL
-
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
@@ -134,16 +124,11 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	bool "Gallium i915 driver"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  Support for i915-based Intel GPUs.
 
-comment "Gallium i915: Only one i915 provider can be built"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
-
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_i386 || BR2_x86_64
@@ -330,49 +315,6 @@ comment "Gallium XvMC state tracker needs X.org and gallium drivers r600 or nouv
 		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)
 
-comment "DRI drivers"
-
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
-	bool "DRI i915 driver"
-	depends on BR2_i386 || BR2_x86_64
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-	select BR2_PACKAGE_LIBDRM_INTEL
-	help
-	  Support for i915-based Intel GPUs.
-
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
-	bool "DRI i965 driver"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-	select BR2_PACKAGE_LIBDRM_INTEL
-	help
-	  Support for i965-based Intel GPUs.
-
-comment "DRI i965 driver needs a toolchain w/ headers >= 3.17"
-	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
-
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
-	bool "DRI nouveau driver"
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-	select BR2_PACKAGE_LIBDRM_NOUVEAU
-	help
-	  Support for Nvidia-based GPUs.
-
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
-	bool "DRI radeon r100 driver"
-	depends on BR2_i386 || BR2_x86_64
-	# libdrm's radeon option depends on LIBDRM_HAS_ATOMIC. Propagating
-	# that dependency here causes a circular dependency that Kconfig
-	# can't see is just spurious. However, that dependency is about
-	# the toolchain having sync4 primitives, which is always a given
-	# for i386 and x86_64.
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-	select BR2_PACKAGE_LIBDRM_RADEON
-	help
-	  Legacy Radeon driver for R100 series GPUs.
-
 comment "Vulkan drivers"
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
@@ -406,17 +348,16 @@ comment "OpenGL API Support"
 
 config BR2_PACKAGE_MESA3D_GBM
 	bool "gbm"
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER \
-		|| (BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && \
+		BR2_PACKAGE_MESA3D_OPENGL_EGL
 	select BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
 	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	help
 	  Enable Generic Buffer Management (gbm)
 
-comment "gbm support needs a dri driver or a gallium driver w/ EGL support."
-	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER \
-		&& !(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
+comment "gbm support needs a gallium driver w/ EGL support."
+	depends on !(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
 
 config BR2_PACKAGE_MESA3D_OPENGL_GLX
 	bool "OpenGL GLX"
@@ -432,7 +373,7 @@ comment "OpenGL GLX support needs X11"
 
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_HAS_LIBEGL if !BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_LIBGLVND_DISPATCH_EGL if BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 5b74e14fef..32221b8c89 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2022-March/000666.html
-sha256  e70d273bdc53a4e931871bb5550ba3900e6a3deab2fff64184107c33e92d9da7  mesa-21.3.8.tar.xz
-sha512  0462c44fa8e358dafd03088411452bc172a365902795b3198df1e6cfbf1d87675ef5b72b572de7f15e5ee87b30ce5b2f217c81ea72b376962f6428c6ff83f2e9  mesa-21.3.8.tar.xz
-
+# From https://lists.freedesktop.org/archives/mesa-announce/2022-May/000673.html
+sha256  9f2b30f5276a9abaf71aafc6979685e2636189de1a87aea2c9e69744a6d0ebb9  mesa-22.0.3.tar.xz
+sha512  3982cd2fadca5349b2513885ed734c2422e3f2dced85f471f245b120ffaf018acafcd929dc5ec317f2c568bb5f619f5a3475d3a92495f766a2eefb225efcac14  mesa-22.0.3.tar.xz
 # License
-sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
+sha256  4bc15d14dcc134b024cbdca3b5330010136ce8a427b6f8353440ce2ad7aab037  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9f375edc1f..aa6a4ac958 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.3.8
+MESA3D_VERSION = 22.0.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -114,11 +114,6 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
-# DRI Drivers
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
@@ -133,15 +128,6 @@ MESA3D_CONF_OPTS += \
 	-Dgallium-extra-hud=true
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-MESA3D_CONF_OPTS += \
-	-Ddri-drivers=
-else
-MESA3D_CONF_OPTS += \
-	-Dshared-glapi=enabled \
-	-Ddri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
-endif
-
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
