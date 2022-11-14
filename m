Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581CDC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E26994086C;
	Mon, 14 Nov 2022 22:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E26994086C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Iu1rNh8rh8p; Mon, 14 Nov 2022 22:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E874A4086A;
	Mon, 14 Nov 2022 22:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E874A4086A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 274121BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F54081293
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F54081293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKtoStY2oJH4 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:29:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B1D681257
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B1D681257
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34DF483BB0; Mon, 14 Nov 2022 22:29:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 23:28:18 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8aaa05d5583ac1874b29aa972ce21d9f36c3de2a
X-Git-Newrev: 54fdfb7033f62223d4c85332beeb1f142777031a
X-Patchwork-Hint: ignore
Message-Id: <20221114222943.34DF483BB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: add myself to
 configs/kontron_smarc_sal28_defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=54fdfb7033f62223d4c85332beeb1f142777031a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ce38e455bb61ad2f4219a2c7da8b68d07dd0b180)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4ead170b19..d3dedb06f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1183,8 +1183,10 @@ F:	package/uhd/
 
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	board/kontron/bl-imx8mm/
+F:	board/kontron/smarc-sal28/
 F:	board/kontron/pitx-imx8m/
 F:	configs/kontron_bl_imx8mm_defconfig
+F:	configs/kontron_smarc_sal28_defconfig
 F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
 F:	package/ipmitool/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
