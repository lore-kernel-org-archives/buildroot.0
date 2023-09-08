Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818B2EEB56D
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE23940351;
	Fri,  8 Sep 2023 20:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE23940351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4nP8D7zNBuO; Fri,  8 Sep 2023 20:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F8B4031F;
	Fri,  8 Sep 2023 20:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F8B4031F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B25F1BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BCC04031F
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BCC04031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQY8o6NuQPSh for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:19:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ABFD40308
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ABFD40308
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74BF386B32; Fri,  8 Sep 2023 20:19:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 Sep 2023 22:10:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07b843ac04d47de46dec1778e7a8d19d449ccf0a
X-Git-Newrev: f862a1abf167dd95c419758ad84e7652cbbc2b68
X-Patchwork-Hint: ignore
Message-Id: <20230908201910.74BF386B32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/conmon: bump version to 2.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=f862a1abf167dd95c419758ad84e7652cbbc2b68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug fixes.

https://github.com/containers/conmon/releases/tag/v2.1.8

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/conmon/conmon.hash | 2 +-
 package/conmon/conmon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/conmon/conmon.hash b/package/conmon/conmon.hash
index 82d1d14ba3..f2e89b8a92 100644
--- a/package/conmon/conmon.hash
+++ b/package/conmon/conmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7d0f9a2f7cb8a76c51990128ac837aaf0cc89950b6ef9972e94417aa9cf901fe  conmon-2.1.7.tar.gz
+sha256  e72c090210a03ca3b43a0fad53f15bca90bbee65105c412468009cf3a5988325  conmon-2.1.8.tar.gz
 sha256  9c9d771d4004725237a31ada889fe06c85a24fd0a29e41825181ab4cde54f016  LICENSE
diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index f3567a4305..29deb2af47 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONMON_VERSION = 2.1.7
+CONMON_VERSION = 2.1.8
 CONMON_SITE = $(call github,containers,conmon,v$(CONMON_VERSION))
 CONMON_LICENSE = Apache-2.0
 CONMON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
