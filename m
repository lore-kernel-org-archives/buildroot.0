Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ABFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01B2C40B4E;
	Tue, 12 Apr 2022 19:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7oxjBdDIecR; Tue, 12 Apr 2022 19:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1A9840B47;
	Tue, 12 Apr 2022 19:59:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4BE51BF239
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2CED40324
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h935Mm27jQIx for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:59:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0A29402E2
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 19:59:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2171C83BA7; Tue, 12 Apr 2022 19:49:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 21:59:28 +0200
Subject: [git commit] DEVELOPERS: add missing Miquèl Raynal e-mail
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d2fc046ed078630b40350dd33e87b7594938534
X-Git-Newrev: cc384b9734139a0654718c33f8e67546336750dd
X-Patchwork-Hint: ignore
Message-Id: <20220412194950.2171C83BA7@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============6107443114165612991=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6107443114165612991==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cc384b9734139a0654718c33f8e67546336750dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5035b3239..7a87cceaef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2067,7 +2067,7 @@ F:	package/libfribidi/
 N:	Min Xu <xuminready@gmail.com>
 F:	package/shadowsocks-libev/
 
-N:	Miquèl Raynal
+N:	Miquèl Raynal <miquel.raynal@bootlin.com>
 F:	package/mali-driver/
 F:	package/rockchip-mali/
 

--===============6107443114165612991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6107443114165612991==--
