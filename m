Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D21FCAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F12D0806E7;
	Mon,  8 Sep 2025 14:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFQe2cSZP2Al; Mon,  8 Sep 2025 14:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3474E806C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3474E806C1;
	Mon,  8 Sep 2025 14:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0298C186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3186780512
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmKgwjywOj06 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79CE3804DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79CE3804DF
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76F0683916; Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 01:56:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59738c89c2623d42904ea7bed85eda6600d21110
X-Git-Newrev: 80ab57f6a91da7f807190b27d0f28846842a3897
X-Patchwork-Hint: ignore
Message-Id: <20250908141622.76F0683916@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmc: bump version to
 lf-6.12.20-2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=80ab57f6a91da7f807190b27d0f28846842a3897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No change.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmc/fmc.hash | 2 +-
 package/fmc/fmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index c3197fa1af..a096f00373 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fa16eaece5744af1523e563dc1cc5af6cd1c448aa828bdfd86137be555760abc  fmc-lf-6.12.3-1.0.0.tar.gz
+sha256  690ecca4d36b678f028afe780fb6750cece540e621a1c3f50bd98f54fe97d15c  fmc-lf-6.12.20-2.0.0.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 26282313ba..bea7c5299a 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = lf-6.12.3-1.0.0
+FMC_VERSION = lf-6.12.20-2.0.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
