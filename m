Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BB6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 13:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7CEC83F4D;
	Thu, 17 Feb 2022 13:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnIMdgmiiBIv; Thu, 17 Feb 2022 13:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2124583E2C;
	Thu, 17 Feb 2022 13:56:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFA761BF3C6
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD2FC41831
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ug4clXC2zzO6 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 13:56:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 138C04182F
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:56:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B34E88377F; Thu, 17 Feb 2022 13:48:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 14:53:17 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: f7d2453564c7aff2b9eefe91b7d188d888a8d03e
X-Git-Newrev: 59f0bb204f8b6b5873f758ca3f9d00cf029c8b08
X-Patchwork-Hint: ignore
Message-Id: <20220217134828.B34E88377F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] DEVELOPERS: add guile and
 bdwgc packages to Pedro Aguilar
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

commit: https://git.buildroot.net/buildroot/commit/?id=59f0bb204f8b6b5873f758ca3f9d00cf029c8b08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 437543c7d907943a159870a4b04efa88e36cc460)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f202e1f19..2cc5a12ef9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2098,6 +2098,8 @@ F:	package/lightning/
 F:	package/umtprd/
 
 N:	Pedro Aguilar <paguilar@paguilar.org>
+F:	package/bdwgc/
+F:	package/guile/
 F:	package/libunistring/
 
 N:	Peter Korsgaard <peter@korsgaard.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
