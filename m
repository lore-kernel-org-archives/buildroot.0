Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF701C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 837764E804;
	Mon, 20 Feb 2023 21:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 837764E804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id miTKSmOzODeC; Mon, 20 Feb 2023 21:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 535BE4EB76;
	Mon, 20 Feb 2023 21:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 535BE4EB76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8931BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2325C415C5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2325C415C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXL7s8cn5FcB for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41544415BE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41544415BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A2C686494; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f28be9b1fd93a3852d4db00041588d52e171638f
X-Git-Newrev: 51818b18b9a1fe1a5e0b31298f86cb80309ae9ab
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.2A2C686494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xsetroot:
 bump version to 1.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=51818b18b9a1fe1a5e0b31298f86cb80309ae9ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003240.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xsetroot/xapp_xsetroot.hash | 8 +++-----
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
index 32294c1f3d..43f7cd66d0 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002874.html
-md5  5fe769c8777a6e873ed1305e4ce2c353  xsetroot-1.1.2.tar.bz2
-sha1  42ab81761823b44974feab86477007c49dbace50  xsetroot-1.1.2.tar.bz2
-sha256  10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c  xsetroot-1.1.2.tar.bz2
-sha512  0b9df1b72305e5c24f1e1664578aa4411a5ffcdc5d318458117594e641f01c34700205b0d16c08abf4a8106d36128ccdbe1ea1f1035fce9018d6b52801a8b72b  xsetroot-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003240.html
+sha256  6081b45a9eb4426e045d259d1e144b32417fb635e5b96aa90647365ac96638d1  xsetroot-1.1.3.tar.xz
+sha512  f333d1bfd92bb943044da36331ae2cf68a811c8f3891719d9ebc1749e2dd0c67068f86face0794c3c4ae584c4dd189bad4998dccb38fe1ac37a8921e5713e7c0  xsetroot-1.1.3.tar.xz
 # Locally computed
 sha256  48e9c9572e0dc1c14b93b753542f780e7751dd7f035816374d8a8be0211a4520  COPYING
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 98ba344cfa..1ffbb2b6b0 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XSETROOT_VERSION = 1.1.2
-XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
-XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSETROOT_VERSION = 1.1.3
+XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.xz
+XAPP_XSETROOT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XSETROOT_LICENSE = MIT
 XAPP_XSETROOT_LICENSE_FILES = COPYING
 XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXcursor xdata_xbitmaps
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
