Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46560C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC0E460AFE;
	Sun, 30 Jul 2023 10:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC0E460AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxBjvmKM-wYY; Sun, 30 Jul 2023 10:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4610C60ACA;
	Sun, 30 Jul 2023 10:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4610C60ACA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B16FF1BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B47E40193
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B47E40193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TDrZGCe_c7d for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:37:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5D454014D
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5D454014D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A272B83BD6; Sun, 30 Jul 2023 10:37:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:36:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38370aa2f9bda68b31a52fe0a2041fc4c631a71e
X-Git-Newrev: d4f23da67eedc56f285e093b7432b33ba303a71c
X-Patchwork-Hint: ignore
Message-Id: <20230730103743.A272B83BD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/bsh/imx8mn-bsh-smm-s2/readme.txt:
 fix typo
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4f23da67eedc56f285e093b7432b33ba303a71c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was a leftover from the copy-and-paste of the readme.txt file of its
almost twin sister BSH SMM S2 PRO.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/bsh/imx8mn-bsh-smm-s2/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/bsh/imx8mn-bsh-smm-s2/readme.txt b/board/bsh/imx8mn-bsh-smm-s2/readme.txt
index 37081091e8..6b8cd03199 100644
--- a/board/bsh/imx8mn-bsh-smm-s2/readme.txt
+++ b/board/bsh/imx8mn-bsh-smm-s2/readme.txt
@@ -2,7 +2,7 @@ i.MX8MN BSH SMM S2
 ==================
 
 This tutorial describes how to use the predefined Buildroot
-configuration for the i.MX8MN BSH SMM S2 PRO board.
+configuration for the i.MX8MN BSH SMM S2 board.
 
 Building
 --------
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
