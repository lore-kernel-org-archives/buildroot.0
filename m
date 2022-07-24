Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FC1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AF383F4F;
	Sun, 24 Jul 2022 19:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5AF383F4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6bUtgghr3JV; Sun, 24 Jul 2022 19:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B623183EB6;
	Sun, 24 Jul 2022 19:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B623183EB6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3581BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D607340C65
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D607340C65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvFtcj7YBzoo for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14CBD404C4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14CBD404C4
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 54E1D85CC6; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db4b759dfc3a9f404861e112f216e30ff65ba9d9
X-Git-Newrev: f88469885fca0353db6387acfbf6405b1cd3cde9
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.54E1D85CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbutils: bump version
 to 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=f88469885fca0353db6387acfbf6405b1cd3cde9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xkbutils/xapp_xkbutils.hash | 5 +++--
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash b/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
index 2f8dbc7c1e..95287956a8 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-February/002162.html
-sha256  d2a18ab90275e8bca028773c44264d2266dab70853db4321bdbc18da75148130  xkbutils-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003186.html
+sha256  f6a4a8e9c54582beb3787b1faa8168caab125c1fee0ca9cfa5b6c9c1df25eea4  xkbutils-1.0.5.tar.xz
+sha512  0d8d460f5e015e9034292688437511068dab61216c2493f2981cfb63aaa012976ac9435c1586a22c0940fbfcb779b48dce9b85832303fe2b854aa945b814ac77  xkbutils-1.0.5.tar.xz
 # Locally computed
 sha256  3d67b53c085de6d475705b60855b9277afac5d4c4ec531d0ffd1ef0d00571594  COPYING
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 96ca8a4093..90501908e6 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKBUTILS_VERSION = 1.0.4
-XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
-XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBUTILS_VERSION = 1.0.5
+XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.xz
+XAPP_XKBUTILS_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_LICENSE = MIT
 XAPP_XKBUTILS_LICENSE_FILES = COPYING
 XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
