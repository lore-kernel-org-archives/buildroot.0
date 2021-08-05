Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E490C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:25:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA98961078
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA98961078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 933626066F;
	Thu,  5 Aug 2021 07:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOt1xOUPG_tv; Thu,  5 Aug 2021 07:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1E4C6059F;
	Thu,  5 Aug 2021 07:24:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66A191BF859
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6301740336
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pL-I1RM91CHh for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 07:24:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD7AD402B3
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 07:24:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 90D158B557; Thu,  5 Aug 2021 07:24:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 09:24:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 58c99c957b002a9d6fa7de8df24c87df379c9faf
X-Git-Newrev: 74974d5e2f916e0794676c99b8b7a1ce791e90ca
X-Patchwork-Hint: ignore
Message-Id: <20210805072444.90D158B557@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openlayers: bump to
 version 6.6.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=74974d5e2f916e0794676c99b8b7a1ce791e90ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 23683bd6e9..e6debd49ba 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	ab80014b15963404ec269a71f563fd3568581c55de160d5663600ea0787cf568	v6.5.0-dist.zip
+sha256	c8695a15c3570ca0c8f84c79391f81a89b925a5fcca28dc5cd60942c0dade247	v6.6.1-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index db464ef8a6..c8d2c07ee7 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.5.0
+OPENLAYERS_VERSION = 6.6.1
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
