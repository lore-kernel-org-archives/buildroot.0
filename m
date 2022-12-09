Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD25DC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6607482127;
	Fri,  9 Dec 2022 17:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6607482127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0wKGv3oZ2Md; Fri,  9 Dec 2022 17:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870F082137;
	Fri,  9 Dec 2022 17:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 870F082137
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEDBE1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0236E41A53
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0236E41A53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AoQ0n2M3s_bY for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DAB841A59
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DAB841A59
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A2E085EA1; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6e3bcfb376b59a2503f111b6339202752b794c9
X-Git-Newrev: bc8b91fdadd8abf22035c127bcd2bbb5961cf43e
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.0A2E085EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXv: bump version to
 1.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc8b91fdadd8abf22035c127bcd2bbb5961cf43e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003280.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXv/xlib_libXv.hash | 6 +++---
 package/x11r7/xlib_libXv/xlib_libXv.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.hash b/package/x11r7/xlib_libXv/xlib_libXv.hash
index a6f7e3d55c..0852f27f8b 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.hash
+++ b/package/x11r7/xlib_libXv/xlib_libXv.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002727.html
-sha256  d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4ff2a88db60cb0b088  libXv-1.0.11.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-December/003280.html
+sha256  aaf7fa09f689f7a2000fe493c0d64d1487a1210db154053e9e2336b860c63848  libXv-1.0.12.tar.xz
+sha512  bdd00de1ce6a8911056181ab4de32f9e319a68567389162d4bc2e3c9946d5f3c60f87eb6c53f74c9b6a342255e591d5fef4a445a4ac8ca3c1b6fe87d42c51c1e  libXv-1.0.12.tar.xz
 # Locally calculated
 sha256  4fac4d581d00f11c459d68b7cb970f3d4e5a5bbfb53784d85f59a90076280301  COPYING
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 1105b5925d..808b1e6e7b 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXV_VERSION = 1.0.11
-XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
+XLIB_LIBXV_VERSION = 1.0.12
+XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.xz
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXV_LICENSE = ISC-like
 XLIB_LIBXV_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
