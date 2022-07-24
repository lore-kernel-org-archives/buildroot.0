Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9134C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49CEB4163B;
	Sun, 24 Jul 2022 16:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49CEB4163B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CN2sXAVrR920; Sun, 24 Jul 2022 16:29:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F298404C6;
	Sun, 24 Jul 2022 16:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F298404C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B712B1BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2C9741605
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2C9741605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWE2R6TNUGKE for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1686D4160B
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1686D4160B
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout01.t-online.de (Postfix) with SMTP id CD9E050F
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:05 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePd-0f12IO0; Sun, 24 Jul 2022 18:25:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePc-0007mb-2v;
 Sun, 24 Jul 2022 18:25:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:51 +0200
Message-Id: <20220724162500.2683871-12-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679901-0144F70D-11718C06/0/0 CLEAN NORMAL
X-TOI-MSGID: 3a5985c9-8d23-4be6-bbb4-d7762132f0c5
Subject: [Buildroot] [PATCH 11/20] package/x11r7/xapp_xev: bump version to
 1.2.5
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xev/xapp_xev.hash | 6 +++---
 package/x11r7/xapp_xev/xapp_xev.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xev/xapp_xev.hash b/package/x11r7/xapp_xev/xapp_xev.hash
index 8b9a006c46..9449781360 100644
--- a/package/x11r7/xapp_xev/xapp_xev.hash
+++ b/package/x11r7/xapp_xev/xapp_xev.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-July/003048.html
-sha256  d700e08bfe751ed2dbf802baa204b056d0e49348b6eb3c6f9cb035d8ae4885e2  xev-1.2.4.tar.bz2
-sha512  383472ddbfad639ba46a69080ecdd11a514a0578fd32c463fae18da02e0265c944589eebf12a858994f5fd601c02a0d51517e9b3ff61c6afe740d374f02781ca  xev-1.2.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003185.html
+sha256  c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1  xev-1.2.5.tar.xz
+sha512  9fbfb78c9547974c2256a678948bf4a694a40b1c2bd5c5dec5f365a713e6d938c6039f055a9629f49de27f02f3d7cb912f07c035df129798a4b2ddc20febe66a  xev-1.2.5.tar.xz
 # Locally computed
 sha256  9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 7d5f3cbb82..0f29a731e7 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XEV_VERSION = 1.2.4
-XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
-XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEV_VERSION = 1.2.5
+XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.xz
+XAPP_XEV_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XEV_LICENSE = MIT
 XAPP_XEV_LICENSE_FILES = COPYING
 XAPP_XEV_DEPENDENCIES = xlib_libX11 xlib_libXrandr
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
