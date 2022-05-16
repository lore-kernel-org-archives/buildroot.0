Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8395F82F9E;
	Mon, 16 May 2022 21:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cl4RAbzsxFr6; Mon, 16 May 2022 21:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC9B9828E3;
	Mon, 16 May 2022 21:39:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 810D71BF35A
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F6A141821
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2igSotkh6tc for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:39:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACDB04181D
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A653385EC5; Mon, 16 May 2022 21:28:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 23:38:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9690c141f6f6644a5b92e950ac3b2a3c7fdd230b
X-Git-Newrev: e0a3b5f57064c1dbaaa334bc5ca45b8de6f8a8a1
X-Patchwork-Hint: ignore
Message-Id: <20220516212801.A653385EC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Gerome Burlats,
 e-mail is bouncing
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0a3b5f57064c1dbaaa334bc5ca45b8de6f8a8a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gerome Burlats left Smile in May 2022 and his e-mail has been disabled.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8988688beb..c33959fa45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1071,10 +1071,6 @@ F:	package/flannel/
 N:	Geoffrey Ragot <geoffreyragot@gmail.com>
 F:	package/python-pyyaml/
 
-N:	Gerome Burlats <gerome.burlats@smile.fr>
-F:	board/qemu/
-F:	configs/qemu_*
-
 N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
 F:	board/friendlyarm/nanopi-r2s/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
