Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF96C8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 17:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEE6C84024;
	Fri,  4 Jul 2025 17:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFDBKZkNzple; Fri,  4 Jul 2025 17:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B38784017
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B38784017;
	Fri,  4 Jul 2025 17:40:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8061615F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0253640749
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tvq6No-mR176 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 17:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C0F406C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37C0F406C1
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CC13854F4; Fri,  4 Jul 2025 17:40:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Jul 2025 19:31:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e97ca416c61e912d98b9d3439674cb40510cf160
X-Git-Newrev: 3c27767d973de28a3c39ed7aedd9cce633bcbf6b
X-Patchwork-Hint: ignore
Message-Id: <20250704174005.1CC13854F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-gmmlib: bump version to
 22.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c27767d973de28a3c39ed7aedd9cce633bcbf6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0002 which was applied upstream:
https://github.com/intel/gmmlib/commit/af5f033fbe71da454953e04db9804443e2cec746

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...e_minimum_required-to-3.5-consisently-acr.patch | 43 ----------------------
 package/intel-gmmlib/intel-gmmlib.hash             |  2 +-
 package/intel-gmmlib/intel-gmmlib.mk               |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch b/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch
deleted file mode 100644
index 400cdf667f..0000000000
--- a/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c9db6e993d4e440a276f2918f48de0868fe98093 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Fri, 28 Mar 2025 04:45:44 +0000
-Subject: [PATCH] Update cmake_minimum_required to 3.5 consisently across
- CMakeLists
-
-Source/GmmLib/CMakeLists.txt already is requiring CMake 3.5. Update
-remaining files to 3.5. This supports the compilation with cmake-4.0.0
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/intel/gmmlib/pull/130
----
- CMakeLists.txt                      | 2 +-
- Source/GmmLib/os_release_info.cmake | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1a3ad36..ca42104 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required (VERSION 3.1 FATAL_ERROR)
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
- 
- if (NOT DEFINED RUN_TEST_SUITE)
- option (RUN_TEST_SUITE "run test suite after install" ON)
-diff --git a/Source/GmmLib/os_release_info.cmake b/Source/GmmLib/os_release_info.cmake
-index 70c8318..0951a4a 100755
---- a/Source/GmmLib/os_release_info.cmake
-+++ b/Source/GmmLib/os_release_info.cmake
-@@ -28,7 +28,7 @@ if(NOT DEFINED _os_release_info)
- set(_os_release_info TRUE)
- 
- # Set cmake policies for at least this level:
--cmake_minimum_required(VERSION 2.8.12)
-+cmake_minimum_required(VERSION 3.5)
- 
- if(POLICY CMP0054)
-     cmake_policy(SET CMP0054 NEW)
--- 
-2.34.1
-
diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 771b20e074..fc7b62bd9e 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  36f2ff2b59158d1253a33d735f4e35a1b5740c4751818bdaa222b8ddf96ee881  intel-gmmlib-22.7.2.tar.gz
+sha256  0e509edf0b7892fad210e406014b3f6a53816a2ddb80650e9e1294f55aa493aa  intel-gmmlib-22.8.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 8b269d3e7b..bc29e434d9 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.7.2
+INTEL_GMMLIB_VERSION = 22.8.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
