Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CD5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B478129F;
	Thu, 24 Mar 2022 20:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzfKmLjDexO8; Thu, 24 Mar 2022 20:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCAA81266;
	Thu, 24 Mar 2022 20:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E725B1BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C687F401E1
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idglfz1199A6 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:43:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1D7D4107E
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:43:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D421285C13; Thu, 24 Mar 2022 20:34:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 21:10:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3a1593b74048eec038cd351b06a6654e8bba0c4
X-Git-Newrev: 3396e945dfc1482cb21b65e5451abc5ec96a796b
X-Patchwork-Hint: ignore
Message-Id: <20220324203416.D421285C13@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Add some more entries for
 Thomas Huth
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

commit: https://git.buildroot.net/buildroot/commit/?id=3396e945dfc1482cb21b65e5451abc5ec96a796b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I'm involved in the upstream kvm-unit-tests and the mcf5208 QEMU
machine, so I could help to have a look on these files, too.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 58ed4f81cd..a66b9d7eee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2759,8 +2759,11 @@ F:	utils/size-stats-compare
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
