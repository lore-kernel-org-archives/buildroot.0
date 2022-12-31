Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CBAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24B6C60ABB;
	Sat, 31 Dec 2022 16:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24B6C60ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDPKDdwo7aJt; Sat, 31 Dec 2022 16:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FD5160AEC;
	Sat, 31 Dec 2022 16:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD5160AEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40E091BF855
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C9F2607FE
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C9F2607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqwiN4MJHbXE for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:20:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DA74607CE
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DA74607CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51B6786F87; Sat, 31 Dec 2022 16:20:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:17:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfbbfd8fecf8623da4772f97ce208b3e4b69de80
X-Git-Newrev: 01a3cb0f6eac48150c4bd246402025c0790e2625
X-Patchwork-Hint: ignore
Message-Id: <20221231162003.51B6786F87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale/imx6ulevk/readme.txt:
 update broken url
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

commit: https://git.buildroot.net/buildroot/commit/?id=01a3cb0f6eac48150c4bd246402025c0790e2625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://freescale.com/ urls are all redirected to the NXP homepage
https://www.nxp.com/

Even if the link is not broken in the sense of a 404 http error, the
pointed resource is not found.

This commit updates the old freescale link to the correct nxp.com
location.

Note: the link now requires a free registration to be accessed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/freescale/imx6ulevk/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index 5bc03771f2..5a5b4ae5a3 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -71,4 +71,4 @@ Enjoy!
 
 References
 ==========
-[1] http://cache.freescale.com/files/32bit/doc/quick_start_guide/IMX6ULTRALITEQSG.pdf
+[1] https://www.nxp.com/webapp/Download?colCode=IMX6ULTRALITEQSG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
