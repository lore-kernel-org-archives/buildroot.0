Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844A5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:13:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16CAE610A3
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16CAE610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4E4360643;
	Sat, 18 Sep 2021 20:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYr6R2mfsmAA; Sat, 18 Sep 2021 20:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1579060604;
	Sat, 18 Sep 2021 20:13:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66E9D1BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 638E984015
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmUEEvxGM-Ou for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:13:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEBA184010
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:13:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CFB9E8B6B3; Sat, 18 Sep 2021 20:11:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 22:09:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5572b2e53157db2958be2c52f4e7c2a1b0408d78
X-Git-Newrev: 518bafebd38fef5827422504ee3e712fd855d304
X-Patchwork-Hint: ignore
Message-Id: <20210918201128.CFB9E8B6B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/feh: bump version to 3.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=518bafebd38fef5827422504ee3e712fd855d304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 3a2296ac23..07c0dd9403 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 437420f37f11614e008d066e2a3bdefcfc78144c8212998b2bacdd5d21ea23b4  feh-3.6.3.tar.bz2
+sha256 57ab1ca61f57c96595878069f550d36f518530f88fa31b74cc39cd739f9258b6  feh-3.7.1.tar.bz2
 sha256 2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index f27509330d..3aa509abfe 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.6.3
+FEH_VERSION = 3.7.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
