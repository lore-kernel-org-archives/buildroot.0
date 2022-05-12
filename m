Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A2DC433FE
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A94B341719;
	Thu, 12 May 2022 19:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1fpMZPgFck3; Thu, 12 May 2022 19:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CE3341710;
	Thu, 12 May 2022 19:56:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD971BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 024D340393
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtHTJt0nyPsN for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE4EF4039D
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3D52685C6F; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57e517a2940a671fc9d45842493e0ba51a6fd164
X-Git-Newrev: 6d18367c6ce1758d74b1c54332f3bd598d9c911c
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.3D52685C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xsm: bump version to
 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d18367c6ce1758d74b1c54332f3bd598d9c911c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003152.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xsm/-/commit/e552f2d4980d41d7a219dbe0c5dbaf33c4d752f3

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xsm/xapp_xsm.hash | 10 ++++------
 package/x11r7/xapp_xsm/xapp_xsm.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xsm/xapp_xsm.hash b/package/x11r7/xapp_xsm/xapp_xsm.hash
index eda231fe93..9568836bbc 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.hash
+++ b/package/x11r7/xapp_xsm/xapp_xsm.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002875.html
-md5 bd32c14f09d58f46084b6a8f20e6e8f1  xsm-1.0.4.tar.bz2
-sha1 dd41234e276fe8b2d0a853879568f73b6d98812a  xsm-1.0.4.tar.bz2
-sha256 9934b6893a4e52cf7435368fc8d425c371b5e32d96e420ead30166eb82d64425  xsm-1.0.4.tar.bz2
-sha512 d4e4da7c309a4eae126d2b58a13684f4dbc06b09f76dde9c89c707375df2843614f3d83bc44f9cd02f239200db3397abd86796dca0dbafc69f60482b0af5a176  xsm-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003152.html
+sha256  9c30fdaa3fc132e4ff201cfc478669056e6e15502e77df88df11fb94e4e6fb2d  xsm-1.0.5.tar.xz
+sha512  df3777b3aab813ec8aa906f5a03f93b8ca645978970290cf7baf732e175c36c00ae19baeb45ea7404d35838c21e6f8fca28f0da3e2f398d17adac5f2acb7b351  xsm-1.0.5.tar.xz
 # Locally computed
-sha256 27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff COPYING
+sha256  5531d18cfcc944dab39991f63f182cbbce3fe493ba0c7cf08a25c0d01ee84482  COPYING
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index 6d752b4d15..1c73f5c65c 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XSM_VERSION = 1.0.4
-XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
+XAPP_XSM_VERSION = 1.0.5
+XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.xz
 XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSM_LICENSE = MIT
 XAPP_XSM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
