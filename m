Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EF8CD37B7
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 09:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16B1A405ED;
	Sat, 16 Sep 2023 09:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B1A405ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5bO5d65-pytU; Sat, 16 Sep 2023 09:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F67D402A7;
	Sat, 16 Sep 2023 09:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F67D402A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFC2D1BF574
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 09:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F25B42064
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 09:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F25B42064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d44mGxUZGMuL for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 09:22:28 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80DC441FA9
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 09:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80DC441FA9
X-Virus-Scanned: by amavisd-new using ClamAV (6)
Received: from zm.lan (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id 936541BC070;
 Sat, 16 Sep 2023 11:22:24 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 11:22:05 +0200
Message-ID: <20230916092206.851843-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/orangepi-zero-plus: update link in readme
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Old link is no longer working, so use new link instead.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
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
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
