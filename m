Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA31DC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E0182CDE;
	Mon, 20 Feb 2023 23:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E0182CDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DE9T6Gr-zJh; Mon, 20 Feb 2023 23:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C559183FBB;
	Mon, 20 Feb 2023 23:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C559183FBB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87F761BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A6D3610A8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A6D3610A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NEmhrE1YPBa for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8966F617B2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8966F617B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82D918648F; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:17:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4e54522caeeaec2e14065752cb3905d292f374e6
X-Git-Newrev: bfbbfd8fecf8623da4772f97ce208b3e4b69de80
X-Patchwork-Hint: ignore
Message-Id: <20230220205219.82D918648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/freescale/imx6sabre/readme.txt: update broken urls
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfbbfd8fecf8623da4772f97ce208b3e4b69de80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

http://freescale.com/ urls are all redirected to the NXP homepage
https://www.nxp.com/

Even if the links are not broken in the sense of a 404 http error, the
pointed resources are not found.

This commit updates the old freescale links to the correct nxp.com
locations.

Note: the link to the SABRE for Automotive Infotainment Quick Start
Guide now requires a free registration to be accessed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/freescale/imx6sabre/readme.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx6sabre/readme.txt b/board/freescale/imx6sabre/readme.txt
index 4b8db5233a..320ee463e2 100644
--- a/board/freescale/imx6sabre/readme.txt
+++ b/board/freescale/imx6sabre/readme.txt
@@ -8,15 +8,15 @@ as well as the Freescale SABRE Board for Automotive Infotainment.
 
 Read the i.MX 6 SABRESD Quick Start Guide for an introduction to the
 board:
-http://cache.freescale.com/files/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.pdf
+https://www.nxp.com/files-static/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.pdf
 
 Read the i.MX 6 SoloX SABRESD Quick Start Guide for an introduction to
 the board:
-http://cache.freescale.com/files/32bit/doc/user_guide/IMX6SOLOXQSG.pdf
+https://www.nxp.com/files-static/32bit/doc/quick_start_guide/IMX6SOLOXQSG.pdf
 
 Read the SABRE for Automotive Infotainment Quick Start Guide for an
 introduction to the board:
-http://cache.freescale.com/files/32bit/doc/user_guide/IMX6SABREINFOQSG.pdf
+https://www.nxp.com/webapp/Download?colCode=IMX6SABREINFOQSG
 
 Building with NXP kernel and NXP U-Boot
 =======================================
@@ -166,6 +166,6 @@ Enjoy!
 References
 ==========
 
-https://community.freescale.com/docs/DOC-95015
-https://community.freescale.com/docs/DOC-95017
-https://community.freescale.com/docs/DOC-99218
+https://community.nxp.com/docs/DOC-95015
+https://community.nxp.com/docs/DOC-95017
+https://community.nxp.com/docs/DOC-99218
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
