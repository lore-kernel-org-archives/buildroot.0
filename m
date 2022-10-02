Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4D1C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 15:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B52C34048E;
	Sun,  2 Oct 2022 15:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B52C34048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtIXfu7iFNbI; Sun,  2 Oct 2022 15:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46F5B4047C;
	Sun,  2 Oct 2022 15:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46F5B4047C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88F341BF3C3
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 15:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56BBD4047C
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 15:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56BBD4047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Flmn8hOtYLOQ for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 15:51:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D14A402E0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D14A402E0
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 15:51:43 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout09.t-online.de (Postfix) with SMTP id 7FDBDA10B;
 Sun,  2 Oct 2022 17:51:30 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.204.166]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1of1FZ-2jnyT30; Sun, 2 Oct 2022 17:51:29 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55358)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1of1FZ-0007sk-0U;
 Sun, 02 Oct 2022 17:51:29 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  2 Oct 2022 17:51:29 +0200
Message-Id: <20221002155129.3199774-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1664725889-61A0C2DC-486D298E/0/0 CLEAN NORMAL
X-TOI-MSGID: e6426321-981b-4eb3-be3e-18dd1f02d21c
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.2.0
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
https://lists.freedesktop.org/archives/mesa-announce/2022-September/000687.html
https://www.phoronix.com/news/Mesa-22.2-Released

Removed patches included in upstream release, renumbered remaining
patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk      |   2 +-
 ...rt-isinf-for-uclibc-based-toolchains.patch |  30 -----
 ...-proper-value-for-LIBCLC_INCLUDEDIR.patch} |   0
 ...ion-to-disable-optional-neon-suppor.patch} |   0
 ...-Include-stddef.h-to-fix-build-erro.patch} |   0
 ...uild.patch => 0004-Fix-uClibc-build.patch} |   0
 ...-fix-build-on-32-bit-architectures-u.patch |  43 ------
 ...emove-needless-c99-compat-h-includes.patch | 126 ------------------
 .../0007-include-drop-c11-compat-h.patch      | 100 --------------
 package/mesa3d/mesa3d.hash                    |   8 +-
 package/mesa3d/mesa3d.mk                      |   2 +-
 11 files changed, 6 insertions(+), 305 deletions(-)
 delete mode 100644 package/mesa3d/0001-c99_math-import-isinf-for-uclibc-based-toolchains.patch
 rename package/mesa3d/{0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch => 0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch} (100%)
 rename package/mesa3d/{0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch => 0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch} (100%)
 rename package/mesa3d/{0004-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch => 0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch} (100%)
 rename package/mesa3d/{0008-Fix-uClibc-build.patch => 0004-Fix-uClibc-build.patch} (100%)
 delete mode 100644 package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch
 delete mode 100644 package/mesa3d/0006-util-remove-needless-c99-compat-h-includes.patch
 delete mode 100644 package/mesa3d/0007-include-drop-c11-compat-h.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 7a777fb783..bf72937a66 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 22.1.6
