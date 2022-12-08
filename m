Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE33FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EA33408C5;
	Thu,  8 Dec 2022 22:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EA33408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNxLmfGKFq-E; Thu,  8 Dec 2022 22:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96783403E9;
	Thu,  8 Dec 2022 22:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96783403E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA9AF1BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C20DC4191A
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C20DC4191A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6WJP7yEN475p for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82EFD41914
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82EFD41914
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout12.t-online.de (Postfix) with SMTP id 5ADC018AC1
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-2btxJd0; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-1P
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:23 +0100
Message-Id: <20221208223817.1088619-17-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-62A0A2DC-DD9C0462/0/0 CLEAN NORMAL
X-TOI-MSGID: 06bcfa48-8fbb-4dd2-8c20-b8bebcce88bd
Subject: [Buildroot] [PATCH 16/70] package/x11r7/xapp_xstdcmap: bump version
 to 1.0.5
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

https://lists.x.org/archives/xorg-announce/2022-December/003272.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash | 8 +++-----
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash
index 3f601c7249..028980bdca 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002954.html
-md5  da67142c128d18386ff145882e0afc66  xstdcmap-1.0.4.tar.bz2
-sha1  a5eff72ba31625e5b11506add800140019a39636  xstdcmap-1.0.4.tar.bz2
-sha256  06898b3f1eaad0b205ff3c75bdefa3207868b889d4cb37b32b8267b2bbfe6f8b  xstdcmap-1.0.4.tar.bz2
-sha512  2adbb0aec1766341e04090efa962241ff6c9e32c612851b7221cec0ee16852107d406a08ec5251070f39df882c13e3c8c9edcd88f278187a9f373e1727643a8f  xstdcmap-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003272.html
+sha256  365847e379398499ec9ad9a299cc47a0d6e7feba9546dfd4e5b422204b5ac180  xstdcmap-1.0.5.tar.xz
+sha512  3f2047af1d328a34d38ededc13de00298db3300eab1d1dbdff7d2aa4a3cd543a79305bfbd2e6424c5e023cf866a4f7a70aa9a3014444d543268d2f812a322a49  xstdcmap-1.0.5.tar.xz
 # Locally computed
 sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index dd5b0ee349..60825556e7 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XSTDCMAP_VERSION = 1.0.4
-XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.bz2
-XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSTDCMAP_VERSION = 1.0.5
+XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.xz
+XAPP_XSTDCMAP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XSTDCMAP_LICENSE = MIT
 XAPP_XSTDCMAP_LICENSE_FILES = COPYING
 XAPP_XSTDCMAP_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
