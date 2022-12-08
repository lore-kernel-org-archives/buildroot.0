Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E1DC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F374760B44;
	Thu,  8 Dec 2022 22:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F374760B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJID6spoqCmq; Thu,  8 Dec 2022 22:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FAC760B2F;
	Thu,  8 Dec 2022 22:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FAC760B2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4191BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E27D3401D2
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E27D3401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vaiAmGbuZdxx for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A804400FE
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A804400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout03.t-online.de (Postfix) with SMTP id D813C1ABAB
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:22 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-325S430; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-2R
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:43 +0100
Message-Id: <20221208223817.1088619-37-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-DA24F9D3-AB6CF8C9/0/0 CLEAN NORMAL
X-TOI-MSGID: 4796eae0-be5a-443d-80cc-d15dead571a0
Subject: [Buildroot] [PATCH 36/70] package/x11r7/xapp_rgb: bump version to
 1.1.0
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

https://lists.x.org/archives/xorg-announce/2022-October/003245.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_rgb/xapp_rgb.hash | 5 +++--
 package/x11r7/xapp_rgb/xapp_rgb.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_rgb/xapp_rgb.hash b/package/x11r7/xapp_rgb/xapp_rgb.hash
index ce05454ce9..586dc2a7f0 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.hash
+++ b/package/x11r7/xapp_rgb/xapp_rgb.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-November/002494.html
-sha256  bbca7c6aa59939b9f6a0fb9fff15dfd62176420ffd4ae30c8d92a6a125fbe6b0  rgb-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003245.html
+sha256  fc03d7f56e5b2a617668167f8927948cce54f93097e7ccd9f056077f479ed37b  rgb-1.1.0.tar.xz
+sha512640888d64b2d328fff4a1652ba1299436e348bc3cbc90710d79c635acfa7f2fce0018adb818123b41ca008197ff1cbf87aab60501de36c163bed2d80d8556008  rgb-1.1.0.tar.xz
 # Locally computed
 sha256  1d08eb3384f5dedc7735bcfae1aa58cb64643ca9389edce3312b1c3cefbfdaa7  COPYING
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index b2d5d77744..4b6399fc76 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_RGB_VERSION = 1.0.6
-XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
-XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_RGB_VERSION = 1.1.0
+XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.xz
+XAPP_RGB_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_RGB_LICENSE = MIT
 XAPP_RGB_LICENSE_FILES = COPYING
 XAPP_RGB_DEPENDENCIES = xorgproto host-pkgconf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