+MESA3D_HEADERS_VERSION = 22.2.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0001-c99_math-import-isinf-for-uclibc-based-toolchains.patch b/package/mesa3d/0001-c99_math-import-isinf-for-uclibc-based-toolchains.patch
deleted file mode 100644
index 5acbaa4daa..0000000000
--- a/package/mesa3d/0001-c99_math-import-isinf-for-uclibc-based-toolchains.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 705490763fcc052defa2d49a5c5200775cd12c54 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Wed, 4 Mar 2020 08:27:24 +0100
-Subject: [PATCH] c99_math: import isinf for uclibc based toolchains
-
-The same fix as for glibc >= 2.23 is needed for uclibc
-based toolchains.
-
-[Upstream suggested: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4042]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- include/c99_math.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/c99_math.h b/include/c99_math.h
-index e906c26aa54..c8a73a2d2c7 100644
---- a/include/c99_math.h
-+++ b/include/c99_math.h
-@@ -190,7 +190,7 @@ fpclassify(double x)
-  * undefines those functions, which in glibc 2.23, are defined as macros rather
-  * than functions as in glibc 2.22.
-  */
--#if __cplusplus >= 201103L && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 23))
-+#if __cplusplus >= 201103L && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 23) || defined(__UCLIBC__))
- #include <cmath>
- 
- using std::fpclassify;
--- 
-2.25.1
-
diff --git a/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
similarity index 100%
rename from package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
rename to package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
diff --git a/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
similarity index 100%
rename from package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
rename to package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
diff --git a/package/mesa3d/0004-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch b/package/mesa3d/0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
similarity index 100%
rename from package/mesa3d/0004-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
rename to package/mesa3d/0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
diff --git a/package/mesa3d/0008-Fix-uClibc-build.patch b/package/mesa3d/0004-Fix-uClibc-build.patch
similarity index 100%
rename from package/mesa3d/0008-Fix-uClibc-build.patch
rename to package/mesa3d/0004-Fix-uClibc-build.patch
diff --git a/package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch b/package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch
deleted file mode 100644
index b01db8a4b4..0000000000
--- a/package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e501b7c17ada9c694d3f8302622b78d733485b38 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 21 Aug 2021 17:55:33 +0200
-Subject: [PATCH] src/util/futex.h: fix build on 32-bit architectures using
- 64-bit time_t
-
-Fix the following build failure on 32-bit architectures using 64-bit
-time_t (e.g. riscv32):
-
-../src/util/futex.h: In function 'sys_futex':
-../src/util/futex.h:39:19: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
-   39 |    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
-      |                   ^~~~~~~~~
-      |                   sys_futex
-
-Fixes:
- - http://autobuild.buildroot.org/results/692700a5f967760a0b8cd358b1712f1d5a7b681e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12496]
----
- src/util/futex.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/util/futex.h b/src/util/futex.h
-index 43097f4cd5b..221eda9db0c 100644
---- a/src/util/futex.h
-+++ b/src/util/futex.h
-@@ -34,6 +34,10 @@
- #include <sys/syscall.h>
- #include <sys/time.h>
- 
-+#ifndef SYS_futex
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- static inline long sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, void *addr2, int val3)
- {
-    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
--- 
-2.32.0
-
diff --git a/package/mesa3d/0006-util-remove-needless-c99-compat-h-includes.patch b/package/mesa3d/0006-util-remove-needless-c99-compat-h-includes.patch
deleted file mode 100644
index cac61b351a..0000000000
--- a/package/mesa3d/0006-util-remove-needless-c99-compat-h-includes.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From 9f717b5f23cbf24dc4c58bc688c931af91975e80 Mon Sep 17 00:00:00 2001
-From: Erik Faye-Lund <erik.faye-lund@collabora.com>
-Date: Wed, 1 Jun 2022 14:17:43 +0200
-Subject: util: remove needless c99_compat.h includes
-
-Reviewed-by: Jesse Natalie <jenatali@microsoft.com>
-Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>
-Reviewed-by: Eric Engestrom <eric@engestrom.ch>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16812>
-
-Downloaded from upstream commit
-https://cgit.freedesktop.org/mesa/mesa/patch/?id=9f717b5f23cbf24dc4c58bc688c931af91975e80
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/util/bitscan.h     | 2 --
- src/util/compiler.h    | 2 --
- src/util/format_srgb.h | 1 -
- src/util/hash_table.h  | 1 -
- src/util/list.h        | 1 -
- src/util/macros.h      | 1 -
- src/util/mesa-sha1.h   | 1 -
- src/util/ptralloc.h    | 1 -
- 8 files changed, 10 deletions(-)
-
-diff --git a/src/util/bitscan.h b/src/util/bitscan.h
-index 726d2d2c385..53cbb91e98c 100644
---- a/src/util/bitscan.h
-+++ b/src/util/bitscan.h
-@@ -42,8 +42,6 @@
- #include <popcntintrin.h>
- #endif
- 
--#include "c99_compat.h"
--
- #ifdef __cplusplus
- extern "C" {
- #endif
-diff --git a/src/util/compiler.h b/src/util/compiler.h
-index 83f8e346a08..d184ad455af 100644
---- a/src/util/compiler.h
-+++ b/src/util/compiler.h
-@@ -38,8 +38,6 @@
- 
- #include "util/macros.h"
- 
--#include "c99_compat.h" /* inline, __func__, etc. */
--
- 
- /**
-  * Either define MESA_BIG_ENDIAN or MESA_LITTLE_ENDIAN, and CPU_TO_LE32.
-diff --git a/src/util/format_srgb.h b/src/util/format_srgb.h
-index 596af56f4cd..5861b238270 100644
---- a/src/util/format_srgb.h
-+++ b/src/util/format_srgb.h
-@@ -39,7 +39,6 @@
- 
- #include <stdint.h>
- #include <math.h>
--#include "c99_compat.h"
- 
- extern const float
- util_format_srgb_8unorm_to_linear_float_table[256];
-diff --git a/src/util/hash_table.h b/src/util/hash_table.h
-index c8a96b79edf..002d6c58873 100644
---- a/src/util/hash_table.h
-+++ b/src/util/hash_table.h
-@@ -31,7 +31,6 @@
- #include <stdlib.h>
- #include <inttypes.h>
- #include <stdbool.h>
--#include "c99_compat.h"
- #include "macros.h"
- 
- #ifdef __cplusplus
-diff --git a/src/util/list.h b/src/util/list.h
-index 5ef49e4e955..edc596f3d2d 100644
---- a/src/util/list.h
-+++ b/src/util/list.h
-@@ -41,7 +41,6 @@
- #include <stdbool.h>
- #include <stddef.h>
- #include <assert.h>
--#include "c99_compat.h"
- 
- #ifdef DEBUG
- #  define list_assert(cond, msg)  assert(cond && msg)
-diff --git a/src/util/macros.h b/src/util/macros.h
-index 2138f5d662d..a5dc4846211 100644
---- a/src/util/macros.h
-+++ b/src/util/macros.h
-@@ -27,7 +27,6 @@
- #include <stdio.h>
- #include <assert.h>
- 
--#include "c99_compat.h"
- #include "c11_compat.h"
- 
- #include <stdint.h>
-diff --git a/src/util/mesa-sha1.h b/src/util/mesa-sha1.h
-index 9d174fd9b99..809fabc525f 100644
---- a/src/util/mesa-sha1.h
-+++ b/src/util/mesa-sha1.h
-@@ -26,7 +26,6 @@
- #include <stdlib.h>
- #include <stdio.h>
- #include <stdbool.h>
--#include "c99_compat.h"
- #include "sha1/sha1.h"
- 
- #ifdef __cplusplus
-diff --git a/src/util/ptralloc.h b/src/util/ptralloc.h
-index f74d8c3645d..ca6ded82a2d 100644
---- a/src/util/ptralloc.h
-+++ b/src/util/ptralloc.h
-@@ -29,7 +29,6 @@
- #include <stdlib.h>
- #include <inttypes.h>
- #include <stdbool.h>
--#include "c99_compat.h"
- #include "macros.h"
- 
- #ifdef __cplusplus
--- 
-cgit v1.2.1
-
diff --git a/package/mesa3d/0007-include-drop-c11-compat-h.patch b/package/mesa3d/0007-include-drop-c11-compat-h.patch
deleted file mode 100644
index 64cdb8074b..0000000000
--- a/package/mesa3d/0007-include-drop-c11-compat-h.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From df2dd474c73982e89d0ed71951ff723eb7060ce6 Mon Sep 17 00:00:00 2001
-From: Erik Faye-Lund <erik.faye-lund@collabora.com>
-Date: Wed, 1 Jun 2022 13:38:39 +0200
-Subject: include: drop c11_compat.h
-
-We now require C11, and C++ supports static_assert just fine, which is
-the only thing this header ever added support for. So let's get rid of
-this needless header.
-
-Reviewed-by: Jesse Natalie <jenatali@microsoft.com>
-Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>
-Reviewed-by: Eric Engestrom <eric@engestrom.ch>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16812>
-
-Downloaded from upstream commit
-https://cgit.freedesktop.org/mesa/mesa/commit/?id=df2dd474c73982e89d0ed71951ff723eb7060ce6
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/c11_compat.h                    | 27 ---------------------------
- src/amd/common/ac_sqtt.h                |  1 -
- src/imagination/vulkan/pvr_cmd_buffer.c |  1 -
- src/util/macros.h                       |  3 ---
- 4 files changed, 32 deletions(-)
- delete mode 100644 include/c11_compat.h
-
-diff --git a/include/c11_compat.h b/include/c11_compat.h
-deleted file mode 100644
-index d35740f47a4..00000000000
---- a/include/c11_compat.h
-+++ /dev/null
-@@ -1,27 +0,0 @@
--/* Copyright 2019 Intel Corporation */
--/* SPDX-License-Identifier: MIT */
--
--#include "no_extern_c.h"
--
--#ifndef _C11_COMPAT_H_
--#define _C11_COMPAT_H_
--
--#if defined(__cplusplus)
--   /* This is C++ code, not C */
--#elif (__STDC_VERSION__ >= 201112L)
--   /* Already C11 */
--#else
--
--
--/*
-- * C11 static_assert() macro
-- * assert.h only defines that name for C11 and above
-- */
--#ifndef static_assert
--#define static_assert _Static_assert
--#endif
--
--
--#endif /* !C++ && !C11 */
--
--#endif /* _C11_COMPAT_H_ */
-diff --git a/src/amd/common/ac_sqtt.h b/src/amd/common/ac_sqtt.h
-index 55130aa2221..05798b7e1da 100644
---- a/src/amd/common/ac_sqtt.h
-+++ b/src/amd/common/ac_sqtt.h
-@@ -30,7 +30,6 @@
- #include <stdbool.h>
- 
- #include <assert.h>
--#include "c11_compat.h"
- #include "ac_rgp.h"
- 
- struct radeon_cmdbuf;
-diff --git a/src/imagination/vulkan/pvr_cmd_buffer.c b/src/imagination/vulkan/pvr_cmd_buffer.c
-index 0afd463e2fb..4fe224f481d 100644
---- a/src/imagination/vulkan/pvr_cmd_buffer.c
-+++ b/src/imagination/vulkan/pvr_cmd_buffer.c
-@@ -29,7 +29,6 @@
- #include <string.h>
- #include <vulkan/vulkan.h>
- 
--#include "c11_compat.h"
- #include "hwdef/rogue_hw_defs.h"
- #include "hwdef/rogue_hw_utils.h"
- #include "pvr_bo.h"
-diff --git a/src/util/macros.h b/src/util/macros.h
-index a5dc4846211..dd8af86bcf8 100644
---- a/src/util/macros.h
-+++ b/src/util/macros.h
-@@ -26,9 +26,6 @@
- 
- #include <stdio.h>
- #include <assert.h>
--
--#include "c11_compat.h"
--
- #include <stdint.h>
- 
- /* Compute the size of an array */
--- 
-cgit v1.2.1
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index ab20063cd9..449fc58818 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2022-August/000683.html
-sha256  22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a  mesa-22.1.6.tar.xz
-sha512  3b2a0bb781c3d540401e6f51e3cf0d87d4e22923b6a5a4ea9d8ce5c79b4a2d5e8b1c237a36325d7d7178448ae102470ebefb312644dc09818cce91fd5439cb07  mesa-22.1.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2022-September/000687.html
+sha256  b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c  mesa-22.2.0.tar.xz
+sha512  13a21b9ed6b0a5dfd0293b73df271a929c3155d83e8beb3d958fe18d79277f3611bf5b26a1186d446f4e1479a36bb13d0a13d6ac68937989fe7a0d917e12171e  mesa-22.2.0.tar.xz
 # License
-sha256  4bc15d14dcc134b024cbdca3b5330010136ce8a427b6f8353440ce2ad7aab037  docs/license.rst
+sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9fc9935614..5e473bbeea 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 22.1.6
+MESA3D_VERSION = 22.2.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
