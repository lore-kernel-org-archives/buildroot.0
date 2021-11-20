Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7915C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 10:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C82160704;
	Sat, 20 Nov 2021 10:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AK-TeFh5Fbib; Sat, 20 Nov 2021 10:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 809AF606DA;
	Sat, 20 Nov 2021 10:01:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A25DF1BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FFA98198D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLLAzeAG8lPr for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 10:01:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6355481985
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 10:01:14 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout06.t-online.de (Postfix) with SMTP id 584AEAD2B;
 Sat, 20 Nov 2021 11:01:11 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.220]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1moNBH-0sHmcr0; Sat, 20 Nov 2021 11:01:11 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45090)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1moNBG-0005Jn-Bj;
 Sat, 20 Nov 2021 11:01:10 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 11:01:09 +0100
Message-Id: <20211120100110.1940984-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211120100110.1940984-1-bernd.kuhls@t-online.de>
References: <20211120100110.1940984-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637402471-0000145D-F763D727/0/0 CLEAN NORMAL
X-TOI-MSGID: 78cb6c18-3202-4331-ad59-bb9594c16557
Subject: [Buildroot] [PATCH/next 2/3] package/intel-mediadriver: bump
 version to 21.4.1
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

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Add-MEDIA-BUILD-HARDENING-option.patch                | 3 ++-
 package/intel-mediadriver/intel-mediadriver.hash               | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk                 | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch b/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
index 1bb92de5c3..968445759a 100644
--- a/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
+++ b/package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch
@@ -12,6 +12,7 @@ Patch sent upstream: https://github.com/intel/media-driver/pull/1242
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for version 21.4.1]
 ---
  cmrtlib/linux/CMakeLists.txt                       | 14 ++++++++++----
  .../cmake/linux/media_compile_flags_linux.cmake    | 12 ++++++++++--
@@ -88,7 +89,7 @@ diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.c
 index f089ea45f..b0b428914 100755
 --- a/media_driver/media_top_cmake.cmake
 +++ b/media_driver/media_top_cmake.cmake
-@@ -111,7 +111,13 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
+@@ -113,7 +113,13 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
      set_target_properties(${LIB_NAME_OBJ} PROPERTIES COMPILE_FLAGS "-Werror")
  endif()
  
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 4376f46ff0..97b7256e36 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  182925ed21c0a9843a63865e34dc35bf713294260d14ceb29e8de0de2e34733f  intel-media-21.3.5.tar.gz
+sha256  4cd9f2b4da82883a8ed4fb45ba8f186c32941b5f4f3b7d61f2b2b8c19e634281  intel-media-21.4.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index a62ebab414..3c329cbf71 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 21.3.5
+INTEL_MEDIADRIVER_VERSION = 21.4.1
 INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
