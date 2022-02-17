Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2C5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 18:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80A416F72B;
	Thu, 17 Feb 2022 18:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2EImd1nxV8W; Thu, 17 Feb 2022 18:36:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97FF360B8B;
	Thu, 17 Feb 2022 18:36:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB8731BF3EB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 18:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D29794038D
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 18:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-br7N7D1985 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 18:35:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E0784014B
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 18:35:57 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout04.t-online.de (Postfix) with SMTP id 570C67D13;
 Thu, 17 Feb 2022 19:35:54 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.192.64]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nKldC-2Roe6D0; Thu, 17 Feb 2022 19:35:54 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37376)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nKldB-0003Ny-NU;
 Thu, 17 Feb 2022 19:35:53 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 19:35:52 +0100
Message-Id: <20220217183553.210835-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645122954-0000B7AB-F7233D33/0/0 CLEAN NORMAL
X-TOI-MSGID: c606cda5-5649-41ce-8074-b0f90d4207c2
Subject: [Buildroot] [PATCH/next 1/2] package/intel-mediadriver: bump
 version to 22.2.1
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
https://github.com/intel/media-driver/commit/8eab97af6e1c41fc7b9d72999ecb1c22d9e52db6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...001-Add-MEDIA-BUILD-HARDENING-option.patch | 106 ------------------
 .../intel-mediadriver/intel-mediadriver.hash  |   2 +-
 .../intel-mediadriver/intel-mediadriver.mk    |   2 +-
 3 files changed, 2 insertions(+), 108 deletions(-)
 delete mode 100644 package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch

diff --git a/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch b/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
deleted file mode 100644
index 968445759a..0000000000
--- a/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 103c00c8d74a1cd87686850212bd93c0e4d59fc9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 11 Aug 2021 21:34:59 +0200
-Subject: [PATCH] Add MEDIA_BUILD_HARDENING option
-
-Add MEDIA_BUILD_HARDENING option to allow the user to disable hardening
-options such as stack-protector-all or FORTIFY SOURCE 2 which are not
-always available (e.g. fortify source 2 is only available on glibc >= 6
-and not musl/uclibc-ng)
-
-Patch sent upstream: https://github.com/intel/media-driver/pull/1242
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for version 21.4.1]
----
- cmrtlib/linux/CMakeLists.txt                       | 14 ++++++++++----
- .../cmake/linux/media_compile_flags_linux.cmake    | 12 ++++++++++--
- media_driver/media_top_cmake.cmake                 |  8 +++++++-
- 3 files changed, 27 insertions(+), 7 deletions(-)
-
-diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
-index 65f71ceef..b066138d9 100644
---- a/cmrtlib/linux/CMakeLists.txt
-+++ b/cmrtlib/linux/CMakeLists.txt
-@@ -32,12 +32,18 @@ else()
- endif()
- 
- # Set up compile options that will be used for the Linux build
--set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all")
--set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
-+set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing")
- set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
--set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all")
--set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
-+set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
- set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
-+if(MEDIA_BUILD_HARDENING)
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -fstack-protector-all")
-+    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -D_FORTIFY_SOURCE=2")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -fstack-protector-all")
-+    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -D_FORTIFY_SOURCE=2")
-+endif()
- if(MEDIA_BUILD_FATAL_WARNINGS)
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -Werror")
-     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -Werror")
-diff --git a/media_driver/cmake/linux/media_compile_flags_linux.cmake b/media_driver/cmake/linux/media_compile_flags_linux.cmake
-index 7a2bd64b6..98896b131 100755
---- a/media_driver/cmake/linux/media_compile_flags_linux.cmake
-+++ b/media_driver/cmake/linux/media_compile_flags_linux.cmake
-@@ -47,7 +47,6 @@ set(MEDIA_COMPILER_FLAGS_COMMON
-     # Other common flags
-     -fmessage-length=0
-     -fvisibility=hidden
--    -fstack-protector
-     -fdata-sections
-     -ffunction-sections
-     -Wl,--gc-sections
-@@ -64,6 +63,11 @@ set(MEDIA_COMPILER_FLAGS_COMMON
-     -g
- )
- 
-+if(MEDIA_BUILD_HARDENING)
-+    set(MEDIA_COMPILER_FLAGS_COMMON
-+        ${MEDIA_COMPILER_FLAGS_COMMON}
-+        -fstack-protector)
-+endif()
- 
- if(${UFO_MARCH} STREQUAL "slm")
-     set(MEDIA_COMPILER_FLAGS_COMMON
-@@ -119,9 +123,13 @@ if(${UFO_VARIANT} STREQUAL "default")
-     set(MEDIA_COMPILER_FLAGS_RELEASE
-         ${MEDIA_COMPILER_FLAGS_RELEASE}
-         -O2
--        -D_FORTIFY_SOURCE=2
-         -fno-omit-frame-pointer
-     )
-+    if(MEDIA_BUILD_HARDENING)
-+        set(MEDIA_COMPILER_FLAGS_RELEASE
-+            ${MEDIA_COMPILER_FLAGS_RELEASE}
-+            -D_FORTIFY_SOURCE=2)
-+    endif()
- endif()
- 
- if(NOT ${PLATFORM} STREQUAL "android")
-diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
-index f089ea45f..b0b428914 100755
---- a/media_driver/media_top_cmake.cmake
-+++ b/media_driver/media_top_cmake.cmake
-@@ -113,7 +113,13 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
-     set_target_properties(${LIB_NAME_OBJ} PROPERTIES COMPILE_FLAGS "-Werror")
- endif()
- 
--set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -z relro -z now -fstack-protector -fPIC")
-+set(MEDIA_LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -z relro -z now -fPIC")
-+option(MEDIA_BUILD_HARDENING "Enable hardening (stack-protector, fortify source)" ON)
-+if(MEDIA_BUILD_HARDENING)
-+    set(MEDIA_LINK_FLAGS "${MEDIA_LINK_FLAGS} -fstack-protector")
-+endif()
-+set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS ${MEDIA_LINK_FLAGS})
-+
- set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
- set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
- 
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index ceafa20e80..7c615620ae 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6eaa4a9caf58faa8934b253adb4b0ece1c7d5de6f084167d5138b4e3ba423683  intel-media-22.1.1.tar.gz
+sha256  1a0277306d7bb3a1e20c7693ff090fa4ae5c0b68981aa13452ed1c6df9062854  intel-media-22.2.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index d8820379e7..4895c1535d 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 22.1.1
+INTEL_MEDIADRIVER_VERSION = 22.2.1
 INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
