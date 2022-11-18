Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C348CC433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Nov 2022 17:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61F9760BB4;
	Fri, 18 Nov 2022 17:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61F9760BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4ur4hgbR_p2; Fri, 18 Nov 2022 17:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62EA860BC2;
	Fri, 18 Nov 2022 17:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62EA860BC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AB171BF2EB
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 17:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3614D82253
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 17:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3614D82253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLg9O1dnxlrb for <buildroot@lists.busybox.net>;
 Fri, 18 Nov 2022 17:06:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B782F821F9
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B782F821F9
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 17:06:46 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout03.t-online.de (Postfix) with SMTP id 32E8F670F;
 Fri, 18 Nov 2022 18:06:44 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.191.22]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ow4p7-3Bh3zt0; Fri, 18 Nov 2022 18:06:42 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56856)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ow4p7-0001fX-1n;
 Fri, 18 Nov 2022 18:06:41 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 18 Nov 2022 18:06:41 +0100
Message-Id: <20221118170641.46913-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118170641.46913-1-bernd.kuhls@t-online.de>
References: <20221118170641.46913-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1668791202-C1B201D1-12E137F4/0/0 CLEAN NORMAL
X-TOI-MSGID: 150121a4-1c1b-4e2d-83c5-d34ebb2b031f
Subject: [Buildroot] [PATCH/next 2/2] package/intel-mediadriver: bump
 version to 22.6.3
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which was applied upstream:
https://github.com/intel/media-driver/commit/be887135b89eee5b6c19c3381bf65649037fd66b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ck-for-backtrace-3-via-FindBacktrace.patch | 150 ------------------
 .../intel-mediadriver/intel-mediadriver.hash  |   2 +-
 .../intel-mediadriver/intel-mediadriver.mk    |   2 +-
 3 files changed, 2 insertions(+), 152 deletions(-)
 delete mode 100644 package/intel-mediadriver/0001-build-check-for-backtrace-3-via-FindBacktrace.patch

