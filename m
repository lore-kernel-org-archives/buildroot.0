Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C436C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB221402EB;
	Wed, 30 Aug 2023 22:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB221402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZZmFFl8Vp6G; Wed, 30 Aug 2023 22:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02B4141839;
	Wed, 30 Aug 2023 22:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02B4141839
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC3851BF424
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D299C612D5
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D299C612D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNn2Kz4iLAYQ for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1227060FB2
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1227060FB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F37BF866C0; Wed, 30 Aug 2023 22:31:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 00:14:32 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: f8e97d8cd6358cdb4239c6196c48248816821d86
X-Git-Newrev: edab7e0f75f566d7c0ae4274183c25f0b94e6149
X-Patchwork-Hint: ignore
Message-Id: <20230830223118.F37BF866C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x]
 board/bsh/imx8mn-bsh-smm-s2/readme.txt: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=edab7e0f75f566d7c0ae4274183c25f0b94e6149
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

It was a leftover from the copy-and-paste of the readme.txt file of its
almost twin sister BSH SMM S2 PRO.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d4f23da67eedc56f285e093b7432b33ba303a71c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
