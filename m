Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015EBC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A994F81756;
	Sun, 12 Feb 2023 20:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A994F81756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBJVMCNv5M6g; Sun, 12 Feb 2023 20:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12EA98141C;
	Sun, 12 Feb 2023 20:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12EA98141C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01B1B1BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE51D4039D
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE51D4039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5Wyp6_ggBEk for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:50:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C656400D3
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C656400D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B3D685B14; Sun, 12 Feb 2023 20:50:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:49:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27f38e175346c09eed003e95daa0f065b43e27e4
X-Git-Newrev: 8f48b3983cdb32dfcd59e7e549c8eaa1503fe342
X-Patchwork-Hint: ignore
Message-Id: <20230212205037.0B3D685B14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/visionfive2: add link to
 documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f48b3983cdb32dfcd59e7e549c8eaa1503fe342
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a link to RVspace Documentation Center, which did not exist
when readme.txt was first submitted. It provides datasheet, quick
start, schematics, and so on.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/visionfive2/readme.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
index 2da98f3847..1924cbc12b 100644
--- a/board/visionfive2/readme.txt
+++ b/board/visionfive2/readme.txt
@@ -4,6 +4,8 @@ Starfive VisionFive2
 The VisionFive2 is a low-cost RISC-V 64-bit based platform, powered by a
 Starfive JH7110 processor.
 
+https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
+
 How to build
 ============
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
