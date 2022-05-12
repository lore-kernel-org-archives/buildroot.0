Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ABAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6673B41719;
	Thu, 12 May 2022 19:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKO4BtP8phzJ; Thu, 12 May 2022 19:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EA2C41710;
	Thu, 12 May 2022 19:54:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 366A51BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FB1640445
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkysbIKcttMf for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A53AD40393
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E8BF585C6F; Thu, 12 May 2022 19:41:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a5e228a89b634e258e95dd01a78218d663e3fee
X-Git-Newrev: 6b213b6b0cf3acb8459ebb7a1ee438e9c8a33afb
X-Patchwork-Hint: ignore
Message-Id: <20220512194100.E8BF585C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_mkfontscale: bump
 version to 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b213b6b0cf3acb8459ebb7a1ee438e9c8a33afb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003144.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash | 10 ++++------
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
index cbcdb1700b..cad6c11365 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002988.html
-md5 215940de158b1a3d8b3f8b442c606e2f  mkfontscale-1.2.1.tar.bz2
-sha1 fb9d0458a4476a237609b676f9cebcc64b0a8a85  mkfontscale-1.2.1.tar.bz2
-sha256 ca0495eb974a179dd742bfa6199d561bda1c8da4a0c5a667f21fd82aaab6bac7  mkfontscale-1.2.1.tar.bz2
-sha512 4d243160e1f7f8dfa6a8f53349c1a42a55fc99426455ebdef58352c5e951fce8b4f1fbd1061a76c9a148095b002eac372db1ae5e2647d2ccb4886635b317b18c  mkfontscale-1.2.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003144.html
+sha256  8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4  mkfontscale-1.2.2.tar.xz
+sha512  4c846816325347c91008d76b3a5610c1e58a8414fd55117e7ccf51310db4b20b8397ecf6c9177ff77322e27ee088bf034fd175c9210465c50b094bab8dada4b3  mkfontscale-1.2.2.tar.xz
 # Locally computed
-sha256 80df6f5b759f7775042313e4586506db60f26fd15b98b532cf518bd8cf1e8488  COPYING
+sha256  80df6f5b759f7775042313e4586506db60f26fd15b98b532cf518bd8cf1e8488  COPYING
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 11d9cc952f..23b2e2283a 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_MKFONTSCALE_VERSION = 1.2.1
-XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
+XAPP_MKFONTSCALE_VERSION = 1.2.2
+XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.xz
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_LICENSE = MIT
 XAPP_MKFONTSCALE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
