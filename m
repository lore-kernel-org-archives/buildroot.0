Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD4AC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEDCA83BF3;
	Sun,  7 May 2023 12:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEDCA83BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtbK41WvOUR8; Sun,  7 May 2023 12:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627BB83BD9;
	Sun,  7 May 2023 12:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 627BB83BD9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DCB91BF2FA
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D139610FD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D139610FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9tyeh8VqYTm for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBDFC60BFA
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBDFC60BFA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7DA685EE9; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:59:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e24cd30a147992a6647da23cc4ff5b4aac1aa120
X-Git-Newrev: 0864f874287c06cdbc54c6150f52c003b5741226
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.B7DA685EE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXaw: bump version to
 1.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=0864f874287c06cdbc54c6150f52c003b5741226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-March/003372.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXaw/xlib_libXaw.hash | 7 +++----
 package/x11r7/xlib_libXaw/xlib_libXaw.mk   | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.hash b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
index f289e66153..ce2ec4a3e1 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.hash
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-March/003077.html
-sha256  76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e  libXaw-1.0.14.tar.bz2
-sha512  29d1c151369523ae6cb418e636b0b7b39ccccc35462a0b394dbeb46d5b6d780badd2eb872a55d9fbba1ee1af034e76c0463f40f8d8a7be2c336d08b3b1bf81d4  libXaw-1.0.14.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2023-March/003372.html
+sha256  ab35f70fde9fb02cc71b342f654846a74328b74cb3a0703c02d20eddb212754a  libXaw-1.0.15.tar.xz
+sha512  8edbf280b7b24b9040c291545053c1251d6af7e7f56da43a6065a1848245863eb52bdfc28c2f18dbb6597a4064394a44f4df5d8596a1a467549ccc9ce50a7821  libXaw-1.0.15.tar.xz
 # Locally calculated
 sha256  9f5adb26952f93b3e4650285b94ec6c61a27aab5a21088bfb6694001be1b360d  COPYING
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 6b615a8de5..f81a7b4a88 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXAW_VERSION = 1.0.14
-XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
-XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXAW_VERSION = 1.0.15
+XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.xz
+XLIB_LIBXAW_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXAW_LICENSE = MIT
 XLIB_LIBXAW_LICENSE_FILES = COPYING
 XLIB_LIBXAW_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
