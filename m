Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FC0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7148A40209;
	Thu, 12 May 2022 19:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LY3QXgZaMcBq; Thu, 12 May 2022 19:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E5C401D9;
	Thu, 12 May 2022 19:57:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D85C1BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 060534039D
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIv6orr7so1S for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2515D40242
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6960A85C6F; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:50:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b6865ab4d33f87da27c2d20669165b19434ba55
X-Git-Newrev: e4dd2c5e3bb68ecbf1c5fadcee403ad8e79b01a5
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.6960A85C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libX11: bump version to
 1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4dd2c5e3bb68ecbf1c5fadcee403ad8e79b01a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003161.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 7 +++----
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 126be07f03..8073888436 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-December/003121.html
-sha256  2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4b60989  libX11-1.7.3.1.tar.xz
-sha512  a2620076db4bf35ab94706c8ab714e9c3fecbdd533cf99cdffeabaf49a1a1d30a233eb2dc76da51b01d50c43f11780aa3b2936668d982a33fa7d5008be44e25b  libX11-1.7.3.1.tar.xz
-
+# From https://lists.x.org/archives/xorg-announce/2022-April/003161.html
+sha256  081bf42ebab023aa92cfdb20c7af8c5ae13d13e88a5e22f90f4453ef80bbdde4  libX11-1.8.tar.xz
+sha512  64899ba9efbda00211daf08534a2a98eba86bb377980d21ce319106075cd36b511b17245d02e8ebd1045e7c2147f2c005004bcf579121138be7a7b879eeca83b  libX11-1.8.tar.xz
 # Locally computed
 sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index a8dc7f3668..44ab866596 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.7.3.1
+XLIB_LIBX11_VERSION = 1.8
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
