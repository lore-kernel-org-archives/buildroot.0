Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D011FC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B50760FD8;
	Mon,  5 Jun 2023 11:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B50760FD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_wIT5ZP5kZF; Mon,  5 Jun 2023 11:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91FC260D4D;
	Mon,  5 Jun 2023 11:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91FC260D4D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF3F51BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C47060BF2
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C47060BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATB6XBRNV0Tn for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66DB960D4C
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66DB960D4C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 576A186C79; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:18:25 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 221b7b045ee6b7a294f3bb35a29cc3ab4736451f
X-Git-Newrev: cf6733b7943347fde134cc2e3d6836d481e813a4
X-Patchwork-Hint: ignore
Message-Id: <20230605114519.576A186C79@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/x11r7/xdata_xcursor-themes: bump version to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf6733b7943347fde134cc2e3d6836d481e813a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003332.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 58035c687aa9128408e6519857a8b6a8c64ae6e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash | 8 +++-----
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
index 2b88f567a0..1bb3831c91 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002945.html
-md5  aea14eabf40528ec4db18f1cfcf5c458  xcursor-themes-1.0.6.tar.bz2
-sha1  b56fd5bf5b1ada0532a85c27db0d296e392168c5  xcursor-themes-1.0.6.tar.bz2
-sha256  ee1ec574741293abcf66ac14ce7e74add7ac6be7deb8b38179ef010d22354999  xcursor-themes-1.0.6.tar.bz2
-sha512  2ad3586a5571a5ddc0001187362b54b839644916164834213af98e58698044aec4392dd6e1e42f1794fda85c8fedf259b09214a9636bd0e71a1629c710f198d3  xcursor-themes-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003332.html
+sha256  95bae8f48823d894a05bf42dfbf453674ab7dbdeb11e2bc079e8525ad47378c8  xcursor-themes-1.0.7.tar.xz
+sha512  910925dd17c576028ae0d9dfe5683888648b941806b53cd9ff74ed18ff2de537664b07ab4c647a55290aeba37f6051f322b29e8ecd54f348e32abe2ccea1c902  xcursor-themes-1.0.7.tar.xz
 # Locally computed
 sha256  e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6  COPYING
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index c3c5f388e9..e5bf1e502f 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDATA_XCURSOR_THEMES_VERSION = 1.0.6
-XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
-XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
+XDATA_XCURSOR_THEMES_VERSION = 1.0.7
+XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.xz
+XDATA_XCURSOR_THEMES_SITE = https://xorg.freedesktop.org/archive/individual/data
 XDATA_XCURSOR_THEMES_LICENSE = MIT
 XDATA_XCURSOR_THEMES_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
