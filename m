Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F85DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5DB341715;
	Sat, 26 Nov 2022 18:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5DB341715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2c5wIDd4qJ8; Sat, 26 Nov 2022 18:29:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8295B40541;
	Sat, 26 Nov 2022 18:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8295B40541
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B61621BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F4DC60E39
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F4DC60E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULHa5jBR-YLJ for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF5B260E38
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF5B260E38
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDB40844CC; Sat, 26 Nov 2022 18:29:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:22:27 +0100
Subject: [git commit branch/2022.08.x] package/mali-driver: remove Miquèl from the DEVELOPERS list
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 2cec73e98bee01cc3051fd231261731179a34c45
X-Git-Newrev: af4bfa3fd2c97f93888f1f7313d94467cdc14591
X-Patchwork-Hint: ignore
Message-Id: <20221126182902.DDB40844CC@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============3518966715741338083=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3518966715741338083==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=af4bfa3fd2c97f93888f1f7313d94467cdc14591
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

I am not really maintaining these packages, I don't follow closely
enough nor use them to take the time to make the necessary changes.
Giulio has been much more reactive than me to fix issues and he is
already listed for them anyway.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 124fc473dd9298facc6f9fd58dd59a706550e29b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d565cc8add..d563c20aaa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2135,10 +2135,6 @@ F:	configs/bananapi_m2_plus_defconfig
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
-N:	Miquèl Raynal <miquel.raynal@bootlin.com>
-F:	package/mali-driver/
-F:	package/rockchip-mali/
-
 N:	Mircea Gliga <gliga.mircea@gmail.com>
 F:	package/mbuffer/
 

--===============3518966715741338083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3518966715741338083==--
