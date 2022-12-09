Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06364C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAB058188A;
	Fri,  9 Dec 2022 17:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAB058188A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCJj8I3--2o0; Fri,  9 Dec 2022 17:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D38198135D;
	Fri,  9 Dec 2022 17:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D38198135D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 360C21BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E2AA40CE2
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E2AA40CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYtpbeL0hGME for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 028DE41022
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 028DE41022
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00BFB85EA1; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:33:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ded7c84b569bc9b9e8bbbb23c768302098c8cfc
X-Git-Newrev: 8bf8f441d10848bddd47b9b0c84575177db2b4af
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.00BFB85EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_rgb: bump version to
 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bf8f441d10848bddd47b9b0c84575177db2b4af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003245.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_rgb/xapp_rgb.hash | 5 +++--
 package/x11r7/xapp_rgb/xapp_rgb.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_rgb/xapp_rgb.hash b/package/x11r7/xapp_rgb/xapp_rgb.hash
index ce05454ce9..11b2a83905 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.hash
+++ b/package/x11r7/xapp_rgb/xapp_rgb.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-November/002494.html
-sha256  bbca7c6aa59939b9f6a0fb9fff15dfd62176420ffd4ae30c8d92a6a125fbe6b0  rgb-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003245.html
+sha256  fc03d7f56e5b2a617668167f8927948cce54f93097e7ccd9f056077f479ed37b  rgb-1.1.0.tar.xz
+sha512  640888d64b2d328fff4a1652ba1299436e348bc3cbc90710d79c635acfa7f2fce0018adb818123b41ca008197ff1cbf87aab60501de36c163bed2d80d8556008  rgb-1.1.0.tar.xz
 # Locally computed
 sha256  1d08eb3384f5dedc7735bcfae1aa58cb64643ca9389edce3312b1c3cefbfdaa7  COPYING
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index b2d5d77744..4b6399fc76 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_RGB_VERSION = 1.0.6
-XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
-XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_RGB_VERSION = 1.1.0
+XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.xz
+XAPP_RGB_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_RGB_LICENSE = MIT
 XAPP_RGB_LICENSE_FILES = COPYING
 XAPP_RGB_DEPENDENCIES = xorgproto host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
