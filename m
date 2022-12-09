Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B760C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304AB41A67;
	Fri,  9 Dec 2022 17:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304AB41A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dv3UxgmIZ7fy; Fri,  9 Dec 2022 17:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 266F041B6A;
	Fri,  9 Dec 2022 17:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 266F041B6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC2E1BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B98841A60
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B98841A60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8mRvrsdTKXP for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B8F441B36
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B8F441B36
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 097C585EA6; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:33:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bf8f441d10848bddd47b9b0c84575177db2b4af
X-Git-Newrev: b97079d921d8e62ce73d08e11069f5c04734e048
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.097C585EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXinerama: bump
 version to 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b97079d921d8e62ce73d08e11069f5c04734e048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003244.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXinerama/xlib_libXinerama.hash | 8 +++-----
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash b/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
index ca4081d375..e3ac880b39 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-July/002905.html
-md5  0d5f826a197dae74da67af4a9ef35885  libXinerama-1.1.4.tar.bz2
-sha1  34a1d9908ffbd46805d2357c6b05f5e341a8dc7c  libXinerama-1.1.4.tar.bz2
-sha256  0008dbd7ecf717e1e507eed1856ab0d9cf946d03201b85d5dcf61489bb02d720  libXinerama-1.1.4.tar.bz2
-sha512  cff777ad942614fbf6bc6d8529f399e62debf3ecbf6cc0694a94e38c022bf929ffd5636fb59f55533c394d89b23af3ea51fa5128927f12a85787e16239330f14  libXinerama-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003244.html
+sha256  5094d1f0fcc1828cb1696d0d39d9e866ae32520c54d01f618f1a3c1e30c2085c  libXinerama-1.1.5.tar.xz
+sha512  735b5320de4782005b379e409bf2f976131c17d496b297d33a0e127ca1443034778586b6b25c077b2ad73a4ab34d440d7510475e0041f38202bb40f15fb08ff7  libXinerama-1.1.5.tar.xz
 # Locally computed
 sha256  f661fd883b6e980b3b118e0fbe230fbf10eef8d4d4a35931355f29ed647ddbe3  COPYING
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index 48e32d55e2..67e3398c71 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXINERAMA_VERSION = 1.1.4
-XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
-XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXINERAMA_VERSION = 1.1.5
+XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.xz
+XLIB_LIBXINERAMA_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXINERAMA_LICENSE = MIT
 XLIB_LIBXINERAMA_LICENSE_FILES = COPYING
 XLIB_LIBXINERAMA_CPE_ID_VENDOR = x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
