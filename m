Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56352C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17C7160D64;
	Sun, 29 May 2022 08:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eui_NKPnRXVZ; Sun, 29 May 2022 08:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A41360D80;
	Sun, 29 May 2022 08:38:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF9051BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A312061101
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8866sAvpQbEc for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:35:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE10E61102
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:35:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 891D28643D; Sun, 29 May 2022 08:24:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:35:00 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5b75773660ff63c6d58abe5cb461b2cfde861740
X-Git-Newrev: 25296268c6ff7df30974132f209ba95a6cc5f718
X-Patchwork-Hint: ignore
Message-Id: <20220529082411.891D28643D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: remove Gerome
 Burlats, e-mail is bouncing
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

commit: https://git.buildroot.net/buildroot/commit/?id=25296268c6ff7df30974132f209ba95a6cc5f718
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Gerome Burlats left Smile in May 2022 and his e-mail has been disabled.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e0a3b5f57064c1dbaaa334bc5ca45b8de6f8a8a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 22cc8a6d84..880b50a13b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1065,10 +1065,6 @@ F:	package/flannel/
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
