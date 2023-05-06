Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D105AC77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79B8540BFE;
	Sat,  6 May 2023 17:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B8540BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_lBgX4FBHoX; Sat,  6 May 2023 17:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3170E42A57;
	Sat,  6 May 2023 17:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3170E42A57
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17B061BF859
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E06938216A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E06938216A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FjAHRR4Lpn9 for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D93FA83EF3
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D93FA83EF3
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:24 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout09.t-online.de (Postfix) with SMTP id 09E36A156
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:22 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd87.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-1uT3Mf0; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsN-0004jT-16
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:11 +0200
Message-Id: <20230506173917.1112500-16-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-EEFFAC53-1159BE0D/0/0 CLEAN NORMAL
X-TOI-MSGID: 1b947bbe-4bce-4cde-afb6-e9fd5a870804
Subject: [Buildroot] [PATCH 16/22] package/x11r7/xlib_libXaw: bump version
 to 1.0.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2023-March/003372.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
