Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B130C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD0374169C;
	Sat, 23 Jul 2022 20:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD0374169C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OB9VPSr6q90V; Sat, 23 Jul 2022 20:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5B4B4049B;
	Sat, 23 Jul 2022 20:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5B4B4049B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44C871BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FF544049B
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FF544049B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBQ2GTfT2Mlt for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:30:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 655CB4019C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 655CB4019C
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CAFBA852B2; Sat, 23 Jul 2022 20:16:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:30:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19ad2dd11a4c4ea8a495365aa704f61512863b0b
X-Git-Newrev: 6c25d1099ac238c3c5a2ce75fc91c3842a50e2cd
X-Patchwork-Hint: ignore
Message-Id: <20220723201652.CAFBA852B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 22.1.3
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6755521152772958518=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6755521152772958518==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6c25d1099ac238c3c5a2ce75fc91c3842a50e2cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes for 22.0.x:
https://lists.freedesktop.org/archives/mesa-announce/2022-March/000665.html
https://lists.freedesktop.org/archives/mesa-announce/2022-March/000667.html
https://lists.freedesktop.org/archives/mesa-announce/2022-April/000670.html
https://lists.freedesktop.org/archives/mesa-announce/2022-May/000673.html
https://www.phoronix.com/scan.php?page=news_item&px=Mesa-22.0-Released

Release notes for 22.1.x:
https://lists.freedesktop.org/archives/mesa-announce/2022-May/000675.html
https://lists.freedesktop.org/archives/mesa-announce/2022-June/000678.html
https://lists.freedesktop.org/archives/mesa-announce/2022-June/000681.html
https://lists.freedesktop.org/archives/mesa-announce/2022-June/000682.html

Removed patch 0006, upstream committed a similar fix:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=22.1&id=623ff4ec4295dc67bc0c99ed5336eaae1ad76cc9

While sending upstream the rebased version of patch 0007 it occured that
the patched file include/c11_compat.h was removed from the main branch.
Instead of keeping care of two different uClibc fixes, both for the 22.1
branch and the main branch, we backport two patches from the main branch:
- patch 0007 which removes include/c11_compat.h
- patch 0006 which is a pre-requisite of patch 0007
and add an upstreamable patch as 0008.

Updated license hash due to upstream commits:
https://cgit.freedesktop.org/mesa/mesa/commit/docs/license.rst?h=22.1&id=8bd0446d00dd1aca3cd81ddddc463738aaf3ce61
https://cgit.freedesktop.org/mesa/mesa/commit/docs/license.rst?h=22.1&id=d16263cdee95ec48864ad7a0f90275e8a4fd374b

