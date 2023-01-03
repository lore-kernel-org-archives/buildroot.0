Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E3BC3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 21:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0E760FB6;
	Tue,  3 Jan 2023 21:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0E760FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIPFHITdgYym; Tue,  3 Jan 2023 21:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE2860FB4;
	Tue,  3 Jan 2023 21:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE2860FB4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 468811BF2FC
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22F3B4032B
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22F3B4032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QYOJ9Hs9zZ4 for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 21:25:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A786A402D7
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 21:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A786A402D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 908478738F; Tue,  3 Jan 2023 21:25:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Jan 2023 22:23:00 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f8a0e850e1bc2847479d0d8db4aa1bcb52fa6abd
X-Git-Newrev: cb266fc67bf5602be21d87832a183596a1956b8b
X-Patchwork-Hint: ignore
Message-Id: <20230103212520.908478738F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb266fc67bf5602be21d87832a183596a1956b8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit bfbbfd8fecf8623da4772f97ce208b3e4b69de80)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
