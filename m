Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2273CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9270341900;
	Sun, 24 Sep 2023 21:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9270341900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDCZE_vbpsAH; Sun, 24 Sep 2023 21:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45603418F1;
	Sun, 24 Sep 2023 21:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45603418F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06AEF1BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B21D4180B
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B21D4180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXMTs2e-6_wQ for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73BFD417B0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73BFD417B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43BC187646; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:15:34 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7039e047b5712e77f50da69dc25a185c9696e702
X-Git-Newrev: 74255ede94a9163ec7f94e02231733c110d11324
X-Patchwork-Hint: ignore
Message-Id: <20230924212149.43BC187646@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] board/orangepi*: update
 links in readme files
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

commit: https://git.buildroot.net/buildroot/commit/?id=74255ede94a9163ec7f94e02231733c110d11324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Old links are no longer working, so use new links instead.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9584c8073a3b0d7453683d32bfafa0eb2c856a64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
