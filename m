Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC00FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A886103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0A886103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC8160747;
	Tue,  3 Aug 2021 21:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfVSpHX437FY; Tue,  3 Aug 2021 21:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE3C8605C8;
	Tue,  3 Aug 2021 21:42:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1041BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06C7940544
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12MezrjQiO28 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BCF8404D4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B653085F62; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 23:05:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1c3e0f95bcaa3fe3a787abac4401c5a4c2860ef6
X-Git-Newrev: 48235e6fc5f9f452b7b48fd7f2297093c4dd16ea
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.B653085F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPPERS: remove Chakra Divi
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
Content-Type: multipart/mixed; boundary="===============4089804074789932533=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4089804074789932533==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=48235e6fc5f9f452b7b48fd7f2297093c4dd16ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The domain for their email is now a parking-site, and mails are not
delivered anymore.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59ab25ea5a..a7f9cdeb61 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -495,16 +495,6 @@ F:	package/libsvg-cairo/
 N:	Cédric Chépied <cedric.chepied@gmail.com>
 F:	package/znc/
 
-N:	Chakra Divi <chakra@openedev.com>
-F:	board/friendlyarm/nanopi-m1
-F:	board/friendlyarm/nanopi-m1-plus
-F:	board/olimex/a13_olinuxino
-F:	board/orangepi/orangepi-plus
-F:	configs/friendlyarm_nanopi_m1_defconfig
-F:	configs/friendlyarm_nanopi_m1_plus_defconfig
-F:	configs/olimex_a13_olinuxino_defconfig
-F:	configs/orangepi_plus_defconfig
-
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
 F:	package/coremark-pro/

--===============4089804074789932533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4089804074789932533==--
