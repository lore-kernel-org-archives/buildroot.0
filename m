Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0008C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 526CB408C1;
	Thu,  8 Dec 2022 22:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 526CB408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5avQeGi-Tno; Thu,  8 Dec 2022 22:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F20954089B;
	Thu,  8 Dec 2022 22:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F20954089B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3745E1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72F05401B7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72F05401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlJ07QsFF5b7 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 721BE400FE
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 721BE400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout09.t-online.de (Postfix) with SMTP id 645891C534
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-0X2tPT0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-22
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:26 +0100
Message-Id: <20221208223817.1088619-20-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E20B2E65-7409C2C3/0/0 CLEAN NORMAL
X-TOI-MSGID: 3304c2f9-94fa-4e77-94eb-d118eb892917
Subject: [Buildroot] [PATCH 19/70] package/x11r7/xapp_xprop: bump version to
 1.2.6
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

https://lists.x.org/archives/xorg-announce/2022-December/003269.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xprop/xapp_xprop.hash | 6 +++---
 package/x11r7/xapp_xprop/xapp_xprop.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xprop/xapp_xprop.hash b/package/x11r7/xapp_xprop/xapp_xprop.hash
index 95e7c4eeed..9db2fb9125 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.hash
+++ b/package/x11r7/xapp_xprop/xapp_xprop.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-November/003064.html
-sha256  9b92ed0316bf2486121d8bac88bd1878f16b43bd335f18009b1f941f1eca93a1  xprop-1.2.5.tar.bz2
-sha512  93cfa621fa76ca6e8e780a252c508380b6dc9db39b67bfca16bb9800f0d39110f5d18189409a8577ef79e98bf5eece17f5e23f2218ca72ae8bb04ee7b429d559  xprop-1.2.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003269.html
+sha256  580b8525b12ecc0144aa16c88b0aafa76d2e799b44c8c6c50f9ce92788b5586e  xprop-1.2.6.tar.xz
+sha512  ab25d4b8bf9de8fb37149060ad4870ffed4d6846ac3b31903a42c36301fcb0d50d3ba15949fdd9079507db97d3f05d4bbd11711d825e5470482cc30772cc3f25  xprop-1.2.6.tar.xz
 # Locally computed
 sha256  f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415  COPYING
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 75f0d37cdc..888e9d3a69 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XPROP_VERSION = 1.2.5
-XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
-XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPROP_VERSION = 1.2.6
+XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.xz
+XAPP_XPROP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XPROP_LICENSE = MIT
 XAPP_XPROP_LICENSE_FILES = COPYING
 XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
