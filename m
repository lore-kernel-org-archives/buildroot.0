Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BCBC433FE
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A35D1832B0;
	Sat, 30 Apr 2022 18:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_Jw4KtecwNg; Sat, 30 Apr 2022 18:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9589182F51;
	Sat, 30 Apr 2022 18:57:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA851BF94D
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10F2960B6A
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9SyMvGraPDRO for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6194560B78
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0B40584B55; Sat, 30 Apr 2022 18:44:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:42:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c98eb26db6501a373cc405c80505ba72fde9e96
X-Git-Newrev: 53b9e2e168cc2359640b635b607f9786da9b54ba
X-Patchwork-Hint: ignore
Message-Id: <20220430184418.0B40584B55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frotz: Update to version 2.54
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

commit: https://git.buildroot.net/buildroot/commit/?id=53b9e2e168cc2359640b635b607f9786da9b54ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A simple update by bumping the version number and sha256 sum
to the current version.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/frotz/frotz.hash | 2 +-
 package/frotz/frotz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
index e5024aa2cd..145aa3800f 100644
--- a/package/frotz/frotz.hash
+++ b/package/frotz/frotz.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8da558828dd74d6d6ee30483bb32276ef918b8b72b7f6e89b4f7cb27e7abf58b  frotz-2.53.tar.bz2
+sha256  bdf9131e6de49108c9f032200cea3cb4011e5ca0c9fbdbf5b0c05f7c56c81395  frotz-2.54.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
index c1362b2ac6..5af235137c 100644
--- a/package/frotz/frotz.mk
+++ b/package/frotz/frotz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FROTZ_VERSION = 2.53
+FROTZ_VERSION = 2.54
 FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
 FROTZ_SITE = $(call gitlab,DavidGriffith,frotz,$(FROTZ_VERSION))
 FROTZ_DEPENDENCIES = host-pkgconf ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
