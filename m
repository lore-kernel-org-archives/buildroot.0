Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B09BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE8C440399;
	Thu, 12 May 2022 19:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FY8wsnsqqyxI; Thu, 12 May 2022 19:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2A8540339;
	Thu, 12 May 2022 19:55:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 482411BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C793540359
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_9aX01lQAqY for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C09A040377
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1094F85C6F; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2659ac537c0520ba9638a92fe6185a380fba6e45
X-Git-Newrev: 87794ae497bbf6569e20c7ce13490f3799c3b3d7
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.1094F85C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xclock: bump version to
 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=87794ae497bbf6569e20c7ce13490f3799c3b3d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003147.html
https://lists.x.org/archives/xorg-announce/2022-April/003156.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xclock/xapp_xclock.hash | 10 ++++------
 package/x11r7/xapp_xclock/xapp_xclock.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xclock/xapp_xclock.hash b/package/x11r7/xapp_xclock/xapp_xclock.hash
index 881b40154d..0bc011732f 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.hash
+++ b/package/x11r7/xapp_xclock/xapp_xclock.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003010.html
-md5 437522a96f424f68fc64ed34ece9b211  xclock-1.0.9.tar.bz2
-sha1 774c711cf7ee3f601f7209bbb01ce3f0d5ddbde6  xclock-1.0.9.tar.bz2
-sha256 cf461fb2c6f2ac42c54d8429ee2010fdb9a1442a370adfbfe8a7bfaf33c123bb  xclock-1.0.9.tar.bz2
-sha512 fcbac0b4ab1cea4ae0751ce1c0c6302048e5d98d459873c7580e4ca786ec49fa27f73e5831bdfe135abb5cfeabe886456276e9d01351ea7905c606f40f84522d  xclock-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003156.html
+sha256  df7ceabf8f07044a2fde4924d794554996811640a45de40cb12c2cf1f90f742c  xclock-1.1.1.tar.xz
+sha512  059ea986bc7537c2796e8855676e8357bd8a7852fbac0839b3f8a9e3ffa088de41bc4e4961973353f0a7b7293366b81bc764d74f3dc4e90e361da06185d976e7  xclock-1.1.1.tar.xz
 # Locally computed
-sha256 ee1f19f46801ef00e70498603e74df644d0b93fc82f06b55ce64c3a2c9f16e71  COPYING
+sha256  ee1f19f46801ef00e70498603e74df644d0b93fc82f06b55ce64c3a2c9f16e71  COPYING
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 77cc7011d3..852ae5dbae 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XCLOCK_VERSION = 1.0.9
-XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
+XAPP_XCLOCK_VERSION = 1.1.1
+XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.xz
 XAPP_XCLOCK_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCLOCK_LICENSE = MIT
 XAPP_XCLOCK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
