Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76C6C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BAA860B28;
	Sat,  8 Jan 2022 15:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWrI2UX7G9SD; Sat,  8 Jan 2022 15:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC31160A6F;
	Sat,  8 Jan 2022 15:18:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0DE1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 383344030C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgjWoRw6mUgY for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FD494094D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9B15282AB6; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:49:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 027f172c8a8ef5784bd0e0650b3e9778a4040671
X-Git-Newrev: cf476b1e9584265dc7bec8cdba02444a31db837f
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.9B15282AB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/terminology: bump to version 1.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf476b1e9584265dc7bec8cdba02444a31db837f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://www.enlightenment.org/news/2022-01-03-terminology-1.12.1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 7e9658482a..2ad10af76f 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.12.0.tar.xz.sha256sum
-sha256  74d2d3b253a77bcb215fc36eedf0ccb59643452e2ef15c510430ffaa6034dcf0  terminology-1.12.0.tar.xz
+# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.12.1.tar.xz.sha256sum
+sha256  f8ced9584c2e9ae87452ce7425fd25b2d3e122c7489785d2917890215c6b5aa9  terminology-1.12.1.tar.xz
 sha256  6863ee700fc82b9c3b82a1627136f6935a9eb68e6a64491f20e00b4023c33622  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 787c9ad137..c3125c71ec 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.12.0
+TERMINOLOGY_VERSION = 1.12.1
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
