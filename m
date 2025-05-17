Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CADC3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 20:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566818309A;
	Sat, 17 May 2025 20:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvDe-Pfa88rR; Sat, 17 May 2025 20:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9183383131
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9183383131;
	Sat, 17 May 2025 20:06:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 026A0204
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7037407C0
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4C5XzRHBUEf for <buildroot@buildroot.org>;
 Sat, 17 May 2025 20:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2A0407E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F2A0407E6
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:06:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FCBE8703A; Sat, 17 May 2025 20:06:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 21:57:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b74e19a039871cd444621ef96447d97b70ae7318
X-Git-Newrev: 9f212f3897f808f64003d7365b116850d2d263d9
X-Patchwork-Hint: ignore
Message-Id: <20250517200626.2FCBE8703A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dlib: bump version to 19.24.9
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9f212f3897f808f64003d7365b116850d2d263d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dlib/dlib.hash | 2 +-
 package/dlib/dlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash
index af206386b8..350f30dc26 100644
--- a/package/dlib/dlib.hash
+++ b/package/dlib/dlib.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  22513c353ec9c153300c394050c96ca9d088e02966ac0f639e989e50318c82d6  dlib-19.24.6.tar.gz
+sha256  65ff8debc3ffea84430bdd4992982082caf505404e16d986b7493c00f96f44e9  dlib-19.24.9.tar.gz
 
 # Hashes for license files
 sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  dlib/external/libjpeg/README
diff --git a/package/dlib/dlib.mk b/package/dlib/dlib.mk
index 4eb0002775..0c93130d34 100644
--- a/package/dlib/dlib.mk
+++ b/package/dlib/dlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DLIB_VERSION = 19.24.6
+DLIB_VERSION = 19.24.9
 DLIB_SITE = $(call github,davisking,dlib,v$(DLIB_VERSION))
 DLIB_CMAKE_BACKEND = ninja
 DLIB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
