Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F10C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C9A7401B7;
	Thu,  8 Dec 2022 22:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C9A7401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yVpaWsEqwKQ8; Thu,  8 Dec 2022 22:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F45404BA;
	Thu,  8 Dec 2022 22:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48F45404BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A52C81BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C87DD820A7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C87DD820A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 551DX1vl5gEM for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2632820E8
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2632820E8
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:31 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout08.t-online.de (Postfix) with SMTP id 8FA351375B
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-1y2xpk0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-30
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:01 +0100
Message-Id: <20221208223817.1088619-55-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-C13271D1-E96906FA/0/0 CLEAN NORMAL
X-TOI-MSGID: 1f23b2f5-16eb-4ea5-b2cb-f02ef6e26d4f
Subject: [Buildroot] [PATCH 54/70] package/x11r7/xapp_viewres: bump version
 to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2022-October/003219.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_viewres/xapp_viewres.hash | 8 +++-----
 package/x11r7/xapp_viewres/xapp_viewres.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_viewres/xapp_viewres.hash b/package/x11r7/xapp_viewres/xapp_viewres.hash
index 3e2928dc4e..a662f4ef2e 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.hash
+++ b/package/x11r7/xapp_viewres/xapp_viewres.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-August/003020.html
-md5  38e6568271d8098327706c5cf855dbc7  viewres-1.0.6.tar.bz2
-sha1  f1d12e5b4e1180916edb44234599a486b025b480  viewres-1.0.6.tar.bz2
-sha256  11c15db02066c1d5fc3febf9b185d16c1112f87e37c4b101a484dcefffb80934  viewres-1.0.6.tar.bz2
-sha512  3f4cfc61608bc6c9b35ef66ceb473661ca01946d3306d54040d32803e8e0eec506a0ce37ea22bfe514544a6ba9645fd30f39b20c063aff696b3c0fda3fe95dff  viewres-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003219.html
+sha256  b15a62085b1a10f55ae1cf17b7ded75b72b21be240c68071685db377c4afc628  viewres-1.0.7.tar.xz
+sha512  75878faee001163891adf8472c79b31273f794e23dd775c80b33acdd1ce76df708eb27a49c20f79b7101ad676e1d50d9c857c2e2e0930c6209eeb7af8a11397c  viewres-1.0.7.tar.xz
 # Locally computed
 sha256  aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 2e05a6e7d9..49933d7af6 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_VIEWRES_VERSION = 1.0.6
-XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
-XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_VIEWRES_VERSION = 1.0.7
+XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.xz
+XAPP_VIEWRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_VIEWRES_LICENSE = MIT
 XAPP_VIEWRES_LICENSE_FILES = COPYING
 XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
