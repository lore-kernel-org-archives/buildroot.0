Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AC6EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B27924150C;
	Sun, 25 Jun 2023 15:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B27924150C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dMduTMtR4MT; Sun, 25 Jun 2023 15:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C2E5415F1;
	Sun, 25 Jun 2023 15:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C2E5415F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03D621BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E28B409A1
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E28B409A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FS9tVQmBuenk for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C72FA40998
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C72FA40998
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3DBA84AD3; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:40:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db45cc593e66598b4d345dd348b0bfe2b388b557
X-Git-Newrev: 6f722cf6dbbf23850da7b10e1d94e156ff5419d7
X-Patchwork-Hint: ignore
Message-Id: <20230625150109.B3DBA84AD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-i128:
 bump version to 1.4.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6f722cf6dbbf23850da7b10e1d94e156ff5419d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-May/003395.html

Switched tarball to xz and _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash    | 8 +++-----
 package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk  | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
index 96bd42ac36..c17d3086a1 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-December/002932.html
-md5  a980f1b8532ccfe81932580bc4e0f2a0  xf86-video-i128-1.4.0.tar.bz2
-sha1  56d5b897b2695222c13e59d2ade74620a99e1011  xf86-video-i128-1.4.0.tar.bz2
-sha256  8f2c0a6bf5a169dad3fc07c6dd4537b492d0e44489e4a1297311e617c3bed0ea  xf86-video-i128-1.4.0.tar.bz2
-sha512  d58baee3f20b3ad2ece6853da0ff20a6d54b984c6e3289bad2715cc003b277a0b44d20ded25cfc116400468df552390bdb5d80fbd3fb60861488ee5d027664b2  xf86-video-i128-1.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-May/003395.html
+sha256  7064b513ffe33efa040577c4d355ce2c76ed218989ab38feb8972750d5acbc46  xf86-video-i128-1.4.1.tar.xz
+sha512  ec6b4dd9092292b5aabff7cf477090fe62c89944d251689817ac8114a65672f85880b719a442f4c742d63dc2d6c61ec315e53da5b5c625074d1aa0b9ace8e865  xf86-video-i128-1.4.1.tar.xz
 # Locally computed
 sha256  7677424d79633dbf255a81bd4e05dd621931b89997af33c31522269ec2ed391e  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index e44deaf621..266678105c 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_I128_VERSION = 1.4.0
-XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_I128_VERSION = 1.4.1
+XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_I128_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_I128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_I128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
