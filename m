Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F583C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90EC40887;
	Thu,  8 Dec 2022 22:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90EC40887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bFj1rBAL2Z2C; Thu,  8 Dec 2022 22:46:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D944087C;
	Thu,  8 Dec 2022 22:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85D944087C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED0321BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5A8640145
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5A8640145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGK_PXTX9at9 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF51F400FE
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF51F400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:32 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout11.t-online.de (Postfix) with SMTP id 8EE95246C4
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-1y2xpj0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-2b
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:59 +0100
Message-Id: <20221208223817.1088619-53-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-C13271D1-1553C18B/0/0 CLEAN NORMAL
X-TOI-MSGID: 82b44aee-398b-4d38-88ac-db991ebab374
Subject: [Buildroot] [PATCH 52/70] package/x11r7/xapp_xgc: bump version to
 1.0.6
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

https://lists.x.org/archives/xorg-announce/2022-October/003221.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xgc/xapp_xgc.hash | 5 +++--
 package/x11r7/xapp_xgc/xapp_xgc.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xgc/xapp_xgc.hash b/package/x11r7/xapp_xgc/xapp_xgc.hash
index 50e1362b64..7664e31186 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.hash
+++ b/package/x11r7/xapp_xgc/xapp_xgc.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002575.html
-sha256  14828d9bda358ad57efc0206bc416ee33ba542091edb186485cca5389adc2f5e  xgc-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003221.html
+sha256  7b87bbdbce4ec858738a3b81b8a3943aff01036001e2a1d00bb5384392a8b240  xgc-1.0.6.tar.xz
+sha512  f449b9b2d313aeba1fe9bf33fef90291776403f1fdf4afc507c4b973045c97fc8ded65ddec4f8c58727e7e4c7c4ad6a65ae79581eb4bdfe9c79a5f909dbc0a1f  xgc-1.0.6.tar.xz
 # Locally computed
 sha256  13ebeb3e59e406064d46e94a707ed5ec5d8d2bf840971265dd46db0850d22d02  COPYING
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 41d42c461e..fc055f57dd 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XGC_VERSION = 1.0.5
-XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
-XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XGC_VERSION = 1.0.6
+XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.xz
+XAPP_XGC_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XGC_LICENSE = MIT
 XAPP_XGC_LICENSE_FILES = COPYING
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
