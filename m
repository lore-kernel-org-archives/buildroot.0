Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC87C77B7F
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 16:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92BF542AC5;
	Thu, 11 May 2023 16:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92BF542AC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHp4b5MbgDsE; Thu, 11 May 2023 16:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C3442AC6;
	Thu, 11 May 2023 16:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C3442AC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 861A11BF28F
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 16:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65B5542AC6
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 16:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65B5542AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bD14KI5UMXUk for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 16:10:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D94BF42AC5
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D94BF42AC5
 for <buildroot@buildroot.org>; Thu, 11 May 2023 16:10:52 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout05.t-online.de (Postfix) with SMTP id 9647118250;
 Thu, 11 May 2023 18:10:49 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.197.49]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1px8sT-2QlCSX0; Thu, 11 May 2023 18:10:49 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40118)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1px8sS-0002Iy-2n;
 Thu, 11 May 2023 18:10:49 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 18:10:48 +0200
Message-Id: <20230511161048.21108-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683821449-ACD89DAB-64DF468C/0/0 CLEAN NORMAL
X-TOI-MSGID: cef5ddbf-d06c-4a43-a2f8-4ba087a0876a
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.phoronix.com/news/Mesa-23.1-Released
https://lists.freedesktop.org/archives/mesa-announce/2023-May/000720.html

Rebased patch 0002 due to upstream commits
https://cgit.freedesktop.org/mesa/mesa/commit/?id=6f66b89ac3676bcdaad0da3b9af8aae0ef6b826a
https://cgit.freedesktop.org/mesa/mesa/commit/?id=a18f439f5260b3e183ec6a58bfff2760a5bbe407

Reformatted "Upstream:" tag in patches.

Removed vdpau support from r300 due to upstream commit
https://cgit.freedesktop.org/mesa/mesa/commit/?id=a06ab9849db7fdf8f5194412f0c5a15abd8ece9b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .checkpackageignore                           |  3 ---
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...tion-to-disable-optional-neon-suppor.patch | 20 +++++++++----------
 ...r-Include-stddef.h-to-fix-build-erro.patch |  3 +--
 package/mesa3d/0004-Fix-uClibc-build.patch    |  3 +--
 package/mesa3d/Config.in                      |  4 +---
 package/mesa3d/mesa3d.hash                    |  6 +++---
 package/mesa3d/mesa3d.mk                      |  2 +-
 8 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 41f2253398..23a9205944 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1002,9 +1002,6 @@ package/mender-connect/S43mender-connect Shellcheck
 package/menu-cache/0001-Support-gcc10-compilation.patch Upstream
 package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch Upstream
 package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch Upstream
-package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch Upstream
-package/mesa3d/0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch Upstream
-package/mesa3d/0004-Fix-uClibc-build.patch Upstream
 package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch Upstream
 package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch Upstream
 package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch Upstream
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 4685ad6695..6bfc61bcbf 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.0.3
+MESA3D_HEADERS_VERSION = 23.1.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index bb5ef00a9f..a5564fcf3a 100644
--- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -7,10 +7,10 @@ Not all toolchains are able to compile the runtime
 optional vc4 neon support, so add an meson option
 to force disabling it at compile time.
 
-[Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114]
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[rebased for 20.2.0, 20.3.0 & 21.1.0]
+[rebased for 20.2.0, 20.3.0, 21.1.0 & 23.1.0]
 ---
  meson_options.txt                    | 7 +++++++
  src/gallium/drivers/vc4/meson.build  | 4 ++--
@@ -21,20 +21,20 @@ diff --git a/meson_options.txt b/meson_options.txt
 index a39596a6f19..0f6b6c62b55 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -123,6 +123,13 @@ option(
-   choices : ['auto', 'true', 'false', 'enabled', 'disabled'],
-   description : 'enable gallium va frontend.',
+@@ -117,6 +117,13 @@
  )
-+option(
+ 
+ option(
 +  'gallium-vc4-neon',
-+  type : 'combo',
-+  value : 'auto',
-+  choices : ['auto', 'disabled'],
++  type : 'feature',
++  deprecated: {'true': 'enabled', 'false': 'disabled'},
 +  description : 'enable gallium vc4 optional neon support.',
 +)
- option(
++
++option(
    'va-libs-path',
    type : 'string',
+   value : '',
 diff --git a/src/gallium/drivers/vc4/meson.build b/src/gallium/drivers/vc4/meson.build
 index 5ce5af5f6b4..e3f7d8d62ae 100644
 --- a/src/gallium/drivers/vc4/meson.build
diff --git a/package/mesa3d/0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch b/package/mesa3d/0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
index 538aa74e0c..e30cb97a72 100644
--- a/package/mesa3d/0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
+++ b/package/mesa3d/0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
@@ -15,8 +15,7 @@ output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35
 
 seen with gcc version 8.3.0 (Buildroot 2020.02) and uClibc.
 
-Patch sent upstream:
-https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6248
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6248
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
diff --git a/package/mesa3d/0004-Fix-uClibc-build.patch b/package/mesa3d/0004-Fix-uClibc-build.patch
index 95ca95fd67..ae1fc25f48 100644
--- a/package/mesa3d/0004-Fix-uClibc-build.patch
+++ b/package/mesa3d/0004-Fix-uClibc-build.patch
@@ -23,8 +23,7 @@ Fixes build errors with uClibc and gcc-9.3.0:
    74 |    static_assert(cond, #cond); \
       |    ^~~~~~~~~~~~~
 
-Patch sent upstream:
-https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13898
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13898
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index cae2161aa3..9ac946269a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -283,7 +283,6 @@ config BR2_PACKAGE_MESA3D_VDPAU
 	bool "Gallium VDPAU state tracker"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
-		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	select BR2_PACKAGE_MESA3D_NEEDS_X11
@@ -292,10 +291,9 @@ config BR2_PACKAGE_MESA3D_VDPAU
 	  VDPAU state tracker (needs r300, r600, radeonsi or nouveau
 	  gallium drivers).
 
-comment "Gallium VDPAU state tracker needs X.org and gallium drivers r300, r600, radeonsi or nouveau"
+comment "Gallium VDPAU state tracker needs X.org and gallium drivers r600, radeonsi or nouveau"
 	depends on !BR2_PACKAGE_XORG7 || \
 		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
-		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI)
 
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 0de11663f4..f1eed92fb6 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-April/000717.html
-sha256  386362a5d80df3b096636b67f340e1ce67b705b44767d5bdd11d2ed1037192d5  mesa-23.0.3.tar.xz
-sha512  52c778de61daa406c6a1e96a657e9b6fdcc71c8cfda80b7f53acc6470556c7d502c057b9481bb0c3d57ef0263263413fd0d25d53ebf5aa0246fbcc3309de64ae  mesa-23.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-May/000720.html
+sha256  a9dde3c76571c4806245a05bda1cceee347c3267127e9e549e4f4e225d92e992  mesa-23.1.0.tar.xz
+sha512  bbcfd0dd8e5414826631e80edbbe48218115a7461ef4ac1f2e4e090a48d6c0e1ab3b51dd45e988d5f1572f29bfc03c33769263c0f3e04033138d5b1ec102e8c9  mesa-23.1.0.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 09a12b4b7e..7e41442398 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.0.3
+MESA3D_VERSION = 23.1.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
