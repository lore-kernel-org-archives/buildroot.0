Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B0EC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 368644063E;
	Tue,  4 Jan 2022 18:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMfHjd_kZzVW; Tue,  4 Jan 2022 18:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52E3E404D4;
	Tue,  4 Jan 2022 18:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 298C11BF9B4
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24CEE40937
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nXmVUPO-zUr for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 491B44092C
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9472982DBE; Tue,  4 Jan 2022 18:28:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 19:10:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51c22b4ba905f8e0a0f75189715eab628cefab6c
X-Git-Newrev: a242529917cfa7025eb979a87b84b81b5ff25e1e
X-Patchwork-Hint: ignore
Message-Id: <20220104182811.9472982DBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/terminology: bump to version 1.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a242529917cfa7025eb979a87b84b81b5ff25e1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Requires efl 1.26.0 [1]

[1] https://git.enlightenment.org/apps/terminology.git/commit/?id=3e95d2ad9f59e01d498e90dcb4413dc886d49852

See:
https://www.enlightenment.org/news/2022-01-02-terminology-1.12.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index be1d6f4269..7e9658482a 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.9.0.tar.xz.sha256sum
-sha256  3f3bc327da5cc239d468570afed29a17e2fda3b1fee02b28f02ee7ed5141e46c  terminology-1.9.0.tar.xz
+# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.12.0.tar.xz.sha256sum
+sha256  74d2d3b253a77bcb215fc36eedf0ccb59643452e2ef15c510430ffaa6034dcf0  terminology-1.12.0.tar.xz
 sha256  6863ee700fc82b9c3b82a1627136f6935a9eb68e6a64491f20e00b4023c33622  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 29b59fb39e..787c9ad137 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.9.0
+TERMINOLOGY_VERSION = 1.12.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
