Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369CBC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F9E6FB4E;
	Sun, 11 Sep 2022 09:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F9E6FB4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1BjQZbzfTrc; Sun, 11 Sep 2022 09:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2881F6FB09;
	Sun, 11 Sep 2022 09:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2881F6FB09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 826CA1BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 267546103B
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 267546103B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKy4CWTozRJU for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 617956FB50
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 617956FB50
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4BBCB83518; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 8 Sep 2022 09:58:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b30ee98da976210c9ceb971fb944434944031642
X-Git-Newrev: 97599b76f543c8c34eac9e4fda168726c9f3a3d1
X-Patchwork-Hint: ignore
Message-Id: <20220911084829.4BBCB83518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=97599b76f543c8c34eac9e4fda168726c9f3a3d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a small bugfix release which solves a coupld of build issues.
Release notes:

  https://wpewebkit.org/release/cog-0.14.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 3fd480c2a8..aa128d73d8 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.14.0.tar.xz.sums
-md5  2352aaba1a4ff31b1d1fb559c4941a01  cog-0.14.0.tar.xz
-sha1  2da37ea6c25e45425aa80de4a129484ee226dd96  cog-0.14.0.tar.xz
-sha256  e23936f1ce350ea5ea6fa0709b63d34776b05709388aed9c6cf3fdc41299de9f  cog-0.14.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.14.1.tar.xz.sums
+md5  69d72ac046a0fc485ea7b61b96e7e7fc  cog-0.14.1.tar.xz
+sha1  6236972b0ae0bce38a0a017610f161b349723862  cog-0.14.1.tar.xz
+sha256  fb91104e25e1dde27189c91c70acc356e387f47acebaa8997e01ce5879c3a600  cog-0.14.1.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 348c17c336..5f7abcab1f 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.14.0
+COG_VERSION = 0.14.1
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
