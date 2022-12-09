Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C72EC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A50A4A5F2;
	Mon, 20 Feb 2023 21:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A50A4A5F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwG-4IbUMrPM; Mon, 20 Feb 2023 21:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2240D4C65F;
	Mon, 20 Feb 2023 21:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2240D4C65F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 382581BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3839F40C03
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3839F40C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFwppYvRZJPr for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68055415B6
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68055415B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5826B86495; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 42c8fe191473193c0854bd8a641c046d4f149a97
X-Git-Newrev: 9e1546672ce900d82a39f991237246a201874d47
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.5826B86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xcursorgen:
 bump version to 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e1546672ce900d82a39f991237246a201874d47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003264.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash | 8 +++-----
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
index 2f64671434..45bff55ed2 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-January/002936.html
-md5  25cc7ca1ce5dcbb61c2b471c55e686b5  xcursorgen-1.0.7.tar.bz2
-sha1  109367eb23b0ad52cf5de15f50c02ebe872698ae  xcursorgen-1.0.7.tar.bz2
-sha256  35b6f844b24f1776e9006c880a745728800764dbe3b327a128772b4610d8eb3d  xcursorgen-1.0.7.tar.bz2
-sha512  bd13ad23691d3daa2d5dcdc5902cf62e3dcb97a0289aff362e6cd85866a1d8cafb64f98800a75bfb4cf1f3c76244ca20201847dff594543d136d0abaec7011d2  xcursorgen-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003264.html
+sha256  32b33ce27b4e285e64ff375731806bb7988cc626ff10915c65f1dc4da640cc9b  xcursorgen-1.0.8.tar.xz
+sha512  dede5b9e1e09f9253365bbb83fdab26c681641913f3586cef52d4802db9cecc7e252344911cd969a873c3a5c5ebbd4b862f786de263f92ea1bcb2df90236f9c4  xcursorgen-1.0.8.tar.xz
 # Locally computed
 sha256  8c773336b654442ac8018715a52be1a8254895c57c898d5387016e9488cc2009  COPYING
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index bcc696b01c..318cd562db 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCURSORGEN_VERSION = 1.0.7
-XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
-XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCURSORGEN_VERSION = 1.0.8
+XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.xz
+XAPP_XCURSORGEN_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCURSORGEN_LICENSE = MIT
 XAPP_XCURSORGEN_LICENSE_FILES = COPYING
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