diff --git a/package/intel-mediadriver/0001-build-check-for-backtrace-3-via-FindBacktrace.patch b/package/intel-mediadriver/0001-build-check-for-backtrace-3-via-FindBacktrace.patch
deleted file mode 100644
index 46d843924e..0000000000
--- a/package/intel-mediadriver/0001-build-check-for-backtrace-3-via-FindBacktrace.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 08ad0e3da9f9ab48e423d0aea2af9605190aafe7 Mon Sep 17 00:00:00 2001
-From: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
-Date: Mon, 31 Oct 2022 16:41:43 -0700
-Subject: [PATCH] build: check for backtrace(3) via FindBacktrace
-
-Fixes: #1533
-
-Change-Id: I81bcdb5e65c26f94b174af9b5e6218c14601c50f
-Signed-off-by: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
-
-Downloaded from upstream PR:
-https://github.com/intel/media-driver/pull/1536
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- media_driver/media_top_cmake.cmake            | 11 +++++-
- .../common/os/osservice/media_srcs.cmake      |  3 ++
- .../linux/common/os/osservice/mos_compat.h.in | 35 +++++++++++++++++++
- .../os/osservice/mos_utilities_specific.cpp   |  4 ++-
- 4 files changed, 51 insertions(+), 2 deletions(-)
- create mode 100644 media_softlet/linux/common/os/osservice/mos_compat.h.in
-
-diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
-index 1a8b3b242..e71c8630d 100755
---- a/media_driver/media_top_cmake.cmake
-+++ b/media_driver/media_top_cmake.cmake
-@@ -22,6 +22,10 @@ project( media )
- 
- find_package(PkgConfig)
- find_package(X11)
-+find_package(Backtrace)
-+
-+# to get access to generated header files
-+include_directories(${CMAKE_BINARY_DIR})
- 
- bs_set_if_undefined(LIB_NAME iHD_drv_video)
- 
-@@ -381,10 +385,15 @@ set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS ${MEDIA_LINK_FLAGS})
- set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
- set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
- 
-+set(MEDIA_LINK_EXTERNAL_LIBS "${PKG_PCIACCESS_LIBRARIES} m pthread dl")
-+if(Backtrace_FOUND)
-+    set(MEDIA_LINK_EXTERNAL_LIBS "${MEDIA_LINK_EXTERNAL_LIBS} ${Backtrace_LIBRARY}")
-+endif()
-+
- bs_ufo_link_libraries_noBsymbolic(
-     ${LIB_NAME}
-     "${INCLUDED_LIBS}"
--    "${PKG_PCIACCESS_LIBRARIES} m pthread dl"
-+    "${MEDIA_LINK_EXTERNAL_LIBS}"
- )
- 
- if (NOT DEFINED INCLUDED_LIBS OR "${INCLUDED_LIBS}" STREQUAL "")
-diff --git a/media_softlet/linux/common/os/osservice/media_srcs.cmake b/media_softlet/linux/common/os/osservice/media_srcs.cmake
-index e90c502f3..4e8aad1d8 100644
---- a/media_softlet/linux/common/os/osservice/media_srcs.cmake
-+++ b/media_softlet/linux/common/os/osservice/media_srcs.cmake
-@@ -18,12 +18,15 @@
- # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- # OTHER DEALINGS IN THE SOFTWARE.
- 
-+configure_file(${CMAKE_CURRENT_LIST_DIR}/mos_compat.h.in ${CMAKE_BINARY_DIR}/mos_compat.h)
-+
- set(TMP_SOURCES_
-     ${CMAKE_CURRENT_LIST_DIR}/mos_util_debug_specific.cpp
-     ${CMAKE_CURRENT_LIST_DIR}/mos_utilities_specific.cpp
- )
- 
- set(TMP_HEADERS_
-+    ${CMAKE_BINARY_DIR}/mos_compat.h
-     ${CMAKE_CURRENT_LIST_DIR}/mos_utilities_specific.h
-     ${CMAKE_CURRENT_LIST_DIR}/mos_util_debug_specific.h
- )
-diff --git a/media_softlet/linux/common/os/osservice/mos_compat.h.in b/media_softlet/linux/common/os/osservice/mos_compat.h.in
-new file mode 100644
-index 000000000..4a04febe5
---- /dev/null
-+++ b/media_softlet/linux/common/os/osservice/mos_compat.h.in
-@@ -0,0 +1,35 @@
-+/*
-+* Copyright (c) 2022, Intel Corporation
-+*
-+* Permission is hereby granted, free of charge, to any person obtaining a
-+* copy of this software and associated documentation files (the "Software"),
-+* to deal in the Software without restriction, including without limitation
-+* the rights to use, copy, modify, merge, publish, distribute, sublicense,
-+* and/or sell copies of the Software, and to permit persons to whom the
-+* Software is furnished to do so, subject to the following conditions:
-+*
-+* The above copyright notice and this permission notice shall be included
-+* in all copies or substantial portions of the Software.
-+*
-+* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-+* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-+* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
-+* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
-+* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-+* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-+* OTHER DEALINGS IN THE SOFTWARE.
-+*/
-+
-+#ifndef __MOS_COMPAT_H__
-+#define __MOS_COMPAT_H__
-+
-+// clib implementations (musl, uClibc) might provide backtrace(3)
-+// in different header files or not provide it all and rely on external
-+// implementations. So, we need to detect which header to be used.
-+#cmakedefine01 Backtrace_FOUND
-+#if Backtrace_FOUND
-+#include <${Backtrace_HEADER}>
-+#endif
-+
-+#endif // __MOS_COMPAT_H__
-+
-diff --git a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
-index 305a0e01c..02555837a 100644
---- a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
-+++ b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
-@@ -34,13 +34,13 @@
- #include <signal.h>
- #include <unistd.h>  // fork
- #include <algorithm>
--#include <execinfo.h> // backtrace
- #include <sys/types.h>
- #include <sys/stat.h>  // fstat
- #include <sys/ipc.h>  // System V IPC
- #include <sys/types.h>
- #include <sys/sem.h>
- #include <sys/mman.h>
-+#include "mos_compat.h" // libc variative definitions: backtrace
- #include "mos_user_setting.h"
- #include "mos_utilities_specific.h"
- #include "mos_utilities.h"
-@@ -2492,6 +2492,7 @@ void MosUtilities::MosTraceEvent(
-                 MOS_FreeMemory(pTraceBuf);
-             }
-         }
-+#if Backtrace_FOUND
-         if (m_mosTraceFilter(TR_KEY_CALL_STACK))
-         {
-             // reserve space for header and stack size field.
-@@ -2511,6 +2512,7 @@ void MosUtilities::MosTraceEvent(
-                 size_t ret = write(MosUtilitiesSpecificNext::m_mosTraceFd, traceBuf, nLen);
-             }
-         }
-+#endif
-     }
-     return;
- }
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a42a7841d5..0a42475400 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a59c4c9facf567ccbea3aab36b150d961c56e48461283a2aa7c438a311b4d2d0  intel-media-22.6.2.tar.gz
+sha256  f42c41dce7ab4213e21f6599cd0602e5ab40a8182ec286bfc0a16547721dff7a  intel-media-22.6.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 88071f5b85..e26c2472be 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 22.6.2
+INTEL_MEDIADRIVER_VERSION = 22.6.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
