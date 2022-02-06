Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42401C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E15E681839;
	Sun,  6 Feb 2022 10:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlAOhUI0Sa8M; Sun,  6 Feb 2022 10:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 285DD81819;
	Sun,  6 Feb 2022 10:53:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8863F1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 772F840217
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiUGcCRsP4pR for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:53:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF3D840222
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:53:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A013182984; Sun,  6 Feb 2022 10:45:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:52:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3375bfdb2ee26d30019bee66e6d4f21fe8801de
X-Git-Newrev: 437543c7d907943a159870a4b04efa88e36cc460
X-Patchwork-Hint: ignore
Message-Id: <20220206104547.A013182984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add guile and bdwgc packages
 to Pedro Aguilar
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=437543c7d907943a159870a4b04efa88e36cc460
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a1ec9a091e..c52cb35b60 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2198,6 +2198,8 @@ F:	package/lightning/
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
