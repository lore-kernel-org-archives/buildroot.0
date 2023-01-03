Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFFFC3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 21:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 285A74032B;
	Tue,  3 Jan 2023 21:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 285A74032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3vFXbB31l7I; Tue,  3 Jan 2023 21:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 709C140A21;
	Tue,  3 Jan 2023 21:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 709C140A21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 476701BF2FC
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADF4C400BF
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADF4C400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAYBOcL0YPQu for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 21:25:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98892401F3
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 21:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98892401F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8638B8733A; Tue,  3 Jan 2023 21:25:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Jan 2023 22:22:51 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ce671d1ce74a9ddb606738f5ac1681a793fed0cb
X-Git-Newrev: f8a0e850e1bc2847479d0d8db4aa1bcb52fa6abd
X-Patchwork-Hint: ignore
Message-Id: <20230103212520.8638B8733A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 board/freescale/imx28evk/readme.txt: update broken url
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8a0e850e1bc2847479d0d8db4aa1bcb52fa6abd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

http://freescale.com/ urls are all redirected to the NXP homepage
https://www.nxp.com/

Even if the link is not broken in the sense of a 404 http error, the
pointed resource is not found.

This commit updates the old Freescale link to the correct nxp.com
location.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4e54522caeeaec2e14065752cb3905d292f374e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/imx28evk/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imx28evk/readme.txt b/board/freescale/imx28evk/readme.txt
index 2920cb04cd..3b77634fe1 100644
--- a/board/freescale/imx28evk/readme.txt
+++ b/board/freescale/imx28evk/readme.txt
@@ -54,4 +54,4 @@ Enjoy!
 
 References
 ==========
-[1] http://cache.freescale.com/files/32bit/doc/user_guide/EVK_imx28_QuickStart.pdf
+[1] https://www.nxp.com/docs/en/user-guide/EVK_imx28_QuickStart.pdf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
