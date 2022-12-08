Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508CFC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE4940917;
	Thu,  8 Dec 2022 22:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE4940917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bypdzrOm-DUT; Thu,  8 Dec 2022 22:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFFE408F0;
	Thu,  8 Dec 2022 22:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CFFE408F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1EC1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F067460B2F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F067460B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4T7YR9l5Zql for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE38F60B45
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE38F60B45
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout10.t-online.de (Postfix) with SMTP id 6A77F20C17
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-0lIgb30; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-1E
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:08 +0100
Message-Id: <20221208223817.1088619-62-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-E20B2E65-A78266D9/0/0 CLEAN NORMAL
X-TOI-MSGID: 890cd5a1-1993-4323-89f5-2a4cc49a7542
Subject: [Buildroot] [PATCH 61/70] package/x11r7/xlib_libXft: bump version
 to 2.3.6
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

https://lists.x.org/archives/xorg-announce/2022-September/003211.html
https://lists.x.org/archives/xorg-announce/2022-September/003209.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXft/xlib_libXft.hash | 6 +++---
 package/x11r7/xlib_libXft/xlib_libXft.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.hash b/package/x11r7/xlib_libXft/xlib_libXft.hash
index 8743a9b7d1..484764be3d 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.hash
+++ b/package/x11r7/xlib_libXft/xlib_libXft.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-August/003104.html
-sha256  57dedaab20914002146bdae0cb0c769ba3f75214c4c91bd2613d6ef79fc9abdd  libXft-2.3.4.tar.bz2
-sha512  5bb019750982ed4643880efd7368bc226ad49cfa8c0c8c6d4614dfeed74f588c65e1ba69adcc12284ec07d841e5b58fc1c27f3fddf83fe1a2837b29dd9ecec51  libXft-2.3.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-September/003211.html
+sha256  60a6e7319fc938bbb8d098c9bcc86031cc2327b5d086d3335fc5c76323c03022  libXft-2.3.6.tar.xz
+sha512  732f8c635fcac6010012ba8c10c23d2dd6ec79b0f096d6bcc9b7e36d2ca0817387faa7ee5bb6f43cff02adc68e4234c1b8f95021ebc548f61c492e0b76836d90  libXft-2.3.6.tar.xz
 # Locally computed
 sha256  7cda22286b1379b9b73df695f72cbad36595e65b039a5fbc5c89b69ecc44438c  COPYING
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index b1640a6613..a86501900c 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXFT_VERSION = 2.3.4
-XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
+XLIB_LIBXFT_VERSION = 2.3.6
+XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.xz
 XLIB_LIBXFT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFT_LICENSE = MIT
 XLIB_LIBXFT_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
