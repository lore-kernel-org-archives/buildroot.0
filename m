Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54B3C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8698E4172F;
	Mon, 20 Feb 2023 21:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8698E4172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Her8Dw53aIaI; Mon, 20 Feb 2023 21:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41CBC4AF73;
	Mon, 20 Feb 2023 21:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41CBC4AF73
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F73B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99035415AB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99035415AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3-bBW13UD80 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D166C415A0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D166C415A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC56286494; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bac3d21a3fb3ef872b538adda01725c2fb77dd75
X-Git-Newrev: d39f7ecd4938158183adfc13147a9d3b61c85a8e
X-Patchwork-Hint: ignore
Message-Id: <20230220205156.CC56286494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xlib_libXcomposite: bump version to 0.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=d39f7ecd4938158183adfc13147a9d3b61c85a8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003276.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash | 8 +++-----
 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
index 5d4575b5ab..62b5ea9276 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002971.html
-md5  3fa0841ea89024719b20cd702a9b54e0  libXcomposite-0.4.5.tar.bz2
-sha1  902631efb55a798c81086e5ff90b60349839db40  libXcomposite-0.4.5.tar.bz2
-sha256  b3218a2c15bab8035d16810df5b8251ffc7132ff3aa70651a1fba0bfe9634e8f  libXcomposite-0.4.5.tar.bz2
-sha512  502fd51fd9097bb3ca72174ac5b25b9d3b1ff240d32c4765199df03d89337d94b4ddea49e90b177b370862430089d966ce9c38988337156352cfeae911c2d3d5  libXcomposite-0.4.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003276.html
+sha256  fe40bcf0ae1a09070eba24088a5eb9810efe57453779ec1e20a55080c6dc2c87  libXcomposite-0.4.6.tar.xz
+sha512  f35a0da8f9f22fd788eee01209557fe3a1b1abdc9744f76330ba42b21b6e3af5464ca4451c33415856417c30da5aa5624e3707980c644327249bfeda5a62a59b  libXcomposite-0.4.6.tar.xz
 # Locally computed
 sha256  efa0219ed8485ac555c1a3fb82daf34539b2e0dcf4dadc99c01f1e39c69a4a68  COPYING
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index 80e94fe37c..c296ee6c6c 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXCOMPOSITE_VERSION = 0.4.5
-XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.bz2
-XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCOMPOSITE_VERSION = 0.4.6
+XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.xz
+XLIB_LIBXCOMPOSITE_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXCOMPOSITE_LICENSE = MIT
 XLIB_LIBXCOMPOSITE_LICENSE_FILES = COPYING
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
