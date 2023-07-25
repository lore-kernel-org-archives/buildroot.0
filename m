Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B9EEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E02BA4194C;
	Tue, 25 Jul 2023 21:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E02BA4194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tw86kVHpgSnE; Tue, 25 Jul 2023 21:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E1541911;
	Tue, 25 Jul 2023 21:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6E1541911
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5342D1BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 759388209B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 759388209B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfA3DzBKcSZM for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE60E8208E
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE60E8208E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB8798349E; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 23:09:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8941de8454b3a3b780241790c6470f54df5f2e4f
X-Git-Newrev: 7612f8abc55f01f5851cc7ee435d2f990b844213
X-Patchwork-Hint: ignore
Message-Id: <20230725211501.AB8798349E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/parted: bump to version 3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=7612f8abc55f01f5851cc7ee435d2f990b844213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/parted/parted.hash | 2 +-
 package/parted/parted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 8a167d9bb8..6643ba9fbe 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2  parted-3.5.tar.xz
+sha256  3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612  parted-3.6.tar.xz
 
 # Locally calculated
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 6d4626e2e6..bfd9ef3432 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.5
+PARTED_VERSION = 3.6
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
