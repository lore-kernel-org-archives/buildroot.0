Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B2EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1382A60B98;
	Thu, 12 May 2022 19:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWN3B8FUPPkq; Thu, 12 May 2022 19:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F0860B2B;
	Thu, 12 May 2022 19:55:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F33A1BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 837B060B25
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xs2tdUqeyU6H for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC4CB60B26
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 194A585C8A; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87794ae497bbf6569e20c7ce13490f3799c3b3d7
X-Git-Newrev: 450d8835d922085aae4af56dad46f7213aaaf73a
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.194A585C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xdm: bump version to
 1.1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=450d8835d922085aae4af56dad46f7213aaaf73a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003148.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xdm/xapp_xdm.hash | 10 ++++------
 package/x11r7/xapp_xdm/xapp_xdm.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xdm/xapp_xdm.hash b/package/x11r7/xapp_xdm/xapp_xdm.hash
index 605be9debc..5ba3a3f062 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.hash
+++ b/package/x11r7/xapp_xdm/xapp_xdm.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002959.html
-md5 47c4c3bf8d59b64b64d134df8b5e5ec5  xdm-1.1.12.tar.bz2
-sha1 5cc5590e40837949b1a63cb030878f8ceebd4d85  xdm-1.1.12.tar.bz2
-sha256 0dd283f72dda098d09e2925b9278c95e21551e693a5802ab442d1b577d8327f4  xdm-1.1.12.tar.bz2
-sha512 1a4be0a070ced5db8fda6fc74794c9f9ed0cb37fa440fda6a3a7652aff62dfc3d7ba68b9facf054671ebf0f4db2a0eec29d0aa3716e3407ccd5529bac3553bdb  xdm-1.1.12.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003148.html
+sha256  e58267e8f1478f2f5cd57cbcf2367a36973860c3131a450a3e0816585af03264  xdm-1.1.13.tar.xz
+sha512  1c7ba51dc8c6989ff6ede3a3abd06e002903609d4ebd31f06ec39fbfee3a80a690c6180f85c3ab135a0de4623261d92a191d1ca5f733cdb3bd2e7e78977b98e5  xdm-1.1.13.tar.xz
 # Locally computed
-sha256 b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
+sha256  b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 3c91e21579..98306f66f5 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XDM_VERSION = 1.1.12
-XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
+XAPP_XDM_VERSION = 1.1.13
+XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.xz
 XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDM_LICENSE = MIT
 XAPP_XDM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
