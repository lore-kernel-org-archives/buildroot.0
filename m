Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED84C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4E9D83FF2;
	Tue, 12 Apr 2022 19:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeRBW6AHqblY; Tue, 12 Apr 2022 19:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBFCD83F68;
	Tue, 12 Apr 2022 19:51:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B14571BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35FE082CD3
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0mEqGUo_tq7 for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:49:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5439682A87
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 19:49:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8E3DD83B91; Tue, 12 Apr 2022 19:39:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 21:40:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ab10ae245f0ad9d22592e8086132795f3c44600
X-Git-Newrev: 2d9b33e61c9b450f12bc64e5ac18ec44cfb70668
X-Patchwork-Hint: ignore
Message-Id: <20220412193953.8E3DD83B91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libevdev: bump to version 1.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d9b33e61c9b450f12bc64e5ac18ec44cfb70668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libevdev/libevdev.hash | 6 +++---
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 68a5ebdcba..dd76e158ef 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/input-tools/2021-November/001573.html
-sha256  2f729e3480695791f9482e8388bd723402b89f0eaf118057bbdea3cecee9b237  libevdev-1.12.0.tar.xz
-sha512  6c1c1362d5112cdf3816d1f735c27e625f5463ebf10a83d675cd9364c3fb291ebcb91c051da442f1a36ed28ba7dd99af74546707f61274f7d5715c544a0ed04c  libevdev-1.12.0.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2022-March/001574.html
+sha256  1dbba41bc516d3ca7abc0da5b862efe3ea8a7018fa6e9b97ce9d39401b22426c  libevdev-1.12.1.tar.xz
+sha512  eefce287a665e4f89eb2e0437dfefd45ecf8925c7dac35a1bdd46158541f77f2032c6146900a30a01321751d55a9b537bd1d61777cca9cfa02c39a6e31c97be4  libevdev-1.12.1.tar.xz
 
 # Hash for license files:
 sha256  6f13de7ce28e4948ba95170e0723ee1254c1978ce1f127af82aeca597b567cb9  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index cd80154be2..726a5afcee 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.12.0
+LIBEVDEV_VERSION = 1.12.1
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
