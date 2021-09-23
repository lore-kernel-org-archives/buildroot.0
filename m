Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE03C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:07:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E0560EB2
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83E0560EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F40184215;
	Thu, 23 Sep 2021 21:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjcAj8taEAmE; Thu, 23 Sep 2021 21:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C380C84243;
	Thu, 23 Sep 2021 21:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABDE31BF9C8
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 999BB415B9
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5u000E8UZc7Q for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 004D9406EB
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 652C98D210; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 22:54:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cae1a0d675eca41125b6430157d3d0d78d1220c
X-Git-Newrev: d2c6d72892552c3262847b9f32d5379879a36c2d
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.652C98D210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xorriso: bump to version 1.5.4.pl02
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2c6d72892552c3262847b9f32d5379879a36c2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.gnu.org/archive/html/bug-xorriso/2021-02/msg00014.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xorriso/xorriso.hash | 2 +-
 package/xorriso/xorriso.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xorriso/xorriso.hash b/package/xorriso/xorriso.hash
index faaeab5fa0..cbbd360d92 100644
--- a/package/xorriso/xorriso.hash
+++ b/package/xorriso/xorriso.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3b69f5c93ae7c40c5bbe4a847fa3963f5efc9c565551622f77121c5792fc17e7  xorriso-1.5.2.tar.gz
+sha256  3ec7393d4a9dcbf5f74309c28a415f55227ec62770b95ae993ac8d7a3b152972  xorriso-1.5.4.pl02.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  72e99e72cd68f226415e5d898f3b38e24ae7991ed038ed72d789fff5b060f028  COPYRIGHT
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index ff3414fd8a..ac6b0cdf27 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORRISO_VERSION = 1.5.2
+XORRISO_VERSION = 1.5.4.pl02
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPL-3.0+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
