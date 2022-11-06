Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E022C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 14:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E3444054A;
	Sun,  6 Nov 2022 14:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E3444054A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-fKUylGWtZP; Sun,  6 Nov 2022 14:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F7F1404F5;
	Sun,  6 Nov 2022 14:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F7F1404F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 482621BF8B4
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2087560AAE
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2087560AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRBUhJsiWjDn for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 14:09:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6969E607CE
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 14:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6969E607CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5597E88075; Sun,  6 Nov 2022 14:09:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 15:07:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6103c844a5a9ec711cb3cc81ae784ec593382e3
X-Git-Newrev: ce38e455bb61ad2f4219a2c7da8b68d07dd0b180
X-Patchwork-Hint: ignore
Message-Id: <20221106140911.5597E88075@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself to
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
