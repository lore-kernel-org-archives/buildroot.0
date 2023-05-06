Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F339C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D616542A5A;
	Sat,  6 May 2023 17:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D616542A5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2CIfhOixvd7; Sat,  6 May 2023 17:42:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04C1140C43;
	Sat,  6 May 2023 17:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04C1140C43
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82A481BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B44FB40C22
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B44FB40C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mn93Hb-YmAPQ for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4F5B40C17
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4F5B40C17
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout02.t-online.de (Postfix) with SMTP id 2822D95FD
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:23 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-29CGmo0; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsM-0004jT-2f
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:18 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:05 +0200
Message-Id: <20230506173917.1112500-10-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-AFFFCC11-16A80E83/0/0 CLEAN NORMAL
X-TOI-MSGID: d4659d3c-bbd5-4ffd-8c48-8788e898bed1
Subject: [Buildroot] [PATCH 10/22] package/x11r7/xlib_libXt: bump version to
 1.3.0
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
https://lists.x.org/archives/xorg-announce/2023-April/003383.html

Update license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/lib/libxt/-/commits/master/COPYING

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXt/xlib_libXt.hash | 8 ++++----
 package/x11r7/xlib_libXt/xlib_libXt.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
index 40512f3540..577896d38b 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.hash
+++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-January/003070.html
-sha256  679cc08f1646dbd27f5e48ffe8dd49406102937109130caab02ca32c083a3d60  libXt-1.2.1.tar.bz2
-sha512  6877af61ba91eeed6b6f80471b84f354ad0ec0827249c7ee0a00c13508063fe8d2696dd400a4bdbc6ca2ff67cbe1317ad5ac24522fd96099dc56535e33ca052c  libXt-1.2.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-April/003383.html
+sha256  52820b3cdb827d08dc90bdfd1b0022a3ad8919b57a39808b12591973b331bf91  libXt-1.3.0.tar.xz
+sha512  64c5978655135b925c3aaad86b1aa6a3f3b57ad8b3592bf142be616b8aa339a02c2fc7badfab9564ea8076ea8f37acfe31709ed528f5a1d251f2d116aa074118  libXt-1.3.0.tar.xz
 # Locally calculated
-sha256  a2866ccc0b1745149e4a2258d934314d40cbb43bd8318c6fa597f233995b0a81  COPYING
+sha256  75c5574ca04731d739b1420f55f2b7b47f30df895817f1b03d0d7f5c1fbee534  COPYING
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 9530262cf5..cca89145f8 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.2.1
-XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
-XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXT_VERSION = 1.3.0
+XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.xz
+XLIB_LIBXT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXT_LICENSE = MIT
 XLIB_LIBXT_LICENSE_FILES = COPYING
 XLIB_LIBXT_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
