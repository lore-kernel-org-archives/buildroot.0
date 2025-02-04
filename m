Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AD0C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C425585AD3;
	Fri, 28 Feb 2025 17:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8wdyvjLlhgA; Fri, 28 Feb 2025 17:11:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBD38517B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBBD38517B;
	Fri, 28 Feb 2025 17:11:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 133421DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B29A8419AD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lev1lxqj2l8E for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85BCF42D03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85BCF42D03
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 819F685E25; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:55:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 261d33eff8963319aa1c660e4e6bfb59d037175e
X-Git-Newrev: f6bcbefad8f7b8f9302e060b521a523e4d567ae4
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.819F685E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uboot-bootcount: bump
 to version 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6bcbefad8f7b8f9302e060b521a523e4d567ae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support IMX93 platform

Release notes:
https://github.com/VoltServer/uboot-bootcount/releases/tag/v3.1.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-bootcount/uboot-bootcount.hash | 2 +-
 package/uboot-bootcount/uboot-bootcount.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-bootcount/uboot-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
index 7f46da22eb..aaf702c789 100644
--- a/package/uboot-bootcount/uboot-bootcount.hash
+++ b/package/uboot-bootcount/uboot-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b26b9135716afb2ea967edc2327d1d307cdd15a643bd105dc223d062e18f2dda  uboot-bootcount-3.0.0.tar.gz
+sha256  dd74a806c779c3180250ca2fce68ce9dc59f9d5fa1cbd170212cf7878c56d348  uboot-bootcount-3.1.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
index 48a45b91aa..2c75f8f564 100644
--- a/package/uboot-bootcount/uboot-bootcount.mk
+++ b/package/uboot-bootcount/uboot-bootcount.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_BOOTCOUNT_VERSION = 3.0.0
+UBOOT_BOOTCOUNT_VERSION = 3.1.0
 UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
 UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
 UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
