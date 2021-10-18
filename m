Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15412C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:20:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A5A60C4C
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66A5A60C4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3286840428;
	Mon, 18 Oct 2021 19:20:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOTUFDbhnHQB; Mon, 18 Oct 2021 19:20:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896AE40608;
	Mon, 18 Oct 2021 19:20:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C81A1BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69AC360817
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7V6cSzuQPmd for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:05:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C50336074F
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:05:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9E63B873D1; Mon, 18 Oct 2021 19:01:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:04:37 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 072322f89580f97f13a08657c01123bb72e02294
X-Git-Newrev: 241a7c6fe7b962cbd0c9946eadbf667ef6b8d56c
X-Patchwork-Hint: ignore
Message-Id: <20211018190156.9E63B873D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add Joachim
 Wiberg for libuev
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

commit: https://git.buildroot.net/buildroot/commit/?id=241a7c6fe7b962cbd0c9946eadbf667ef6b8d56c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Adding myself as co-maintainer of libuev alongside Peter Seiderer, his
initiative, and I am the upstream so seems logical.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 541fb5b581a0004156b20f2230eb97981c2d86db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0cea4899be..f08c777bb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1285,6 +1285,7 @@ N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
 F:	package/libite/
+F:	package/libuev/
 F:	package/mg/
 F:	package/netcalc/
 F:	package/ssdp-responder/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
