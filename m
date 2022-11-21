Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB276C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5531F408B6;
	Mon, 21 Nov 2022 21:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5531F408B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bGPgUzttBUR; Mon, 21 Nov 2022 21:49:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEAE40510;
	Mon, 21 Nov 2022 21:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FEAE40510
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8A0E1BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 946C1405BE
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 946C1405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXz0zTRUzV_P for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:49:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB32840179
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB32840179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C42FE840F0; Mon, 21 Nov 2022 21:49:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 22:48:28 +0100
Subject: [git commit] package/mali-driver: remove Miquèl from the DEVELOPERS list
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 354f9387f33b5fab023cb98e52d84d58624f0ecf
X-Git-Newrev: 124fc473dd9298facc6f9fd58dd59a706550e29b
X-Patchwork-Hint: ignore
Message-Id: <20221121214901.C42FE840F0@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============4315894699867322207=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4315894699867322207==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=124fc473dd9298facc6f9fd58dd59a706550e29b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I am not really maintaining these packages, I don't follow closely
enough nor use them to take the time to make the necessary changes.
Giulio has been much more reactive than me to fix issues and he is
already listed for them anyway.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 826e04d805..2aecdb1c8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2128,10 +2128,6 @@ F:	package/qcom-db410c-firmware/
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
-N:	Miquèl Raynal <miquel.raynal@bootlin.com>
-F:	package/mali-driver/
-F:	package/rockchip-mali/
-
 N:	Mircea Gliga <gliga.mircea@gmail.com>
 F:	package/mbuffer/
 

--===============4315894699867322207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4315894699867322207==--
