Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD10C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D17C40C3A;
	Sat, 31 May 2025 17:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xZjZkQHKR-7; Sat, 31 May 2025 17:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB07F40C99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB07F40C99;
	Sat, 31 May 2025 17:06:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16AFB117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE27883BE4
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Dloz232-tWQ for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A727583BE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A727583BE3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5197861E5; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 19:06:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 094cede2001ab015fdfdc1354a672c2b26837bbe
X-Git-Newrev: c837d8bd43ee37c71a6d14068e134c41e884675f
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.A5197861E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dlib: bump
 version to 19.24.9
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c837d8bd43ee37c71a6d14068e134c41e884675f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9f212f3897f808f64003d7365b116850d2d263d9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
