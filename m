Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBBCC54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 524B460F8E;
	Fri, 15 Mar 2024 19:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XycCAqcJ-E7; Fri, 15 Mar 2024 19:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9543760F90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9543760F90;
	Fri, 15 Mar 2024 19:40:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BF671BF990
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAB204169C
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aH642_mcVetx for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914824168F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 914824168F
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BA08883A1; Fri, 15 Mar 2024 19:40:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 20:38:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89bc66d08e17bca0c1ca40346c0c248f550b6013
X-Git-Newrev: 2b59ee9f191bfaaf9dcb8d74efdcc67754d8db3e
X-Patchwork-Hint: ignore
Message-Id: <20240315194002.7BA08883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: fix indentation (tab
 instead of spaces)
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2b59ee9f191bfaaf9dcb8d74efdcc67754d8db3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found by check-package.

Fixes: 53a8c5150e5eeeb6dbbead0275dbf9141f507511
Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6406596540

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in.legacy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b99d9c1fb5..5aaaae0eec 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -147,14 +147,14 @@ endif
 comment "Legacy options removed in 2024.05"
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-        bool "CodeSourcery AArch64 2014.11"
+	bool "CodeSourcery AArch64 2014.11"
 	select BR2_LEGACY
 	help
 	  The Sourcery CodeBench AArch64 toolchain has been removed,
 	  use an ARM/Bootlin/Linaro toolchain instead.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
-        bool "Sourcery CodeBench ARM 2014.05 has been removed"
+	bool "Sourcery CodeBench ARM 2014.05 has been removed"
 	select BR2_LEGACY
 	help
 	  The Sourcery CodeBench ARM toolchain has been removed, use
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
