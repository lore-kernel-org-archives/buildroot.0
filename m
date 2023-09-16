Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E03ECD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 14:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E945840C82;
	Sat, 16 Sep 2023 14:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E945840C82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oMxic7t951F; Sat, 16 Sep 2023 14:04:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3123040C2F;
	Sat, 16 Sep 2023 14:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3123040C2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 696D81BF40D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42C4740C2F
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C4740C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2bgGyEQxOrR for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 14:04:48 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA06D40C12
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA06D40C12
X-Virus-Scanned: by amavisd-new using ClamAV (23)
Received: from zm.lan (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id 80EA71BBE3D;
 Sat, 16 Sep 2023 16:04:44 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 16:04:33 +0200
Message-ID: <20230916140433.45104-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/orangepi*: update links in readme files
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
Cc: Jan Kraval <jan.kraval@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Old links are no longer working, so use new links instead.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 board/orangepi/orangepi-lite2/readme.txt      | 2 +-
 board/orangepi/orangepi-one-plus/readme.txt   | 2 +-
 board/orangepi/orangepi-zero-plus2/readme.txt | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/orangepi/orangepi-lite2/readme.txt b/board/orangepi/orangepi-lite2/readme.txt
index bed561b562..7f88250418 100644
--- a/board/orangepi/orangepi-lite2/readme.txt
+++ b/board/orangepi/orangepi-lite2/readme.txt
@@ -6,7 +6,7 @@ buildroot environment for the Orangepi Lite2. With the current configuration
 it will bring-up the board, and allow access through the serial console.
 
 Orangepi Lite2 link:
-http://www.orangepi.org/Orange%20Pi%20Lite%202/
+http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Lite-2.html
 
 Wiki link:
 https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+Lite2
diff --git a/board/orangepi/orangepi-one-plus/readme.txt b/board/orangepi/orangepi-one-plus/readme.txt
index 87f6de8510..547f874288 100644
--- a/board/orangepi/orangepi-one-plus/readme.txt
+++ b/board/orangepi/orangepi-one-plus/readme.txt
@@ -6,7 +6,7 @@ buildroot environment for the Orangepi One Plus. With the current configuration
 it will bring-up the board, and allow access through the serial console.
 
 Orangepi One Plus link:
-http://www.orangepi.org/OrangePiOneplus/
+http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-One-Plus.html
 
 Wiki link:
 https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+One+Plus
diff --git a/board/orangepi/orangepi-zero-plus2/readme.txt b/board/orangepi/orangepi-zero-plus2/readme.txt
index 322ba0e12a..2df6dd9b11 100644
--- a/board/orangepi/orangepi-zero-plus2/readme.txt
+++ b/board/orangepi/orangepi-zero-plus2/readme.txt
@@ -6,7 +6,7 @@ buildroot environment for the Orangepi Zero Plus2. With the current configuratio
 it will bring-up the board, and allow access through the serial console.
 
 Orangepi Zero Plus2 link:
-http://www.orangepi.org/OrangePiZeroPlus2/
+http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-Plus-2.html
 
 Wiki link:
 https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+Zero+Plus2
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
