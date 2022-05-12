Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15D1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A070B823E0;
	Thu, 12 May 2022 18:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qd85oGG6Vp2d; Thu, 12 May 2022 18:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A220881303;
	Thu, 12 May 2022 18:59:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DEB91BF578
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F6C60806
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id famzQGTxdSuB for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:54:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A79360AC9
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:54:02 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 6973319775
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:54:00 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwj-0Fmf3v0; Thu, 12 May 2022 20:53:57 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwj-0004aZ-0D
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:57 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:53 +0200
Message-Id: <20220512185355.873825-23-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381637-0000F5B3-663B6AD3/0/0 CLEAN NORMAL
X-TOI-MSGID: e22b02ad-5aaa-46fc-b76c-054169713c8f
Subject: [Buildroot] [PATCH 23/25] package/x11r7/xapp_bitmap: bump version
 to 1.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003162.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_bitmap/xapp_bitmap.hash | 10 ++++------
 package/x11r7/xapp_bitmap/xapp_bitmap.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.hash b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
index f632bce3c5..8953bfc5f7 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.hash
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002941.html
-md5 b94172053ffa282bd88274f1e6a677f1  bitmap-1.0.9.tar.bz2
-sha1 26ba3130b14a2db81b427f2353ac21301c5d2527  bitmap-1.0.9.tar.bz2
-sha256 e0f3afad5272d796f54c33fa1b5bd1fb3f62843a54b28c87196d06a35123e5f5  bitmap-1.0.9.tar.bz2
-sha512 873c626c72a0f4025fe8c8aeedbf3fe4ee5657fb487ad7410406a20da518c0358041dc45c2549926cc10e1d031977073b9d1ddb32830fdce95b716a52fe44456  bitmap-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003162.html
+sha256  8e86879c2feeece3f10e189330479cf51da0dd268355d1e3ee8a8497ab833690  bitmap-1.1.0.tar.xz
+sha512  3d6c94675f10772daeb71598c3e0ddcb51569b1bfc4771159e9df89599bfeb8bf49f464c24fef54d30a8f737af32136f859f844be03e088d24ed962f88381193  bitmap-1.1.0.tar.xz
 # Locally computed
-sha256 03be44611edac06827bd13c0815a67ecd37ffe8fb1b9e210d6545d79bec89a3a  COPYING
+sha256  03be44611edac06827bd13c0815a67ecd37ffe8fb1b9e210d6545d79bec89a3a  COPYING
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 6bc0dbde0d..ccc438560d 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_BITMAP_VERSION = 1.0.9
-XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
+XAPP_BITMAP_VERSION = 1.1.0
+XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.xz
 XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BITMAP_LICENSE = MIT
 XAPP_BITMAP_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
