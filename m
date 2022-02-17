Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CD6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 13:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E5D841E39;
	Thu, 17 Feb 2022 13:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGvU90xX5C3M; Thu, 17 Feb 2022 13:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD8C6401B3;
	Thu, 17 Feb 2022 13:55:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 247B01BF3C6
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10F614027A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVZlZ3KNNhIF for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 13:53:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3897E401B3
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:53:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DC23882792; Thu, 17 Feb 2022 13:46:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 14:53:25 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5b46038f99d4a8d0492c2b25b72ed15e0e24c206
X-Git-Newrev: b96f2215394e378835188f7551ba3c05d47f6782
X-Patchwork-Hint: ignore
Message-Id: <20220217134615.DC23882792@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add guile and
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

commit: https://git.buildroot.net/buildroot/commit/?id=b96f2215394e378835188f7551ba3c05d47f6782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 437543c7d907943a159870a4b04efa88e36cc460)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7ec36e2185..bd8c99a229 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2000,6 +2000,8 @@ F:	package/lightning/
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
