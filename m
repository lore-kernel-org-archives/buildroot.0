Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B2AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB0960E2B;
	Sun, 27 Mar 2022 16:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcMu6KZqN3KJ; Sun, 27 Mar 2022 16:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6A5360864;
	Sun, 27 Mar 2022 16:35:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53FE11BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91CD660BB2
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7d748ejimg5m for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E50860E64
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C94D085E91; Sun, 27 Mar 2022 16:23:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c75dc73de4b71084ce30f38c6b20068188e13bfe
X-Git-Newrev: 3dd0940081d5da5b5588fe3b4e9b5d20e4a4719e
X-Patchwork-Hint: ignore
Message-Id: <20220327162300.C94D085E91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-gmmlib: bump version to
 22.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3dd0940081d5da5b5588fe3b4e9b5d20e4a4719e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch | 2 +-
 package/intel-gmmlib/intel-gmmlib.hash                       | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk                         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
index 581afd9066..c429df6581 100644
--- a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
+++ b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
@@ -15,7 +15,7 @@ diff --git a/Source/GmmLib/Linux.cmake b/Source/GmmLib/Linux.cmake
 index 1a09bc4..b28fc1b 100644
 --- a/Source/GmmLib/Linux.cmake
 +++ b/Source/GmmLib/Linux.cmake
-@@ -62,7 +62,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
+@@ -99,7 +99,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
      -DUSE_SSE3
      -DUSE_SSSE3
      # Other common flags
diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index beb3cfd6ae..5e48238448 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d70ffc76e9dd7c533f4f3cd829da3a6df00b86418f78f057051d5e7cf208bc8d  intel-gmmlib-22.0.3.tar.gz
+sha256  3b9a6d5e7e3f5748b3d0a2fb0e980ae943907fece0980bd9c0508e71c838e334  intel-gmmlib-22.1.2.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 06628132a2..25cc733e0c 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.0.3
+INTEL_GMMLIB_VERSION = 22.1.2
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
