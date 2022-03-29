Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72377C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 19:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F607401AF;
	Tue, 29 Mar 2022 19:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxSUa9dS5gte; Tue, 29 Mar 2022 19:45:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37A5740140;
	Tue, 29 Mar 2022 19:45:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 470CB1BF83B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42DC761037
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPQfgNmsO2tB for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 19:45:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DE9060590
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 19:45:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 546C985F4F; Tue, 29 Mar 2022 19:36:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 21:44:56 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: afe309d54e5b63bb33dc84443345716dc8d6d2ea
X-Git-Newrev: 658763f397e5e418c115e367aca20b18132764d9
X-Patchwork-Hint: ignore
Message-Id: <20220329193608.546C985F4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: Add some more
 entries for Thomas Huth
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

commit: https://git.buildroot.net/buildroot/commit/?id=658763f397e5e418c115e367aca20b18132764d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

I'm involved in the upstream kvm-unit-tests and the mcf5208 QEMU
machine, so I could help to have a look on these files, too.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3396e945dfc1482cb21b65e5451abc5ec96a796b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3397565457..d299eb79c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2525,8 +2525,11 @@ F:	utils/size-stats-compare
 F:	toolchain/
 
 N:	Thomas Huth <huth@tuxfamily.org>
+F:	board/qemu/m68k-mcf5208/
+F:	configs/qemu_m68k_mcf5208_defconfig
 F:	package/ascii-invaders/
 F:	package/frotz/
+F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
