Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8A3C433FE
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4ACE415A5;
	Mon, 24 Jan 2022 21:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmHs677codK6; Mon, 24 Jan 2022 21:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130E0410A4;
	Mon, 24 Jan 2022 21:03:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA7941BF3FB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97D8F84C10
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRrE1YzQDzWc for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:03:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4E1A84C0E
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:03:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B2A8D822E9; Mon, 24 Jan 2022 20:56:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 22:03:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27d08083ed4db5bd055219574cc602aaf8053a49
X-Git-Newrev: 3edc9055c2098de37d4365a20fe278deaa0cebb6
X-Patchwork-Hint: ignore
Message-Id: <20220124205624.B2A8D822E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libev: bump to version 4.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=3edc9055c2098de37d4365a20fe278deaa0cebb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/xorangekiller/libev-git/blob/rel-4_33/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libev/libev.hash | 4 ++--
 package/libev/libev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libev/libev.hash b/package/libev/libev.hash
index 9ab341dedd..a849f3f39a 100644
--- a/package/libev/libev.hash
+++ b/package/libev/libev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2d5526fc8da4f072dd5c73e18fbb1666f5ef8ed78b73bba12e195cfdd810344e  libev-4.27.tar.gz
-sha256 c4dd1a5bc38b041a320b93c5d6c08f5c41a63f2ce718ee16cfcb757fad448199  LICENSE
+sha256  507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea  libev-4.33.tar.gz
+sha256  c4dd1a5bc38b041a320b93c5d6c08f5c41a63f2ce718ee16cfcb757fad448199  LICENSE
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 38b0530f62..9f3c19d46c 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEV_VERSION = 4.27
+LIBEV_VERSION = 4.33
 LIBEV_SITE = http://dist.schmorp.de/libev/Attic
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
