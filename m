Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5900C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73712429C2;
	Mon, 20 Feb 2023 21:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73712429C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTwuxZGhDKrp; Mon, 20 Feb 2023 21:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C6541D15;
	Mon, 20 Feb 2023 21:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C6541D15
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23C191BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5606840C37
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5606840C37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JIzgsSrQj360 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0913640C1C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0913640C1C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDBB68648F; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 15:07:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c6103c844a5a9ec711cb3cc81ae784ec593382e3
X-Git-Newrev: ce38e455bb61ad2f4219a2c7da8b68d07dd0b180
X-Patchwork-Hint: ignore
Message-Id: <20230220205147.EDBB68648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add myself to
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce38e455bb61ad2f4219a2c7da8b68d07dd0b180
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2613624f4b..9bd98da5ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1243,8 +1243,10 @@ F:	package/volk/
 
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
