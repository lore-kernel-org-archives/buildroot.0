Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4532FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEA6941729;
	Mon,  7 Mar 2022 19:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UxrIDF-R_rU; Mon,  7 Mar 2022 19:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C54C4171A;
	Mon,  7 Mar 2022 19:57:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11B251BF982
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C208403F8
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjzql18WJdgi for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:56:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D0F54016A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:56:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7033D81EBF; Mon,  7 Mar 2022 19:48:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 20:45:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89ab2a5a3f4588891ab1e9e76feb8c3f69402d5c
X-Git-Newrev: f8a4972a9a46738e57b66d1434f074ecfe8adc07
X-Patchwork-Hint: ignore
Message-Id: <20220307194833.7033D81EBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8a4972a9a46738e57b66d1434f074ecfe8adc07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which fixes an installation path and a crash
with certain Wayland compositors. Release notes can be found at:

  https://wpewebkit.org/release/cog-0.12.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 6a9af1845d..839b12e619 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.12.0.tar.xz.sums
-md5  30d6f68914af0ba5c32ac14df504215a  cog-0.12.0.tar.xz
-sha1  de367b33fb45a1bca9e443ca5c1d6cae3833d759  cog-0.12.0.tar.xz
-sha256  aad413a8aaf15d400d70f9c909a28b92b138f7b0c0d825978de8788d0d75208a  cog-0.12.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.12.1.tar.xz.sums
+md5  25a80a5a8a52b8873933a128151b8928  cog-0.12.1.tar.xz
+sha1  3b9f67bc23cd9e3db2221366d6cde4ca0b06b811  cog-0.12.1.tar.xz
+sha256  23caaafa2ef5c2f6a97d467fcce908ea71087ad03b72deb9280225c0dd561c91  cog-0.12.1.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 606374d9c3..2f6ef402fb 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.12.0
+COG_VERSION = 0.12.1
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
