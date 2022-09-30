Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476B0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFA2A842CC;
	Fri, 30 Sep 2022 15:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFA2A842CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVy3NRG1NrFM; Fri, 30 Sep 2022 15:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29451842BC;
	Fri, 30 Sep 2022 15:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29451842BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EEC01C2745
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1604861121
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1604861121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBWnZsndIjA4 for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D5006110E
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5006110E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39EA986665; Fri, 30 Sep 2022 15:16:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:12:42 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 37b32debef9d3517ffc3b2e1bf19dd7d9d56f7ff
X-Git-Newrev: fdd9d39c5e5c2d78aeae290ec77e059db4ae39b6
X-Patchwork-Hint: ignore
Message-Id: <20220930151609.39EA986665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdd9d39c5e5c2d78aeae290ec77e059db4ae39b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
