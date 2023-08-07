Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A559C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 17:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2F060A61;
	Mon,  7 Aug 2023 17:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2F060A61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NoyeEERwA-8; Mon,  7 Aug 2023 17:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A8060C24;
	Mon,  7 Aug 2023 17:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41A8060C24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 915981BF951
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B66DB81A23
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B66DB81A23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IYmowU1tXKg for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 17:25:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD989819F5
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 17:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD989819F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9AE08465A; Mon,  7 Aug 2023 17:25:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 19:24:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3693462a1f8bd328c1a4f8fb68f00ce9127c31cd
X-Git-Newrev: 0ed334b4635f11fd326d9cbbbd5c3e59db8eb938
X-Patchwork-Hint: ignore
Message-Id: <20230807172547.C9AE08465A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rockchip-rkbin: fix typo in help
 text
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
