Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C649C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D159410F8;
	Tue,  7 Jun 2022 14:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kovKZsDX3AmL; Tue,  7 Jun 2022 14:06:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47D5040B0C;
	Tue,  7 Jun 2022 14:06:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F24EF1BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F01B2424A0
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UJi1zvfLIIL for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:05:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FE4A4249D
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:05:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7625386ABD; Tue,  7 Jun 2022 13:54:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 16:05:39 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f9e69d1b0fcb75c0b3ae943f38c7a1a8de4719ad
X-Git-Newrev: c647ad5937c78e78c0a20f55e72298bc7a2f0627
X-Patchwork-Hint: ignore
Message-Id: <20220607135403.7625386ABD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: update my
 e-mail address
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

commit: https://git.buildroot.net/buildroot/commit/?id=c647ad5937c78e78c0a20f55e72298bc7a2f0627
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

My Bootlin address is preferred from now on.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9118c863b3247ae5c8ba1a61d941f6f1972a4edb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 880b50a13b..b7a4cb64f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1710,7 +1710,7 @@ F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
 F:	package/intel-mediasdk/
 
-N:	Luca Ceresoli <luca@lucaceresoli.net>
+N:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 F:	board/olimex/a20_olinuxino/
 F:	board/zynq/
 F:	board/zynqmp/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