Removed all DRI driver options due to upstream removal of all DRI
drivers:
https://cgit.freedesktop.org/mesa/mesa/commit/meson_options.txt?h=22.1&id=4d45b280bf9a1c804cea5de4d15c317b6bdebfc5
https://cgit.freedesktop.org/mesa/mesa/commit/meson_options.txt?h=22.1&id=f464871932882003e01e3459c8d126dd975d60f8
https://cgit.freedesktop.org/mesa/mesa/commit/meson_options.txt?h=22.1&id=0cad451f007f366d94e058b7c717b96723a3e6cd
https://cgit.freedesktop.org/mesa/mesa/commit/meson_options.txt?h=22.1&id=cdde031ac2c8124721655532ee6f4149e20e9c61

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  24 ++++
 package/mesa3d-headers/mesa3d-headers.mk           |  12 +-
 package/mesa3d/0006-fix-valist.patch               |  37 ------
 ...til-remove-needless-c99-compat-h-includes.patch | 126 +++++++++++++++++++++
 package/mesa3d/0007-fix-cpp-detection.patch        |  40 -------
 .../mesa3d/0007-include-drop-c11-compat-h.patch    | 100 ++++++++++++++++
 package/mesa3d/0008-Fix-uClibc-build.patch         |  65 +++++++++++
 package/mesa3d/Config.in                           |  69 +----------
 package/mesa3d/mesa3d.hash                         |   9 +-
 package/mesa3d/mesa3d.mk                           |  16 +--
 10 files changed, 326 insertions(+), 172 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 53ff1294c7..949bca1cd0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,30 @@ endif
 
 comment "Legacy options removed in 2022.08"
 
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
 config BR2_GCC_VERSION_9_X
 	bool "gcc 9.x support removed"
 	select BR2_LEGACY
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 760c5368e5..6a9810b880 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.3.8
+MESA3D_HEADERS_VERSION = 22.1.3
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
diff --git a/package/mesa3d/0006-fix-valist.patch b/package/mesa3d/0006-fix-valist.patch
deleted file mode 100644
index 84a254cec5..0000000000
--- a/package/mesa3d/0006-fix-valist.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f6892df8eb115fa712fd69068432b48b028e1e54 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 20 Nov 2021 22:48:54 +0100
-Subject: [PATCH] util/u_printf.h: fix build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build error with uClibc and gcc-9.3.0:
-
-In file included from ../src/util/u_printf.cpp:24:
-../src/util/u_printf.h:43:41: error: ‘va_list’ has not been declared
-   43 | size_t u_printf_length(const char *fmt, va_list untouched_args);
-
-Patch sent upstream:
-https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13897
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/util/u_printf.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/util/u_printf.h b/src/util/u_printf.h
-index 44dcce5529f..14f324de10c 100644
---- a/src/util/u_printf.h
-+++ b/src/util/u_printf.h
-@@ -25,6 +25,7 @@
- #ifdef __cplusplus
- 
- #include <string>
-+#include <stdarg.h>
- 
- /* find next valid printf specifier in a C++ std::string */
- size_t util_printf_next_spec_pos(const std::string &s, size_t pos);
--- 
-GitLab
-
diff --git a/package/mesa3d/0006-util-remove-needless-c99-compat-h-includes.patch b/package/mesa3d/0006-util-remove-needless-c99-compat-h-includes.patch
new file mode 100644
index 0000000000..cac61b351a
--- /dev/null
+++ b/package/mesa3d/0006-util-remove-needless-c99-compat-h-includes.patch
@@ -0,0 +1,126 @@
+From 9f717b5f23cbf24dc4c58bc688c931af91975e80 Mon Sep 17 00:00:00 2001
+From: Erik Faye-Lund <erik.faye-lund@collabora.com>
+Date: Wed, 1 Jun 2022 14:17:43 +0200
+Subject: util: remove needless c99_compat.h includes
+
+Reviewed-by: Jesse Natalie <jenatali@microsoft.com>
+Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>
+Reviewed-by: Eric Engestrom <eric@engestrom.ch>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16812>
+
+Downloaded from upstream commit
+https://cgit.freedesktop.org/mesa/mesa/patch/?id=9f717b5f23cbf24dc4c58bc688c931af91975e80
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/util/bitscan.h     | 2 --
+ src/util/compiler.h    | 2 --
+ src/util/format_srgb.h | 1 -
+ src/util/hash_table.h  | 1 -
+ src/util/list.h        | 1 -
+ src/util/macros.h      | 1 -
+ src/util/mesa-sha1.h   | 1 -
+ src/util/ptralloc.h    | 1 -
+ 8 files changed, 10 deletions(-)
+
+diff --git a/src/util/bitscan.h b/src/util/bitscan.h
+index 726d2d2c385..53cbb91e98c 100644
+--- a/src/util/bitscan.h
++++ b/src/util/bitscan.h
+@@ -42,8 +42,6 @@
+ #include <popcntintrin.h>
+ #endif
+ 
+-#include "c99_compat.h"
+-
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+diff --git a/src/util/compiler.h b/src/util/compiler.h
+index 83f8e346a08..d184ad455af 100644
+--- a/src/util/compiler.h
++++ b/src/util/compiler.h
+@@ -38,8 +38,6 @@
+ 
+ #include "util/macros.h"
+ 
+-#include "c99_compat.h" /* inline, __func__, etc. */
+-
+ 
+ /**
+  * Either define MESA_BIG_ENDIAN or MESA_LITTLE_ENDIAN, and CPU_TO_LE32.
+diff --git a/src/util/format_srgb.h b/src/util/format_srgb.h
+index 596af56f4cd..5861b238270 100644
+--- a/src/util/format_srgb.h
++++ b/src/util/format_srgb.h
+@@ -39,7 +39,6 @@
+ 
+ #include <stdint.h>
+ #include <math.h>
+-#include "c99_compat.h"
+ 
+ extern const float
+ util_format_srgb_8unorm_to_linear_float_table[256];
+diff --git a/src/util/hash_table.h b/src/util/hash_table.h
+index c8a96b79edf..002d6c58873 100644
+--- a/src/util/hash_table.h
++++ b/src/util/hash_table.h
+@@ -31,7 +31,6 @@
+ #include <stdlib.h>
+ #include <inttypes.h>
+ #include <stdbool.h>
+-#include "c99_compat.h"
+ #include "macros.h"
+ 
+ #ifdef __cplusplus
+diff --git a/src/util/list.h b/src/util/list.h
+index 5ef49e4e955..edc596f3d2d 100644
+--- a/src/util/list.h
++++ b/src/util/list.h
+@@ -41,7 +41,6 @@
+ #include <stdbool.h>
+ #include <stddef.h>
+ #include <assert.h>
+-#include "c99_compat.h"
+ 
+ #ifdef DEBUG
+ #  define list_assert(cond, msg)  assert(cond && msg)
+diff --git a/src/util/macros.h b/src/util/macros.h
+index 2138f5d662d..a5dc4846211 100644
+--- a/src/util/macros.h
++++ b/src/util/macros.h
+@@ -27,7 +27,6 @@
+ #include <stdio.h>
+ #include <assert.h>
+ 
+-#include "c99_compat.h"
+ #include "c11_compat.h"
+ 
+ #include <stdint.h>
+diff --git a/src/util/mesa-sha1.h b/src/util/mesa-sha1.h
+index 9d174fd9b99..809fabc525f 100644
+--- a/src/util/mesa-sha1.h
++++ b/src/util/mesa-sha1.h
+@@ -26,7 +26,6 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <stdbool.h>
+-#include "c99_compat.h"
+ #include "sha1/sha1.h"
+ 
+ #ifdef __cplusplus
+diff --git a/src/util/ptralloc.h b/src/util/ptralloc.h
+index f74d8c3645d..ca6ded82a2d 100644
+--- a/src/util/ptralloc.h
++++ b/src/util/ptralloc.h
+@@ -29,7 +29,6 @@
+ #include <stdlib.h>
+ #include <inttypes.h>
+ #include <stdbool.h>
+-#include "c99_compat.h"
+ #include "macros.h"
+ 
+ #ifdef __cplusplus
+-- 
+cgit v1.2.1
+
diff --git a/package/mesa3d/0007-fix-cpp-detection.patch b/package/mesa3d/0007-fix-cpp-detection.patch
deleted file mode 100644
index 2e097277de..0000000000
--- a/package/mesa3d/0007-fix-cpp-detection.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ab5519971a090863f8c559907766e0b2382e0471 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 20 Nov 2021 23:02:18 +0100
-Subject: [PATCH] c11_compat.h: fix uClibc build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build error with uClibc and gcc-9.3.0:
-
-../src/egl/main/egldisplay.c: In function ‘_eglGetNativePlatformFromEnv’:
-../src/egl/main/egldisplay.c:101:4: error: implicit declaration of function ‘static_assert’ [-Werror=implicit-function-declaration]
-  101 |    static_assert(ARRAY_SIZE(egl_platforms) == _EGL_NUM_PLATFORMS,
-
-CC: 21.3 <mesa-stable>
-
-Patch sent upstream:
-https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13898
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/c11_compat.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/include/c11_compat.h b/include/c11_compat.h
-index d35740f47a4..cdcd3f1f52f 100644
---- a/include/c11_compat.h
-+++ b/include/c11_compat.h
-@@ -8,8 +8,6 @@
- 
- #if defined(__cplusplus)
-    /* This is C++ code, not C */
--#elif (__STDC_VERSION__ >= 201112L)
--   /* Already C11 */
- #else
- 
- 
--- 
-GitLab
-
diff --git a/package/mesa3d/0007-include-drop-c11-compat-h.patch b/package/mesa3d/0007-include-drop-c11-compat-h.patch
new file mode 100644
index 0000000000..64cdb8074b
--- /dev/null
+++ b/package/mesa3d/0007-include-drop-c11-compat-h.patch
@@ -0,0 +1,100 @@
+From df2dd474c73982e89d0ed71951ff723eb7060ce6 Mon Sep 17 00:00:00 2001
+From: Erik Faye-Lund <erik.faye-lund@collabora.com>
+Date: Wed, 1 Jun 2022 13:38:39 +0200
+Subject: include: drop c11_compat.h
+
+We now require C11, and C++ supports static_assert just fine, which is
+the only thing this header ever added support for. So let's get rid of
+this needless header.
+
+Reviewed-by: Jesse Natalie <jenatali@microsoft.com>
+Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>
+Reviewed-by: Eric Engestrom <eric@engestrom.ch>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16812>
+
+Downloaded from upstream commit
+https://cgit.freedesktop.org/mesa/mesa/commit/?id=df2dd474c73982e89d0ed71951ff723eb7060ce6
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/c11_compat.h                    | 27 ---------------------------
+ src/amd/common/ac_sqtt.h                |  1 -
+ src/imagination/vulkan/pvr_cmd_buffer.c |  1 -
+ src/util/macros.h                       |  3 ---
+ 4 files changed, 32 deletions(-)
+ delete mode 100644 include/c11_compat.h
+
+diff --git a/include/c11_compat.h b/include/c11_compat.h
+deleted file mode 100644
+index d35740f47a4..00000000000
+--- a/include/c11_compat.h
++++ /dev/null
+@@ -1,27 +0,0 @@
+-/* Copyright 2019 Intel Corporation */
+-/* SPDX-License-Identifier: MIT */
+-
+-#include "no_extern_c.h"
+-
+-#ifndef _C11_COMPAT_H_
+-#define _C11_COMPAT_H_
+-
+-#if defined(__cplusplus)
+-   /* This is C++ code, not C */
+-#elif (__STDC_VERSION__ >= 201112L)
+-   /* Already C11 */
+-#else
+-
+-
+-/*
+- * C11 static_assert() macro
+- * assert.h only defines that name for C11 and above
+- */
+-#ifndef static_assert
+-#define static_assert _Static_assert
+-#endif
+-
+-
+-#endif /* !C++ && !C11 */
+-
+-#endif /* _C11_COMPAT_H_ */
+diff --git a/src/amd/common/ac_sqtt.h b/src/amd/common/ac_sqtt.h
+index 55130aa2221..05798b7e1da 100644
+--- a/src/amd/common/ac_sqtt.h
++++ b/src/amd/common/ac_sqtt.h
+@@ -30,7 +30,6 @@
+ #include <stdbool.h>
+ 
+ #include <assert.h>
+-#include "c11_compat.h"
+ #include "ac_rgp.h"
+ 
+ struct radeon_cmdbuf;
+diff --git a/src/imagination/vulkan/pvr_cmd_buffer.c b/src/imagination/vulkan/pvr_cmd_buffer.c
+index 0afd463e2fb..4fe224f481d 100644
+--- a/src/imagination/vulkan/pvr_cmd_buffer.c
++++ b/src/imagination/vulkan/pvr_cmd_buffer.c
+@@ -29,7 +29,6 @@
+ #include <string.h>
+ #include <vulkan/vulkan.h>
+ 
+-#include "c11_compat.h"
+ #include "hwdef/rogue_hw_defs.h"
+ #include "hwdef/rogue_hw_utils.h"
+ #include "pvr_bo.h"
+diff --git a/src/util/macros.h b/src/util/macros.h
+index a5dc4846211..dd8af86bcf8 100644
+--- a/src/util/macros.h
++++ b/src/util/macros.h
+@@ -26,9 +26,6 @@
+ 
+ #include <stdio.h>
+ #include <assert.h>
+-
+-#include "c11_compat.h"
+-
+ #include <stdint.h>
+ 
+ /* Compute the size of an array */
+-- 
+cgit v1.2.1
+
diff --git a/package/mesa3d/0008-Fix-uClibc-build.patch b/package/mesa3d/0008-Fix-uClibc-build.patch
new file mode 100644
index 0000000000..70ff5e2b4c
--- /dev/null
+++ b/package/mesa3d/0008-Fix-uClibc-build.patch
@@ -0,0 +1,65 @@
+From 09ce52fe375a6fc1ccf51b6b691aaa2c3f53fbd5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 3 Jun 2022 16:26:03 +0200
+Subject: [PATCH] Fix uClibc build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build errors with uClibc and gcc-9.3.0:
+
+../src/gallium/drivers/lima/lima_texture.c:47:15: error: expected
+ declaration specifiers or ‘...’ before ‘__builtin_offsetof’
+   47 | static_assert(offsetof(lima_tex_desc, va) == 24,
+ "lima_tex_desc->va offset isn't 24");
+
+../src/egl/main/egldisplay.c: In function ‘_eglGetNativePlatformFromEnv’:
+ ../src/egl/main/egldisplay.c:101:4: error: implicit declaration of
+ function ‘static_assert’ [-Werror=implicit-function-declaration] 101 |
+ static_assert(ARRAY_SIZE(egl_platforms) == _EGL_NUM_PLATFORMS,
+
+Patch sent upstream:
+https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13898
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/egl/main/egldisplay.c |  1 +
+ src/util/compiler.h       | 10 ++++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/src/egl/main/egldisplay.c b/src/egl/main/egldisplay.c
+index 131fc22786f9..d3e2bb96e2f6 100644
+--- a/src/egl/main/egldisplay.c
++++ b/src/egl/main/egldisplay.c
+@@ -42,6 +42,7 @@
+ #endif
+ #include <fcntl.h>
+ #include "c11/threads.h"
++#include "util/compiler.h"
+ #include "util/macros.h"
+ #include "util/os_file.h"
+ #include "util/u_atomic.h"
+diff --git a/src/util/compiler.h b/src/util/compiler.h
+index d184ad455af9..b5c56807acc6 100644
+--- a/src/util/compiler.h
++++ b/src/util/compiler.h
+@@ -36,6 +36,16 @@
+ 
+ #include <assert.h>
+ 
++/*
++ * C11 static_assert() macro
++ * assert.h only defines that name for C11 and above
++ */
++#if !defined(__cplusplus)
++#ifndef static_assert
++#define static_assert _Static_assert
++#endif
++#endif
++
+ #include "util/macros.h"
+ 
+ 
+-- 
+GitLab
+
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b0ebc09212..23d70d63b0 100644
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
index 5b74e14fef..bf99539d2e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2022-March/000666.html
-sha256  e70d273bdc53a4e931871bb5550ba3900e6a3deab2fff64184107c33e92d9da7  mesa-21.3.8.tar.xz
-sha512  0462c44fa8e358dafd03088411452bc172a365902795b3198df1e6cfbf1d87675ef5b72b572de7f15e5ee87b30ce5b2f217c81ea72b376962f6428c6ff83f2e9  mesa-21.3.8.tar.xz
-
+# From https://lists.freedesktop.org/archives/mesa-announce/2022-June/000682.html
+sha256  b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2f103e2b6c3f093e3  mesa-22.1.3.tar.xz
+sha512  e7348839eb37de89c90d21277a7cbb42ee673ad6c656177853f6d35db99556dbac29867712222342d902b4fa67df5687c9d543bad99c81bcd0ecfb7f08f37480  mesa-22.1.3.tar.xz
 # License
-sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
+sha256  4bc15d14dcc134b024cbdca3b5330010136ce8a427b6f8353440ce2ad7aab037  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9f375edc1f..d012b41c57 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.3.8
+MESA3D_VERSION = 22.1.3
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

--===============6755521152772958518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6755521152772958518==--
