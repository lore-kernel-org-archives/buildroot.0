Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C92C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08EA417E8;
	Mon,  5 Feb 2024 10:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B08EA417E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N40MNMAu4gZf; Mon,  5 Feb 2024 10:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DD7741806;
	Mon,  5 Feb 2024 10:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DD7741806
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEBA11BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1E044177D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E044177D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJSnLviIWX8n for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:26:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC96A417FC
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC96A417FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8FE586A35; Mon,  5 Feb 2024 10:26:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:23:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2aec6008e861ccaec6ce473d7b911ce41ad253e
X-Git-Newrev: 4585259743e0ff3977c05c864dc752c040023738
X-Patchwork-Hint: ignore
Message-Id: <20240205102653.D8FE586A35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: bump version to v3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4585259743e0ff3977c05c864dc752c040023738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolftpm/wolftpm.hash | 2 +-
 package/wolftpm/wolftpm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index 3329528095..33d0aa2414 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d8e06e77893f104be7eb9421cac50518552ad9c5fc7fe8a9c1cdfaf4f11b92df  wolftpm-2.7.0.tar.gz
+sha256  b4f6c090cad7fdbd4fd976f1bd8f271694669459b240fa14bec60a89b749dc1b  wolftpm-3.1.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index db332712f5..4d1d459801 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFTPM_VERSION = 2.7.0
+WOLFTPM_VERSION = 3.1.0
 WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
