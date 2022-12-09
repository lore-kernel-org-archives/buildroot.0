Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00D8C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9843E43FF2;
	Mon, 20 Feb 2023 21:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9843E43FF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BhIkNOzQ9Cby; Mon, 20 Feb 2023 21:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4242643C4C;
	Mon, 20 Feb 2023 21:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4242643C4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DCD11BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8E0A40C42
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8E0A40C42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N39tAwD-JRkc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E66A9415AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E66A9415AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E338A828C8; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4df6b365b77c3838858b43c201f0e2af4db7a498
X-Git-Newrev: 7f08e0d7def20cc04ad39b952bcfffd91ceda13d
X-Patchwork-Hint: ignore
Message-Id: <20230220205156.E338A828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xvinfo:
 bump version to 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f08e0d7def20cc04ad39b952bcfffd91ceda13d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003273.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xvinfo/xapp_xvinfo.hash | 8 +++-----
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
index 3d8ace9ae5..7dd5820c08 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002955.html
-md5  b13afec137b9b331814a9824ab03ec80  xvinfo-1.1.4.tar.bz2
-sha1  136a70a72b23c81f4fe8f4c8cb7073316be16b44  xvinfo-1.1.4.tar.bz2
-sha256  0353220d6606077ba42363db65f50410759f9815352f77adc799e2adfa76e73f  xvinfo-1.1.4.tar.bz2
-sha512  85e1f936c5c826f0fdde3670bd77d5cde8641c6e8e7849e42142e91b5aa01d7e0e60d2b064eb6fef4f5666321813ca2dc9f9656756ccbe6dcda37b119ee8a63e  xvinfo-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003273.html
+sha256  3ede71ecb26d9614ccbc6916720285e95a2c7e0c5e19b8570eaaf72ad7c5c404  xvinfo-1.1.5.tar.xz
+sha512  18467161b248c68f6bde15e1c1b4b8cf812daf46777602558aee5fb7cb4d2649218de88fa93842fea4f316d954440f03a37d71fa4fda92eda3c7d80970e19cbb  xvinfo-1.1.5.tar.xz
 # Locally computed
 sha256  7725b0484faa1832534814ecb577f5a86acc74f1bcce25f92c55dfc1b693717d  COPYING
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 7b3b97f073..6fa392f018 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XVINFO_VERSION = 1.1.4
-XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
-XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XVINFO_VERSION = 1.1.5
+XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.xz
+XAPP_XVINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XVINFO_LICENSE = MIT
 XAPP_XVINFO_LICENSE_FILES = COPYING
 XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
