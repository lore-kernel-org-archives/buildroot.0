Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A52C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:42:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B292C61059
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B292C61059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70BB683C15;
	Sun,  1 Aug 2021 09:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nj5fMHQvltoR; Sun,  1 Aug 2021 09:42:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1B8E83BF7;
	Sun,  1 Aug 2021 09:42:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DEC41BF8B4
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93082415B6
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWtcY4yyEdQU for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 09:38:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC08C415A8
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 09:38:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F284A8A388; Sun,  1 Aug 2021 09:38:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 11:35:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8fbe933051609f4b906ef713a41a8741cf82476
X-Git-Newrev: 2203d1b3ce7654c8224e1b18d45d2b8e36f5c1f4
X-Patchwork-Hint: ignore
Message-Id: <20210801093844.F284A8A388@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediasdk: bump version to
 21.2.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2203d1b3ce7654c8224e1b18d45d2b8e36f5c1f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch | 6 ++++--
 package/intel-mediasdk/intel-mediasdk.hash                     | 2 +-
 package/intel-mediasdk/intel-mediasdk.mk                       | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
index a33c218c0a..a7e3b70294 100644
--- a/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
+++ b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
@@ -7,6 +7,8 @@ This allows the environment to decide whether SSP should be used or
 not, for example to support toolchains that don't have SSP support.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Bernd: rebased for 21.2.3]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  api/mfx_dispatch/linux/CMakeLists.txt | 2 +-
  builder/FindPackages.cmake            | 4 ++--
@@ -16,7 +18,7 @@ diff --git a/api/mfx_dispatch/linux/CMakeLists.txt b/api/mfx_dispatch/linux/CMak
 index 15a4bd9a..4415f840 100644
 --- a/api/mfx_dispatch/linux/CMakeLists.txt
 +++ b/api/mfx_dispatch/linux/CMakeLists.txt
-@@ -100,7 +100,7 @@ target_link_libraries(mfx dl)
+@@ -101,7 +101,7 @@ target_link_libraries(mfx dl)
  get_api_version(MFX_VERSION_MAJOR MFX_VERSION_MINOR)
  
  set_target_properties( mfx PROPERTIES LINK_FLAGS
@@ -38,7 +40,7 @@ index 7e36ae2d..5b8b9b9d 100644
  #  message( STATUS "Libva located at: ${PKG_LIBVA_LIBRARY_DIRS}" )
  
    if( ARGV1 MATCHES hw AND Linux )
-@@ -448,7 +448,7 @@ function(configure_dependencies target dependencies variant)
+@@ -445,7 +445,7 @@ function(configure_dependencies target dependencies variant)
    endforeach()
  
    set(SCOPE_CFLAGS ${SCOPE_CFLAGS} PARENT_SCOPE)
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index 27cfdda08d..7ae892b3bf 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f7750bd3a307d796e71a3d4ebb16a730b2e9364669513e110e9ec59af159b4cd  intel-mediasdk-21.2.2.tar.gz
+sha256  7791be83e5e9f6d55f31d6ad9037012fc78b846724644b9db2087d1b7dfec078  intel-mediasdk-21.2.3.tar.gz
 sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index c3412d622d..0aff54cafe 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 21.2.2
+INTEL_MEDIASDK_VERSION = 21.2.3
 INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
