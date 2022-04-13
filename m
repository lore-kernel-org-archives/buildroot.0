Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1457BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 08:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAA5240291;
	Wed, 13 Apr 2022 08:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGSUmg71yrXD; Wed, 13 Apr 2022 08:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC44D401EB;
	Wed, 13 Apr 2022 08:13:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 157F51C1162
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02B3140986
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cgl_U90A8KAZ for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E3C340A05
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4AF6F83C16; Wed, 13 Apr 2022 08:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 10:04:06 +0200
Subject: [git commit branch/2022.02.x] DEVELOPERS: add missing Miquèl Raynal e-mail
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e17b86fe9104de9daabc207053f7f8f1c9004666
X-Git-Newrev: a5a041a99e43367905cecb1117b07aa089c17191
X-Patchwork-Hint: ignore
Message-Id: <20220413080257.4AF6F83C16@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============2044471970961423854=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2044471970961423854==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a5a041a99e43367905cecb1117b07aa089c17191
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cc384b9734139a0654718c33f8e67546336750dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9d77673f3c..26719370bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2058,7 +2058,7 @@ F:	package/libfribidi/
 N:	Min Xu <xuminready@gmail.com>
 F:	package/shadowsocks-libev/
 
-N:	Miquèl Raynal
+N:	Miquèl Raynal <miquel.raynal@bootlin.com>
 F:	package/mali-driver/
 F:	package/rockchip-mali/
 

--===============2044471970961423854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2044471970961423854==--
