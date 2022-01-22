Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5720C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 12:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B91E606C0;
	Sat, 22 Jan 2022 12:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDax8E3LiFQ8; Sat, 22 Jan 2022 12:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6491605D8;
	Sat, 22 Jan 2022 12:19:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 879631BF2AF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75E38827BA
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llznuxW-pZBf for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 12:19:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2651827A9
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 12:19:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 03AD5825C1; Sat, 22 Jan 2022 12:12:36 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 13:18:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 944eb00fd16b471432ee7cb4106ab9a82a2e57a5
X-Git-Newrev: 4ad77c42db2a5359770f3623e12807d65bdec386
X-Patchwork-Hint: ignore
Message-Id: <20220122121237.03AD5825C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunistring: bump version to 1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ad77c42db2a5359770f3623e12807d65bdec386
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation in hash file (two spaces)

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libunistring/libunistring.hash | 6 +++---
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index 2e4595b17d..81ffd4fb0c 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz.sig
-sha256	eb8fb2c3e4b6e2d336608377050892b54c3c983b646c561836550863003c05d7	libunistring-0.9.10.tar.xz
+sha256  5bab55b49f75d77ed26b257997e919b693f29fd4a1bc22e0e6e024c246c72741  libunistring-1.0.tar.xz
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
-sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LIB
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 1ed7ecf906..a69eacd676 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 0.9.10
+LIBUNISTRING_VERSION = 1.0
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
