Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7977DC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2824042A56;
	Sat,  6 May 2023 17:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2824042A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pXhivI14MwZm; Sat,  6 May 2023 17:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33AC240CB8;
	Sat,  6 May 2023 17:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33AC240CB8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C56C1BF859
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0066B409B1
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0066B409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gv894rDDC8Q for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8728409FB
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8728409FB
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout02.t-online.de (Postfix) with SMTP id 265F295FC
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:23 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-29CGmn0; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsM-0004jT-2T
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:18 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:04 +0200
Message-Id: <20230506173917.1112500-9-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-AFFFCC11-6E87BB55/0/0 CLEAN NORMAL
X-TOI-MSGID: c486048d-eb88-4dee-8c51-ad10ce221d8a
Subject: [Buildroot] [PATCH 09/22] package/x11r7/xlib_libXft: bump version
 to 2.3.8
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
https://lists.x.org/archives/xorg-announce/2023-April/003384.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXft/xlib_libXft.hash | 6 +++---
 package/x11r7/xlib_libXft/xlib_libXft.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.hash b/package/x11r7/xlib_libXft/xlib_libXft.hash
index 5074365aed..749aa0ad62 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.hash
+++ b/package/x11r7/xlib_libXft/xlib_libXft.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg/2022-November/061175.html
-sha256  79f0b37c45007381c371a790c2754644ad955166dbf2a48e3625032e9bdd4f71  libXft-2.3.7.tar.xz
-sha512  9df29d3c7b88a21952df1015604511e5d79856d721b2a61eb2c5a062a9abccf16318132432a7c86c0ef816bf174ae86842fa67dabbaa0b163dfa56d99022de19  libXft-2.3.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-April/003384.html
+sha256  5e8c3c4bc2d4c0a40aef6b4b38ed2fb74301640da29f6528154b5009b1c6dd49  libXft-2.3.8.tar.xz
+sha512  fc385d73e1acb701942c154ffb5a283d17891f21d3ac598c4a3fb375a7d6082734593062368c15cad67c1a94177dd15deed878ec5ea852188393b52e92c372c8  libXft-2.3.8.tar.xz
 # Locally computed
 sha256  7cda22286b1379b9b73df695f72cbad36595e65b039a5fbc5c89b69ecc44438c  COPYING
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 845b612669..154c220aa1 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFT_VERSION = 2.3.7
+XLIB_LIBXFT_VERSION = 2.3.8
 XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.xz
 XLIB_LIBXFT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFT_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
