Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266EFC7EE22
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DE583AE2;
	Sun,  7 May 2023 12:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5DE583AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYASGGJQ4P3K; Sun,  7 May 2023 12:07:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E5B82312;
	Sun,  7 May 2023 12:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E5B82312
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1E441BF2FA
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 851D540535
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 851D540535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Vfb6FKHg8fI for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 565A940286
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 565A940286
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FB0885EEC; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 12:52:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7296a0659bcf5383303774aac02797f94bd564fb
X-Git-Newrev: 1a81a2f28c5e59dadcddefe2c38613ebad5e51c6
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.3FB0885EEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-geode:
 bump version to 2.11.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a81a2f28c5e59dadcddefe2c38613ebad5e51c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-May/003393.html

Fixes:
http://autobuild.buildroot.net/results/d1d/d1dae8c7ba9dc82fbbcc5914ea3b378e48304617/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
