Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4991CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0726360BEE;
	Thu, 12 May 2022 19:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2yHLfglUeyg; Thu, 12 May 2022 19:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2AE360BB3;
	Thu, 12 May 2022 19:55:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 152E01BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDF0F60B26
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPBYU9m4kY9X for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 032E760B30
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 466D985C6F; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d18367c6ce1758d74b1c54332f3bd598d9c911c
X-Git-Newrev: 171ac077dc5633ecadf40383dcffafd4e06ed093
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.466D985C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-dummy:
 bump version to 0.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=171ac077dc5633ecadf40383dcffafd4e06ed093
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003155.html

Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash   | 7 ++++---
 package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
index 3eac3840ef..eed28d3fde 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-December/002751.html
-sha256 3712bb869307233491e4c570732d6073c0dc3d99adfdb9977396a3fdf84e95b9  xf86-video-dummy-0.3.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003155.html
+sha256  e78ceae5c8c0588c7cb658f2afc3a9fac9ef665b52a75b01f8e9c5449a4e1e5a  xf86-video-dummy-0.4.0.tar.xz
+sha512  1150a84c4f17215b9c579d8ce9399d547a01970bf7b5396653f14beb13a62deefe3008bf3ad6a2c5c0f46da4cbc0b840c18a7dff339e3b882d108183fa1d30d9  xf86-video-dummy-0.4.0.tar.xz
 # Locally calculated
-sha256 e29aa81e74563d14e5633963107c030e74e8352ea7dafee1a9d7e19b7d0e887b  COPYING
+sha256  e29aa81e74563d14e5633963107c030e74e8352ea7dafee1a9d7e19b7d0e887b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 3127f6cb1b..e863b1e506 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.8
-XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.4.0
+XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_DUMMY_LICENSE = MIT
 XDRIVER_XF86_VIDEO_DUMMY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
