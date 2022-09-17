Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D11ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 10:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4021F8415F;
	Sat, 17 Sep 2022 10:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4021F8415F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zbj_uthRCed0; Sat, 17 Sep 2022 10:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77C98402D;
	Sat, 17 Sep 2022 10:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B77C98402D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 861FE1BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D78541A3E
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D78541A3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVa6ACFf0uja for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 10:25:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 461E6419D8
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 10:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461E6419D8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 33A7B84196; Sat, 17 Sep 2022 10:25:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 12:23:52 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4fe9d27021b310aef1f960fb53fbf43e83b4aa29
X-Git-Newrev: 05a51acabb2be03f590f58dcc1942be39eebc23a
X-Patchwork-Hint: ignore
Message-Id: <20220917102506.33A7B84196@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/sunxi-mali-utgard-driver: update Config.in link to the new project
 URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=05a51acabb2be03f590f58dcc1942be39eebc23a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit af582c9f8fb958d8860c9fcaad98c4f70a6488fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali-utgard-driver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-mali-utgard-driver/Config.in b/package/sunxi-mali-utgard-driver/Config.in
index 244283f44d..ba4d1919ce 100644
--- a/package/sunxi-mali-utgard-driver/Config.in
+++ b/package/sunxi-mali-utgard-driver/Config.in
@@ -36,4 +36,4 @@ config BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER
 	    since the driver requires at least double buffering and
 	    fails to work with the default value(100).
 
-	  https://github.com/mripard/sunxi-mali/blob/master/README.md
+	  https://github.com/giuliobenetti/sunxi-mali/blob/master/README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
