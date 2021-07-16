Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3323C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:32:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B33A60F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B33A60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 483E860A6A;
	Tue,  3 Aug 2021 23:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHk7zXLtNCxz; Tue,  3 Aug 2021 23:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A730A60A51;
	Tue,  3 Aug 2021 23:32:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54D9A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 381A940E69
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KOWdxV6J2ws9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4017540E6E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 91F0982A39; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 22:48:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d3b57258ac602752fc42914715c33326be22719c
X-Git-Newrev: 82eff66f3efde6bb46c2e13dbadb1bc0a4f23f00
X-Patchwork-Hint: ignore
Message-Id: <20210803211003.91F0982A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fbgrab: bump to
 version 1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=82eff66f3efde6bb46c2e13dbadb1bc0a4f23f00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See changelog: https://github.com/GunnarMonell/fbgrab/releases/tag/1.5

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Tested-by: Timo Ketola <timo.ketola@exertus.fi>
Acked-by: Timo Ketola <timo.ketola@exertus.fi>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fbgrab/fbgrab.hash | 2 +-
 package/fbgrab/fbgrab.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fbgrab/fbgrab.hash b/package/fbgrab/fbgrab.hash
index 4d9a6b97d4..8cd1ff1518 100644
--- a/package/fbgrab/fbgrab.hash
+++ b/package/fbgrab/fbgrab.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  62d7aa82138ac36db0921832f3b5267b4cffc0dc22c8701857ebcb997960a32e  fbgrab-1.4.tar.gz
+sha256  0202a9c4fb430eee4d8f566d09ab5f6e35c50804a192ba106046e54eb886f8f1  fbgrab-1.5.tar.gz
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 1ae03ae43f..693c4c282d 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FBGRAB_VERSION = 1.4
+FBGRAB_VERSION = 1.5
 FBGRAB_SITE = $(call github,GunnarMonell,fbgrab,$(FBGRAB_VERSION))
 FBGRAB_DEPENDENCIES = libpng
 FBGRAB_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
