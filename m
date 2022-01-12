Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40C6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 20:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 620B1600D4;
	Wed, 12 Jan 2022 20:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88aFtiiGUP2p; Wed, 12 Jan 2022 20:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD62160C30;
	Wed, 12 Jan 2022 20:19:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 259E21BF9B5
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 132BA40475
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWtCkdbTr3TL for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 20:19:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3E7C40470
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 20:19:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F05678353A; Wed, 12 Jan 2022 20:12:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 21:18:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27856dfd1af18161af84783c785481de9c7e8d94
X-Git-Newrev: feb9185fc185c1f76e3789b0dc521e3cf98c1ebb
X-Patchwork-Hint: ignore
Message-Id: <20220112201255.F05678353A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: remove numbering from patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=feb9185fc185c1f76e3789b0dc521e3cf98c1ebb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package says
package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch:4: generate your patches with 'git format-patch -N'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch b/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch
index 6b9cfb3e70..3e808deb88 100644
--- a/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch
+++ b/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch
@@ -1,7 +1,7 @@
 From 6ce41f621154eff0145dab41308bc145c0440f16 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Mon, 10 Jan 2022 22:32:18 +0100
-Subject: [PATCH 1/1] dpp: fix implicit declaration of function explicit_bzero
+Subject: [PATCH] dpp: fix implicit declaration of function explicit_bzero
  warning
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
