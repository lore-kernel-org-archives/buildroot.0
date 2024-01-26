Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C045C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 21:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEC0E4378A;
	Fri, 26 Jan 2024 21:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC0E4378A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19p75qFHW1Cq; Fri, 26 Jan 2024 21:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C7C143782;
	Fri, 26 Jan 2024 21:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C7C143782
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DC271BF2EC
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 644AE41FB8
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 644AE41FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UC4LC7FajgSz for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 21:29:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9965941F96
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 21:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9965941F96
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79090865AB; Fri, 26 Jan 2024 21:29:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 22:25:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69a7680407bef325c613b33121ed1ec6a97ab7cb
X-Git-Newrev: f596248627ee133ef1640cee8ff9f276fb545b41
X-Patchwork-Hint: ignore
Message-Id: <20240126212947.79090865AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catch2: bump to version 3.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f596248627ee133ef1640cee8ff9f276fb545b41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index c90973154a..5136785513 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  49c3ca7a68f1c8ec71307736bc6ed14fec21631707e1be9af45daf4037e75a08  catch2-3.5.1.tar.gz
+sha256  269543a49eb76f40b3f93ff231d4c24c27a7e16c90e47d2e45bcc564de470c6e  catch2-3.5.2.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index fc4a1d69a9..ee0940642f 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.5.1
+CATCH2_VERSION = 3.5.2
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
