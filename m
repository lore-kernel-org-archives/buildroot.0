Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C18CD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 11:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A64840A48;
	Sat, 16 Sep 2023 11:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A64840A48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRpiZQnOz_rt; Sat, 16 Sep 2023 11:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6366D40A1F;
	Sat, 16 Sep 2023 11:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6366D40A1F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7297E1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 11:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48D2061039
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 11:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48D2061039
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Juan6dBy2B-d for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 11:49:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67B3561033
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 11:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B3561033
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 543A5863B9; Sat, 16 Sep 2023 11:49:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 13:48:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdab457768b336a442897137c4f62d4e387b3d10
X-Git-Newrev: 0612504c4301b3aed4757d9358dd5b5cf09ef1cf
X-Patchwork-Hint: ignore
Message-Id: <20230916114928.543A5863B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi-zero-plus: update link in
 readme
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

commit: https://git.buildroot.net/buildroot/commit/?id=0612504c4301b3aed4757d9358dd5b5cf09ef1cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old link is no longer working, so use new link instead.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/orangepi/orangepi-zero-plus/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-zero-plus/readme.txt b/board/orangepi/orangepi-zero-plus/readme.txt
index 5556eae890..1e60e0f825 100644
--- a/board/orangepi/orangepi-zero-plus/readme.txt
+++ b/board/orangepi/orangepi-zero-plus/readme.txt
@@ -6,7 +6,7 @@ buildroot environment for the Orangepi Zero Plus. With the current configuration
 it will bring-up the board, and allow access through the serial console.
 
 Orangepi Zero Plus link:
-http://www.orangepi.org/OrangePiZeroPlus/
+http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-Plus.html
 
 This configuration uses U-Boot mainline and kernel mainline.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
