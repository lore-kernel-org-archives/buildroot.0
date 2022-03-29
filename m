Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACC2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D919F40BD5;
	Tue, 29 Mar 2022 20:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HTwIdDhJIUKM; Tue, 29 Mar 2022 20:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3FE140BDA;
	Tue, 29 Mar 2022 20:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 224A01BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E62F6111D
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r9jt-OMz-_G2 for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B9C561119
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 33AAB85F8A; Tue, 29 Mar 2022 20:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 21:44:50 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: df1fe3d8e8cba5ba0856a4d029dc6a2499fa67d4
X-Git-Newrev: 8909b3739761dce8f67f9f0afdd79757d7839de0
X-Patchwork-Hint: ignore
Message-Id: <20220329202022.33AAB85F8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: Add some more
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

commit: https://git.buildroot.net/buildroot/commit/?id=8909b3739761dce8f67f9f0afdd79757d7839de0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index c3d7c4a6fe..9d77673f3c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2749,8 +2749,11 @@ F:	utils/size-stats-compare
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
