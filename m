Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5423C433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90E1C41142;
	Fri, 30 Sep 2022 15:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90E1C41142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duZNdh-PwY_C; Fri, 30 Sep 2022 15:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7161640157;
	Fri, 30 Sep 2022 15:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7161640157
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2E51BF2F7
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32E5E40157
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32E5E40157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YihOsOqo55A1 for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:18:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FFB840B9D
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FFB840B9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DAC586699; Fri, 30 Sep 2022 15:18:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:12:46 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: adf8a8dcde0cc06432df7e4324bd7daf81528551
X-Git-Newrev: a04ee72f0b8a0c2ea72d71a82977e1e18c50cf12
X-Patchwork-Hint: ignore
Message-Id: <20220930151818.4DAC586699@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 board/solidrun/macchiatobin: update BSP components version in documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=a04ee72f0b8a0c2ea72d71a82977e1e18c50cf12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Update the listed versions to match current status since commit
b4d9b515088d ("configs/solidrun_macchiatobin: bump BSP components").

All components are now from upstream so no need to state that for each
one.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3f0ee529083e972be9893676fab00ac50c2816c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/solidrun/macchiatobin/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/solidrun/macchiatobin/readme.txt b/board/solidrun/macchiatobin/readme.txt
index 7412951aab..ef5a6cba6b 100644
--- a/board/solidrun/macchiatobin/readme.txt
+++ b/board/solidrun/macchiatobin/readme.txt
@@ -13,9 +13,9 @@ How to build
 ============
 
 Default configuration provides the following BSP versions:
- - Linux v5.6.3 (mainline)
- - U-Boot v2020.01 (mainline)
- - ATF v1.5-18.12.2 (Marvell)
+ - Linux v5.10.5
+ - U-Boot v2020.10
+ - ATF v2.4
 
 To build images run the following commands:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
