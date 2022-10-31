Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB067C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44DBE402A4;
	Mon, 31 Oct 2022 09:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44DBE402A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id da1mAEV3ZXWj; Mon, 31 Oct 2022 09:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 059B34022C;
	Mon, 31 Oct 2022 09:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 059B34022C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D57431BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB21260B22
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB21260B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0OlwOkEtWAt for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:46:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F064460A66
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F064460A66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDA778777A; Mon, 31 Oct 2022 09:46:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:46:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04154a6517294dbe11a8fd653557b429a6704466
X-Git-Newrev: 68df37aeb47671bc5931d5539e1f5bc04777fab9
X-Patchwork-Hint: ignore
Message-Id: <20221031094635.DDA778777A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself for package/libkcapi
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

commit: https://git.buildroot.net/buildroot/commit/?id=68df37aeb47671bc5931d5539e1f5bc04777fab9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add myself to help maintaining package/libkcapi.

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1380ae6a98..82776cc14d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2784,6 +2784,9 @@ F:	package/most/
 N:	TIAN Yuanhao <tianyuanhao3@163.com>
 F:	package/open-isns/
 
+N:	Tan En De <ende.tan@starfivetech.com>
+F:	package/libkcapi/
+
 N:	Theo Debrouwere <t.debrouwere@televic.com>
 F:	board/beagleboardx15/
 F:	configs/beagleboardx15_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
