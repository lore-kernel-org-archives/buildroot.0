Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18884C433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A619741DA3;
	Fri, 30 Sep 2022 15:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A619741DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K091-URoOnWU; Fri, 30 Sep 2022 15:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 978A641D9A;
	Fri, 30 Sep 2022 15:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 978A641D9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC041C2747
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED54A40DA0
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED54A40DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5b96bVOW2mMY for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:19:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E2D440B9D
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2D440B9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D59286692; Fri, 30 Sep 2022 15:19:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:12:54 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: bd3c34ecd42f066658b2521aa70616e54a2d1050
X-Git-Newrev: b78f06264ded598151b6607e1b498921d0ac0731
X-Patchwork-Hint: ignore
Message-Id: <20220930151950.0D59286692@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=b78f06264ded598151b6607e1b498921d0ac0731
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
