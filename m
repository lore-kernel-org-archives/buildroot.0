Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED5C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380D14A262;
	Mon, 20 Feb 2023 21:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380D14A262
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXk_oMpiWK6U; Mon, 20 Feb 2023 21:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7924EC0C;
	Mon, 20 Feb 2023 21:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD7924EC0C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3B061BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14B2F4169C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14B2F4169C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aah3GEylD8RW for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4450C415B5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4450C415B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4202C86495; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 445abe597ccb099660da911fa8fe1ab29b47e986
X-Git-Newrev: 74440b3cd2bf5cdaf06753d53a471bb5f2c288c4
X-Patchwork-Hint: ignore
Message-Id: <20230220205159.4202C86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_ico: bump
 version to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=74440b3cd2bf5cdaf06753d53a471bb5f2c288c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-August/003205.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_ico/xapp_ico.hash | 8 +++-----
 package/x11r7/xapp_ico/xapp_ico.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_ico/xapp_ico.hash b/package/x11r7/xapp_ico/xapp_ico.hash
index a0970cd507..0258537fd5 100644
--- a/package/x11r7/xapp_ico/xapp_ico.hash
+++ b/package/x11r7/xapp_ico/xapp_ico.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002880.html
-md5  7895f2d109f4206b6d2db37257e07d12  ico-1.0.5.tar.bz2
-sha1  8759ec954375f3a1b37dc920a12790bfbfb0cad3  ico-1.0.5.tar.bz2
-sha256  d73b62f29eb98d850f16b76d759395180b860b613fbe1686b18eee99a6e3773f  ico-1.0.5.tar.bz2
-sha512  93a94a66d4a41b39d4b3657050e58f8269d352dae5d5916c9ecdda1cb14f23b9d159d67c50fdfa654b4b1c2ad11434bed140ace70703c82b05d3fe8686aab8f6  ico-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003205.html
+sha256  38f369d431e753280fde70fa489cc94ce204f9f8eabd2f49fc7d32afa69f4405  ico-1.0.6.tar.xz
+sha512  0ada451b8026ea10d1a5633f847b7bf833292e4cd01e3f1079d82c91fd142c06c6c4005b7146900ee34ac7acc8fd981db37ada9052dff49c2cfce995b9146c8c  ico-1.0.6.tar.xz
 # Locally computed
 sha256  97ef3a622f2f385cabfc8ab7aff13dc46468c10a5520670b5edfa33f2c3999eb  COPYING
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 8b0d4f90f3..56dbd64b38 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_ICO_VERSION = 1.0.5
-XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
-XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_ICO_VERSION = 1.0.6
+XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.xz
+XAPP_ICO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_ICO_LICENSE = MIT
 XAPP_ICO_LICENSE_FILES = COPYING
 XAPP_ICO_DEPENDENCIES = xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
