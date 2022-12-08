Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BB1C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C58FB60AD7;
	Thu,  8 Dec 2022 22:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C58FB60AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEmnhlO6mDDa; Thu,  8 Dec 2022 22:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D081C60A6B;
	Thu,  8 Dec 2022 22:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D081C60A6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2651F1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC2D1820A7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC2D1820A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNVLIbfXJXs8 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77360820ED
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77360820ED
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout03.t-online.de (Postfix) with SMTP id DD01A1ABAF
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:22 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-39oCDB0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-11
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:07 +0100
Message-Id: <20221208223817.1088619-61-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-D924D9D3-6ED53597/0/0 CLEAN NORMAL
X-TOI-MSGID: bf8f95bd-99a6-4673-872e-2977e4d7950e
Subject: [Buildroot] [PATCH 60/70] package/x11r7/xapp_fslsfonts: bump
 version to 1.0.6
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

https://lists.x.org/archives/xorg-announce/2022-September/003210.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash | 5 +++--
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
index 1a7985f9a5..20573576c9 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-December/002510.html
-sha256  f1ed55093356b78daec2678d22f52d42ec11fe88575562d734396962e626d7f6  fslsfonts-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-September/003210.html
+sha256  01cb0c5a7dbddadef846ca3b52c2ab9c60f2c32c3f16584cd97a6c7f293341ee  fslsfonts-1.0.6.tar.xz
+sha512  1181a8e6cc820410d1deac98b3e5097506e4168c6515307b6b9aaf705cb57193a009cb331a51d46ce68e9548712f122b5c942d5a1bc1e01bdd191b7b1beab09e  fslsfonts-1.0.6.tar.xz
 # Locally computed
 sha256  fbdfcafb5755565ad688bf3f7f808109d358040ec83ed3de496155105451fdf4  COPYING
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 27786a55c1..1b8d630124 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_FSLSFONTS_VERSION = 1.0.5
-XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.bz2
-XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FSLSFONTS_VERSION = 1.0.6
+XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.xz
+XAPP_FSLSFONTS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_FSLSFONTS_LICENSE = MIT
 XAPP_FSLSFONTS_LICENSE_FILES = COPYING
 XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
