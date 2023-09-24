Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F204FCE7A8C
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 920D241708;
	Sun, 24 Sep 2023 21:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 920D241708
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UoHSkPR8CzJR; Sun, 24 Sep 2023 21:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CDF341740;
	Sun, 24 Sep 2023 21:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CDF341740
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2A71BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F2D817A2
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F2D817A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbJZ5845X6Tw for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:20:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4EF481779
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4EF481779
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1B1B87605; Sun, 24 Sep 2023 21:20:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 21:27:29 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3291b7d53d390829853eda095293a9264c08010b
X-Git-Newrev: bb4093b45d6e921ae4bee80b264fb801ba58dc0b
X-Patchwork-Hint: ignore
Message-Id: <20230924212039.B1B1B87605@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] board/orangepi-zero-plus:
 update link in readme
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb4093b45d6e921ae4bee80b264fb801ba58dc0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Old link is no longer working, so use new link instead.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0612504c4301b3aed4757d9358dd5b5cf09ef1cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
