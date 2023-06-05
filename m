Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98FFC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537EC6114C;
	Mon,  5 Jun 2023 11:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 537EC6114C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kv_6eeVtX-VH; Mon,  5 Jun 2023 11:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B43E60FB5;
	Mon,  5 Jun 2023 11:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B43E60FB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FEE31BF4DA
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC7F3417A9
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC7F3417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBcE6LeEIRnA for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F9D6417A5
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9D6417A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B6EE86C7A; Mon,  5 Jun 2023 11:45:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:16:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2a23ae346c7563c8e9486903a13ff28d6bf0334f
X-Git-Newrev: 9f9fac6fb485a20a15ae5e8f1d620da2742e4c05
X-Patchwork-Hint: ignore
Message-Id: <20230605114519.3B6EE86C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/x11r7/xlib_libXaw: bump version to 1.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f9fac6fb485a20a15ae5e8f1d620da2742e4c05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-March/003372.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0864f874287c06cdbc54c6150f52c003b5741226)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
