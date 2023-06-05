Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CFDC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A31C60F62;
	Mon,  5 Jun 2023 11:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A31C60F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkDhZwChSgB2; Mon,  5 Jun 2023 11:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C9D660F9D;
	Mon,  5 Jun 2023 11:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C9D660F9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6C81BF95E
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E483E417AB
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E483E417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmkOE4DDliq2 for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC19341794
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC19341794
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3EBC86C77; Mon,  5 Jun 2023 11:45:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:03:05 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 791ad4cc89d489ed6d9b70834a4cc679398c853d
X-Git-Newrev: d1bd45fdcd2e04af4715d67418dfbb372b0e9e0f
X-Patchwork-Hint: ignore
Message-Id: <20230605114518.A3EBC86C77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/x11r7/xdriver_xf86-video-geode: bump version to 2.11.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1bd45fdcd2e04af4715d67418dfbb372b0e9e0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-May/003393.html

Fixes:
http://autobuild.buildroot.net/results/d1d/d1dae8c7ba9dc82fbbcc5914ea3b378e48304617/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1a81a2f28c5e59dadcddefe2c38613ebad5e51c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash    | 4 +++-
 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk  | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
index 7a66c28b52..7dcb99fe2a 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
@@ -1,3 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2023-May/003393.html
+sha256  8256ac3f14117324d00b7bfa8053645ca92562fe837c542489a502adbb5f9f1e  xf86-video-geode-2.11.21.tar.xz
+sha512  e12f74268ab7d16b57644a9465b4be1ca28d250625a31b8810e19a1f94a17e47e0a258455155fd8f336fa59fd78160cdf3763aa94b85c6ccc2c42edf3b65bc61  xf86-video-geode-2.11.21.tar.xz
 # Locally calculated
-sha256  f497d0bfb09f36c72e3467e2d701f57f6b03ab8992c5d570e66582f714f84d64  xf86-video-geode-2.11.20.tar.bz2
 sha256  3994ef7cee54f0935a4b57b1c34efd904da567931dd9e1a2d9390d22c8332ea2  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index dbeae1aa65..8f84e4863f 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.20
-XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.21
+XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_GEODE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_GEODE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
