Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88D0C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E57415A4;
	Sun,  3 Dec 2023 16:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60E57415A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOT6JoFUt026; Sun,  3 Dec 2023 16:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B90144158F;
	Sun,  3 Dec 2023 16:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B90144158F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFAF1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6274E40948
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6274E40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-hVT0mKdhMp for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 471C540914
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 471C540914
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1394887746; Sun,  3 Dec 2023 16:26:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:21:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a73cbe68b2548308ff7590c4720ebf56f275a6ee
X-Git-Newrev: 35059ebc37283d2fee5cdd9264a9d5c640271359
X-Patchwork-Hint: ignore
Message-Id: <20231203162610.1394887746@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Synopsys email address
 for S.Matyukevich
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

commit: https://git.buildroot.net/buildroot/commit/?id=35059ebc37283d2fee5cdd9264a9d5c640271359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I am no longer work at Synopsys, so remove this email address.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..904c7ebf2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2713,10 +2713,6 @@ F:	package/rtl8189fs/
 F:	package/wpa_supplicant/
 F:	package/xr819-xradio/
 
-N:	Sergey Matyukevich <sergey.matyukevich@synopsys.com>
-F:	board/synopsys/nsim/
-F:	configs/snps_arc700_nsim_defconfig
-
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
 F:	configs/toradex_apalis_imx6_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
