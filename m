Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144C6C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB67C82119;
	Fri,  9 Dec 2022 17:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB67C82119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjMGZds5tIBy; Fri,  9 Dec 2022 17:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22296820FD;
	Fri,  9 Dec 2022 17:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22296820FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B749C1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 932FB41A6F
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 932FB41A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mXZs-xBKoDeO for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07A0541B49
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A0541B49
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB6C585EA1; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2745a3b89ccc74f5d15ff812feb0b62da860e12
X-Git-Newrev: 2f7d13d9588cf3632a7c73bd81dddb52a4263309
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.EB6C585EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXft: bump version to
 2.3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f7d13d9588cf3632a7c73bd81dddb52a4263309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-September/003211.html
https://lists.x.org/archives/xorg-announce/2022-September/003209.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXft/xlib_libXft.hash | 6 +++---
 package/x11r7/xlib_libXft/xlib_libXft.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.hash b/package/x11r7/xlib_libXft/xlib_libXft.hash
index 8743a9b7d1..484764be3d 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.hash
+++ b/package/x11r7/xlib_libXft/xlib_libXft.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-August/003104.html
-sha256  57dedaab20914002146bdae0cb0c769ba3f75214c4c91bd2613d6ef79fc9abdd  libXft-2.3.4.tar.bz2
-sha512  5bb019750982ed4643880efd7368bc226ad49cfa8c0c8c6d4614dfeed74f588c65e1ba69adcc12284ec07d841e5b58fc1c27f3fddf83fe1a2837b29dd9ecec51  libXft-2.3.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-September/003211.html
+sha256  60a6e7319fc938bbb8d098c9bcc86031cc2327b5d086d3335fc5c76323c03022  libXft-2.3.6.tar.xz
+sha512  732f8c635fcac6010012ba8c10c23d2dd6ec79b0f096d6bcc9b7e36d2ca0817387faa7ee5bb6f43cff02adc68e4234c1b8f95021ebc548f61c492e0b76836d90  libXft-2.3.6.tar.xz
 # Locally computed
 sha256  7cda22286b1379b9b73df695f72cbad36595e65b039a5fbc5c89b69ecc44438c  COPYING
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index b1640a6613..a86501900c 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXFT_VERSION = 2.3.4
-XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
+XLIB_LIBXFT_VERSION = 2.3.6
+XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.xz
 XLIB_LIBXFT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFT_LICENSE = MIT
 XLIB_LIBXFT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
