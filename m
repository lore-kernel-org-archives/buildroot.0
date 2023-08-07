Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC341EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 946A840BA7;
	Mon, 21 Aug 2023 20:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 946A840BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxZRUmf9s2nw; Mon, 21 Aug 2023 20:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8F9D40B85;
	Mon, 21 Aug 2023 20:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8F9D40B85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33E861BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4262415D4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4262415D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_ELeVKPlHUZ for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7C3C410C7
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7C3C410C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E54CC86023; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 19:24:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3693462a1f8bd328c1a4f8fb68f00ce9127c31cd
X-Git-Newrev: 0ed334b4635f11fd326d9cbbbd5c3e59db8eb938
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.E54CC86023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rockchip-rkbin: fix
 typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ed334b4635f11fd326d9cbbbd5c3e59db8eb938
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reported-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rockchip-rkbin/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
index ae5601db41..6c66acb7e6 100644
--- a/package/rockchip-rkbin/Config.in
+++ b/package/rockchip-rkbin/Config.in
@@ -9,7 +9,7 @@ if BR2_PACKAGE_ROCKCHIP_RKBIN
 config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
 	string "Rockchip rkbin tpl file path"
 	help
-	  Fath to the tpl file inside the rkbin repository. The
+	  Path to the tpl file inside the rkbin repository. The
 	  specified file will be copied and used by U-Boot as tpl.
 
 config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
