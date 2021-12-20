Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58604C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 08:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C306C41662;
	Mon, 20 Dec 2021 08:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZLA5n0zknSc; Mon, 20 Dec 2021 08:20:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 339624165E;
	Mon, 20 Dec 2021 08:20:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB8D41BF406
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 08:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA8FB4165E
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 08:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JM7V2NrNokHW for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 08:20:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3855240272
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 08:20:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 899D1821C3; Mon, 20 Dec 2021 08:14:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 09:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38f6b42d310e389245a6772ae20b8bce73e1c61c
X-Git-Newrev: acc0d51c53d5da45fc0da725513cd0ab8a2d4107
X-Patchwork-Hint: ignore
Message-Id: <20211220081432.899D1821C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Evan Zelkowitz
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

commit: https://git.buildroot.net/buildroot/commit/?id=acc0d51c53d5da45fc0da725513cd0ab8a2d4107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Evan has privately requested to no longer receive e-mails related to
this Buildroot package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 35f3be81b8..4125adcddf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -790,9 +790,6 @@ F:	package/optee-test/
 N:	Eugene Tarassov <eugene@largest.net>
 F:	package/tcf-agent/
 
-N:	Evan Zelkowitz <evan.zelkowitz@gmail.com>
-F:	package/sdl_gfx/
-
 N:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 F:	board/ci20/
 F:	configs/ci20_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
