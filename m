Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16AFC54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 591CC8206F;
	Mon, 30 Jan 2023 21:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 591CC8206F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2bx4GkTsty9; Mon, 30 Jan 2023 21:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F418206C;
	Mon, 30 Jan 2023 21:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F418206C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3346B1BF291
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F16F349CA1
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F16F349CA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8u8g2B8-qpO for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:03:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD81B4AEE1
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD81B4AEE1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59DF98232C; Mon, 30 Jan 2023 21:03:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:03:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33c89f98377cb968b03eb1428af8a74eba9d13ce
X-Git-Newrev: c93db6789b1afaba27703baf9d323bcb06e6430e
X-Patchwork-Hint: ignore
Message-Id: <20230130210329.59DF98232C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luaposix: bump to version 36.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c93db6789b1afaba27703baf9d323bcb06e6430e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-Copyright (C) 2006-2021 luaposix authors
+Copyright (C) 2006-2023 luaposix authors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luaposix/luaposix.hash | 4 ++--
 package/luaposix/luaposix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index ee76ea103d..fc0b5fa747 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1b5c48d2abd59de0738d1fc1e6204e44979ad2a1a26e8e22a2d6215dd502c797  luaposix-35.1.tar.gz
-sha256  f50bc0f3197523b1709f31707425f2de95f8a45534b081a6b564179ab059e850  LICENSE
+sha256  e0fcb4996f76aa49ae3e5edf69978171091e3d69d5de5589d591d227f8a427c1  luaposix-36.0.tar.gz
+sha256  ea0fdaae50b0d31a81c2c99f4354264783c71043fd40522feaa40eecc069599b  LICENSE
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index fa26709154..1a537defc4 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 35.1
+LUAPOSIX_VERSION = 36.0
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
