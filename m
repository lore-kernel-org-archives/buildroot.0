Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA0CC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 10:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C004027E;
	Sun,  5 Feb 2023 10:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51C004027E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_8rJ1sOMu8p; Sun,  5 Feb 2023 10:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378D4417B9;
	Sun,  5 Feb 2023 10:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 378D4417B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7C0E1BF3BE
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE2A740101
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE2A740101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIJIfXnysZZq for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 10:51:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E967D400AF
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 10:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E967D400AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D25DA83734; Sun,  5 Feb 2023 10:51:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 11:47:25 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 5f496bb8b96938c7c103e52e68bc81425d37f2f1
X-Git-Newrev: 2724f705c3ad766d31551ddcc56b7e73081f6551
X-Patchwork-Hint: ignore
Message-Id: <20230205105119.D25DA83734@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/x11r7/xlib_libXpm: bump version to 3.5.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=2724f705c3ad766d31551ddcc56b7e73081f6551
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

https://lists.x.org/archives/xorg-announce/2022-November/003261.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d2fff78049392f2dae82f5ea9f5a0dbac225f4d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 8 +++-----
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index edfdaab335..9ccfb4c8de 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,8 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2019-December/003034.html
-md5  6f0ecf8d103d528cfc803aa475137afa  libXpm-3.5.13.tar.bz2
-sha1  38b1a2728adb49f4e255aba1530f51789815ffc4  libXpm-3.5.13.tar.bz2
-sha256  9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25  libXpm-3.5.13.tar.bz2
-sha512  3b8f6e926272f39b1d95135c2274c00f5aaee1f9fb2ef79f71628df5edeb7ba20158819ef6a778101cc4092493a3b5b613c53634fdccadcc0fc85f0605e5e9a5  libXpm-3.5.13.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003261.html
+sha256  f7eb8f69c039281def8258ae6859adb5f050fbe161ab3d6a2d6ef109a603eac2  libXpm-3.5.14.tar.xz
+sha512  c3fe554453068a6b188d3cad2cb3648e84b7f1909aea8f213daadce3d444b34361c3b2edce14a4fd481f97e4dc45c3125e2483ff4f44b3390a75829ed2782e4b  libXpm-3.5.14.tar.xz
 # Locally calculated
 sha256  ed3b06bb3b75a0954bd6837a96b41a4676f60dfeee647271613aadecc0fd596e  COPYING
 sha256  cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71  COPYRIGHT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 7b645dc9e6..417dcfec38 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.13
-XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
-XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPM_VERSION = 3.5.14
+XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
+XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
 XLIB_LIBXPM_LICENSE_FILES = COPYING COPYRIGHT
 XLIB_LIBXPM_CPE_ID_VENDOR = libxpm_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
