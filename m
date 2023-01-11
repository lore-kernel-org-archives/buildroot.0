Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80F3C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 17:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DABB81FAE;
	Wed, 11 Jan 2023 17:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DABB81FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AGescd9GQCYF; Wed, 11 Jan 2023 17:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 809EA81F99;
	Wed, 11 Jan 2023 17:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 809EA81F99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 847821BF8C7
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 17:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D55981F99
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 17:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D55981F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEV7NUl8yIIB for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 17:58:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32917820EB
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32917820EB
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 17:58:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (10)
Received: from zm.lan (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id AAEEF1BD836;
 Wed, 11 Jan 2023 18:58:04 +0100 (CET)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 18:57:48 +0100
Message-Id: <20230111175749.34494-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/parted: bump to version 3.5
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/parted/parted.hash | 2 +-
 package/parted/parted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 392436ec4b..8a167d9bb8 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342  parted-3.4.tar.xz
+sha256  4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2  parted-3.5.tar.xz
 
 # Locally calculated
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 23158179e4..6d4626e2e6 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.4
+PARTED_VERSION = 3.5
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
