Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BFEC7EE22
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B584983BD3;
	Sun,  7 May 2023 12:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B584983BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CLUfDE4Thnf; Sun,  7 May 2023 12:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7CD83BB5;
	Sun,  7 May 2023 12:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA7CD83BB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0F311BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B282821C8
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B282821C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YP8C-A6iDFCX for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B9F382182
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B9F382182
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59C4A85EF0; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:10:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e07901f5e74c0d97a98a69dae4aad5014bb6983b
X-Git-Newrev: e45fb0242496ed4d5bb43108c8bac0ba01af2fff
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.59C4A85EF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXi: bump version to
 1.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e45fb0242496ed4d5bb43108c8bac0ba01af2fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-May/003390.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 6 +++---
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index a86ef13225..545d4881f6 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-September/003109.html
-sha256  2ed181446a61c7337576467870bc5336fc9e222a281122d96c4d39a3298bba00  libXi-1.8.tar.bz2
-sha512  4b2c667a8466eb389f253d77285c3f506c4a2b6c75054c722974a864565d565cc0c5701f8ea773eb929ceb94adfeb737ecd7a0bfc2c240157416a5f343c07aba  libXi-1.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-May/003390.html
+sha256  89bfc0e814f288f784202e6e5f9b362b788ccecdeb078670145eacd8749656a7  libXi-1.8.1.tar.xz
+sha512  a30b1a07e6d710f5196e7477415d68074736f89d954e8f2d5ccc9b5f349e7d1d440c90fb512508176b5db5ecad55608cfb540872936b731963fd83343db3a0b9  libXi-1.8.1.tar.xz
 # Locally computed
 sha256  9392174bc86e291369fd2f61f3ed325962735a5f5c585ce8d7ebd365e2a5639f  COPYING
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index b4802cf018..6ae5ec8be8 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.8
-XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
-XLIB_LIBXI_SITE = https://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXI_VERSION = 1.8.1
+XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.xz
+XLIB_LIBXI_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXI_LICENSE = MIT
 XLIB_LIBXI_LICENSE_FILES = COPYING
 XLIB_LIBXI_CPE_ID_VENDOR = x.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
