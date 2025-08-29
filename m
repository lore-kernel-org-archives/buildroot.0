Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A80CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFED281D3A;
	Fri, 29 Aug 2025 17:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OO6Xq7QLL8CP; Fri, 29 Aug 2025 17:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE2D81EB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE2D81EB7;
	Fri, 29 Aug 2025 17:54:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D03E445
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F5264059C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJnHk2RZdFIJ for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A060E4003D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A060E4003D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C94687E41; Fri, 29 Aug 2025 17:54:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 19:53:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59fe7547a495ffbaa817fd57e13c8741acfe1248
X-Git-Newrev: 31342fb5ff9adf1afd016ae56a07b830b5b24088
X-Patchwork-Hint: ignore
Message-Id: <20250829175420.9C94687E41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821au: bump to version
 2025-08-29 branch v5.2.6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=31342fb5ff9adf1afd016ae56a07b830b5b24088
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version allows to build up to Linux version 6.16

Fixes:
https://autobuild.buildroot.org/results/588b834b133abfc983945beef37f7f2b0df71c5f

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index e79e32ff3d..2796c50791 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fd02814e2ab5435cf4213aaf876d28dedccc0bec8c91ed768336727276c5eae6  rtl8821au-d0a49ba401a8661ef0cdc4cf8850bc7c927a062c.tar.gz
+sha256  d8d11753f88d670be7489fd1d5d30718543f4994ccc5031609f4408a5586ef3c  rtl8821au-4d39880a41201ddb14b19f2e7273054bb812b32e.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index aa900839f5..afd520b467 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = d0a49ba401a8661ef0cdc4cf8850bc7c927a062c
+RTL8821AU_VERSION = 4d39880a41201ddb14b19f2e7273054bb812b32e
 RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
