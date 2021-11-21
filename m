Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18606C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4FA284BAF;
	Mon,  6 Dec 2021 18:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVpvYddDvDY0; Mon,  6 Dec 2021 18:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9E884BA8;
	Mon,  6 Dec 2021 18:36:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 101071BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6440141C63
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTikvKW5yCEm for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0A1441C45
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 68C8081503; Mon,  6 Dec 2021 18:07:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:49:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3da8a3cfd658863a2e22c8ba2460ec9184686146
X-Git-Newrev: 5563869d26e47e89cd56c6ddf256358e2c2b8cda
X-Patchwork-Hint: ignore
Message-Id: <20211206180740.68C8081503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 21.4.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5563869d26e47e89cd56c6ddf256358e2c2b8cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediadriver/0001-Add-MEDIA-BUILD-HARDENING-option.patch | 3 ++-
 package/intel-mediadriver/intel-mediadriver.hash                      | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk                        | 2 +-
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
