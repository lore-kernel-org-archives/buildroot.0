Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25451C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA13640FFC;
	Fri,  9 Dec 2022 17:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA13640FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcs_dAkxjXZz; Fri,  9 Dec 2022 17:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06CD240492;
	Fri,  9 Dec 2022 17:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06CD240492
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F61D1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D23534102D
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D23534102D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1bGolsdZa7C for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3235941037
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3235941037
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2314085EA1; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74440b3cd2bf5cdaf06753d53a471bb5f2c288c4
X-Git-Newrev: 4649c06bff7e30bdbd7a3ebab59c578f09d67172
X-Patchwork-Hint: ignore
Message-Id: <20221209170105.2314085EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont2: bump version
 to 2.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=4649c06bff7e30bdbd7a3ebab59c578f09d67172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-August/003203.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 069f2fc616..f2ae5925f8 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-August/003103.html
-sha256  aa7c6f211cf7215c0ab4819ed893dc98034363d7b930b844bb43603c2e10b53e  libXfont2-2.0.5.tar.bz2
-sha512  64d0635d14676bb645d61932afb177eb3808a46525b26e7ee31abc975eca75207743e85523fdd82b08010ce124eb4802338b508ee7b126875d2a3c12f8ac4faa  libXfont2-2.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003203.html
+sha256  74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4  libXfont2-2.0.6.tar.xz
+sha512  24d6baeef8dc2ca2730925c6b790a97f4a3f46ea7b4d908555e7df29cee6e27b63d638b50c88dd30c853cecff7d9b079402cb617f4498f96410c5770b8815cbd  libXfont2-2.0.6.tar.xz
 # Locally calculated
 sha256  97e413bb4962bbb5773085cd5405502bf1d4eadeaf98ff5be015eacacc840462  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index fb0bba879c..7f90f67046 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.5
-XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.bz2
+XLIB_LIBXFONT2_VERSION = 2.0.6
+XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
 XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
 XLIB_LIBXFONT2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
