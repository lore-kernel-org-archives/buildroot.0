Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FE0C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 08:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5062B418C5;
	Sat, 24 Sep 2022 08:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5062B418C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6ShpmDpIrM7; Sat, 24 Sep 2022 08:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE9B741871;
	Sat, 24 Sep 2022 08:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE9B741871
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5881BF861
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1620A41871
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1620A41871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9MZi02v8WEjT for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 08:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1578D41860
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 08:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1578D41860
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F393D85FA2; Sat, 24 Sep 2022 08:37:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 10:37:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a54a7bf805424dacb02a17b7de5a5ebacec7356e
X-Git-Newrev: 3f0ee529083e972be9893676fab00ac50c2816c3
X-Patchwork-Hint: ignore
Message-Id: <20220924083724.F393D85FA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/solidrun/macchiatobin: update BSP
 components version in documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f0ee529083e972be9893676fab00ac50c2816c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the listed versions to match current status since commit
b4d9b515088d ("configs/solidrun_macchiatobin: bump BSP components").

All components are now from upstream so no need to state that for each
one.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
