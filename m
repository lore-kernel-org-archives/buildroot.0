Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79729C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 13:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F32C282F80;
	Tue, 21 Feb 2023 13:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F32C282F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qos85QzzBOvg; Tue, 21 Feb 2023 13:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D28C82F76;
	Tue, 21 Feb 2023 13:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D28C82F76
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E476E1BF215
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE0D9612A4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0D9612A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwztw_cHXPIG for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 13:50:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED8F060B09
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 13:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED8F060B09
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD0E7865EA; Tue, 21 Feb 2023 13:50:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 14:47:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d02eab8bcf57495c8c7675021c69fc2e3edd508
X-Git-Newrev: 5c6e45f7eb4981810883961dd3af37ec0dc9d229
X-Patchwork-Hint: ignore
Message-Id: <20230221135006.DD0E7865EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: fix line endings in
 part of 0003-fix-build-without-C.patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5c6e45f7eb4981810883961dd3af37ec0dc9d229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/894/894cd923baa25643d9aea21678c4bca105e86b45/

Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluent-bit/0003-fix-build-without-C.patch | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/fluent-bit/0003-fix-build-without-C.patch b/package/fluent-bit/0003-fix-build-without-C.patch
index 3bc5f46de9..0f0b239216 100644
--- a/package/fluent-bit/0003-fix-build-without-C.patch
+++ b/package/fluent-bit/0003-fix-build-without-C.patch
@@ -1,4 +1,4 @@
-From 014e44808ebaf29b0c25b5a3fa2e35a99a30f628 Mon Sep 17 00:00:00 2001
+From f2aeca6fcc37bf22dd7307cab8fc9db6b53dd652 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Tue, 21 Feb 2023 00:09:57 +0100
 Subject: [PATCH] fix build without C++
@@ -99,12 +99,12 @@ index 8bb1e9598..ae9225c49 100644
 --- a/lib/snappy-fef67ac/CMakeLists.txt
 +++ b/lib/snappy-fef67ac/CMakeLists.txt
 @@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 2.8)
--project(snappy-c)
-+project(snappy-c C)
- 
- set(CMAKE_POSITION_INDEPENDENT_CODE ON)
- 
+ cmake_minimum_required(VERSION 2.8)
+-project(snappy-c)
++project(snappy-c C)
+ 
+ set(CMAKE_POSITION_INDEPENDENT_CODE ON)
+ 
 diff --git a/lib/tutf8e/CMakeLists.txt b/lib/tutf8e/CMakeLists.txt
 index 35cbe01ad..a056ef83c 100644
 --- a/lib/tutf8e/CMakeLists.txt
@@ -127,5 +127,5 @@ index 8c5d70d13..de2c2fe38 100644
  include_directories(${CMAKE_CURRENT_SOURCE_DIR})
  
 -- 
-2.39.0
+2.39.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
