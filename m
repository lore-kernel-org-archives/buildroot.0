Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A2FCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EAD5418B9;
	Sun, 24 Sep 2023 21:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EAD5418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_Gygw2PrpYU; Sun, 24 Sep 2023 21:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4752341919;
	Sun, 24 Sep 2023 21:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4752341919
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0421BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9F3A81839
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F3A81839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zlceYQKDnM9T for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80CF481D5F
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80CF481D5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B50D87642; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:15:28 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: a04464807afcb461d5e6960da06f446f6393596f
X-Git-Newrev: 775d2ef83e165291ed6e9e562944b645f3272eff
X-Patchwork-Hint: ignore
Message-Id: <20230924212150.7B50D87642@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] board/orangepi*: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=775d2ef83e165291ed6e9e562944b645f3272eff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
