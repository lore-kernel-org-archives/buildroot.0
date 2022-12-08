Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBFAC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16B62401B7;
	Thu,  8 Dec 2022 22:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B62401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0OeM1fmrD79; Thu,  8 Dec 2022 22:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CF0F40108;
	Thu,  8 Dec 2022 22:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CF0F40108
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A54E1BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6863B60B08
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6863B60B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQKkSFG1KUww for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87D2260A8D
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87D2260A8D
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout10.t-online.de (Postfix) with SMTP id 6443E20C14
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-0X2tPU0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-2e
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:29 +0100
Message-Id: <20221208223817.1088619-23-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E20B2E65-C6A5B697/0/0 CLEAN NORMAL
X-TOI-MSGID: 167e2514-1fac-4ec5-a5b5-c20c1d85024f
Subject: [Buildroot] [PATCH 22/70] package/x11r7/xapp_xfd: bump version to
 1.1.4
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

https://lists.x.org/archives/xorg-announce/2022-December/003266.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xfd/xapp_xfd.hash | 8 +++-----
 package/x11r7/xapp_xfd/xapp_xfd.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xfd/xapp_xfd.hash b/package/x11r7/xapp_xfd/xapp_xfd.hash
index ec85170180..5965958828 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.hash
+++ b/package/x11r7/xapp_xfd/xapp_xfd.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002968.html
-md5  f9c9f2b101a96d4b50c2a4ab9b5ab5b1  xfd-1.1.3.tar.bz2
-sha1  ca6dbe2027b205992a52c6bb717a43508f12a8c4  xfd-1.1.3.tar.bz2
-sha256  192f938ba5830e84cc807d8ead2ad9655b43eaed6500c830f3e083aad10ed958  xfd-1.1.3.tar.bz2
-sha512  68e2d4ce5e24215353b6f3231191d69639c4dd90a703e03ccf152bbfe4012da071c387ba289f918fb0336a3be9ee49dc05cbec7273fa85f5e476ead7e10795f0  xfd-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003266.html
+sha256  d5470ffb66fd45a1e1b03d6df01f12d4caf0cf675cde0345cda237243e9076fd  xfd-1.1.4.tar.xz
+sha512  fa1f8a7b5d89be20fb2b1e3e0e8f4d7f9463e91fd385d21e1403a398c2e263112043b568417c420c5ee33bec60e06658498dd55df6d7ac19da3af0844f932209  xfd-1.1.4.tar.xz
 # Locally computed
 sha256  57ae10f24fc110dafb3b8d7735cf26b1905ff74e716745b2520e4ccd7751095c  COPYING
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 149e24b79a..1ef1d69db3 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFD_VERSION = 1.1.3
-XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
-XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFD_VERSION = 1.1.4
+XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.xz
+XAPP_XFD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFD_LICENSE = MIT
 XAPP_XFD_LICENSE_FILES = COPYING
 XAPP_XFD_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
