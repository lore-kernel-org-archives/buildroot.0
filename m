Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF74C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D6E81E79;
	Thu,  8 Dec 2022 22:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D6E81E79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yx-zKO2wJ_-X; Thu,  8 Dec 2022 22:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 763C781AC4;
	Thu,  8 Dec 2022 22:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 763C781AC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D49FE1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFC3060B3A
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC3060B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94omdZp_8Qoq for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8884C60B2F
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8884C60B2F
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout10.t-online.de (Postfix) with SMTP id 6297120C13
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-0X2tPR0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-1C
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:22 +0100
Message-Id: <20221208223817.1088619-16-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E20B2E65-8179257D/0/0 CLEAN NORMAL
X-TOI-MSGID: a5305122-1810-4983-8b33-2a986b5d5281
Subject: [Buildroot] [PATCH 15/70] package/x11r7/xapp_xvinfo: bump version
 to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2022-December/003273.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xvinfo/xapp_xvinfo.hash | 8 +++-----
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
index 3d8ace9ae5..7dd5820c08 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002955.html
-md5  b13afec137b9b331814a9824ab03ec80  xvinfo-1.1.4.tar.bz2
-sha1  136a70a72b23c81f4fe8f4c8cb7073316be16b44  xvinfo-1.1.4.tar.bz2
-sha256  0353220d6606077ba42363db65f50410759f9815352f77adc799e2adfa76e73f  xvinfo-1.1.4.tar.bz2
-sha512  85e1f936c5c826f0fdde3670bd77d5cde8641c6e8e7849e42142e91b5aa01d7e0e60d2b064eb6fef4f5666321813ca2dc9f9656756ccbe6dcda37b119ee8a63e  xvinfo-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003273.html
+sha256  3ede71ecb26d9614ccbc6916720285e95a2c7e0c5e19b8570eaaf72ad7c5c404  xvinfo-1.1.5.tar.xz
+sha512  18467161b248c68f6bde15e1c1b4b8cf812daf46777602558aee5fb7cb4d2649218de88fa93842fea4f316d954440f03a37d71fa4fda92eda3c7d80970e19cbb  xvinfo-1.1.5.tar.xz
 # Locally computed
 sha256  7725b0484faa1832534814ecb577f5a86acc74f1bcce25f92c55dfc1b693717d  COPYING
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 7b3b97f073..6fa392f018 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XVINFO_VERSION = 1.1.4
-XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
-XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XVINFO_VERSION = 1.1.5
+XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.xz
+XAPP_XVINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XVINFO_LICENSE = MIT
 XAPP_XVINFO_LICENSE_FILES = COPYING
 XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
