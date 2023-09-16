Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8D6CD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 14:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95CA4607B4;
	Sat, 16 Sep 2023 14:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95CA4607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjcB_kgnqSrT; Sat, 16 Sep 2023 14:45:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5CCF60742;
	Sat, 16 Sep 2023 14:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5CCF60742
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D704D1BF40D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF900416D6
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF900416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-KWT5bwiuve for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 14:45:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C8A4416CC
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C8A4416CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DC18870FC; Sat, 16 Sep 2023 14:45:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 16:45:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 528197f5e319d62c2abe2319178fc8cf527bde3c
X-Git-Newrev: 9584c8073a3b0d7453683d32bfafa0eb2c856a64
X-Patchwork-Hint: ignore
Message-Id: <20230916144544.7DC18870FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi*: update links in readme
 files
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

commit: https://git.buildroot.net/buildroot/commit/?id=9584c8073a3b0d7453683d32bfafa0eb2c856a64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old links are no longer working, so use new links instead.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
