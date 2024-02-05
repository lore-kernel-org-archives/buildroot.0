Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35209C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B0D4185D;
	Mon,  5 Feb 2024 14:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B0D4185D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjhKFz1i2uRR; Mon,  5 Feb 2024 14:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7FD7417DC;
	Mon,  5 Feb 2024 14:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7FD7417DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB03F1BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 959F260F0C
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 959F260F0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMD_rsq0VpXN for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:54:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6E9D60E6B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E9D60E6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B325986CCC; Mon,  5 Feb 2024 14:54:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 15:51:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc3609c53f927289a9681f30ab283d190cb34e09
X-Git-Newrev: a917500442b62441c88ff3f7ab84e6a230d6bc69
X-Patchwork-Hint: ignore
Message-Id: <20240205145446.B325986CCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libevdev: bump to version 1.13.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a917500442b62441c88ff3f7ab84e6a230d6bc69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libevdev/libevdev.hash | 6 +++---
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index dd76e158ef..acaedfad56 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/input-tools/2022-March/001574.html
-sha256  1dbba41bc516d3ca7abc0da5b862efe3ea8a7018fa6e9b97ce9d39401b22426c  libevdev-1.12.1.tar.xz
-sha512  eefce287a665e4f89eb2e0437dfefd45ecf8925c7dac35a1bdd46158541f77f2032c6146900a30a01321751d55a9b537bd1d61777cca9cfa02c39a6e31c97be4  libevdev-1.12.1.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2023-May/001585.html
+sha256  06a77bf2ac5c993305882bc1641017f5bec1592d6d1b64787bad492ab34f2f36  libevdev-1.13.1.tar.xz
+sha512  9b75bad4bc13948854c8dff7a7a46aca6c06d1410ccb000f881bf76055ccac040595c3b24fb1a574be875b5c262eb86820b9ec3383752641bc2047135e5a412f  libevdev-1.13.1.tar.xz
 
 # Hash for license files:
 sha256  6f13de7ce28e4948ba95170e0723ee1254c1978ce1f127af82aeca597b567cb9  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 726a5afcee..b0cf6c9ba8 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.12.1
+LIBEVDEV_VERSION = 1.13.1
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
