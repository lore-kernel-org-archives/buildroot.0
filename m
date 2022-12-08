Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBEFC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 796D060AD7;
	Thu,  8 Dec 2022 22:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 796D060AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bN_HyZ5rWma8; Thu,  8 Dec 2022 22:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8376860A72;
	Thu,  8 Dec 2022 22:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8376860A72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1788C1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ED08820EB
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED08820EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMcWZhLIPO8i for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62F81820D4
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62F81820D4
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout09.t-online.de (Postfix) with SMTP id 664431C535
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-0X2tPX0; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-0k
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:35 +0100
Message-Id: <20221208223817.1088619-29-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-E20B2E65-B127589F/0/0 CLEAN NORMAL
X-TOI-MSGID: bf1fcf64-ec1d-4796-8a64-43f4e4415ce9
Subject: [Buildroot] [PATCH 28/70] package/x11r7/xapp_xlsclients: bump
 version to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2022-November/003259.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xlsclients/xapp_xlsclients.hash | 8 +++-----
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
index b73917cb4a..ac172acceb 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002866.html
-md5  4fa92377e0ddc137cd226a7a87b6b29a  xlsclients-1.1.4.tar.bz2
-sha1  175af1c216a1db3de5023ecd6cce186e7693c6e4  xlsclients-1.1.4.tar.bz2
-sha256  773f2af49c7ea2c44fba4213bee64325875c1b3c9bc4bbcd8dac9261751809c1  xlsclients-1.1.4.tar.bz2
-sha512  42fd848d88d3cf31168a37fed63f9f5b60ddc4f36be2956b354e574c93129d75f29e005d6631784380bcef27860b54c64f419ca18ad77f092f4520dec47b10f4  xlsclients-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003259.html
+sha256  68baee57e70250ac4a7759fb78221831f97d88bc8e51dcc2e64eb3f8ca56bae3  xlsclients-1.1.5.tar.xz
+sha512  3896643378603876438772475e89ad5c066f98c16593245db5fa066418ff793798247f976d2bf7aa401d2590fc9807b80c9758bcbcc91566f02ceb856d9702bf  xlsclients-1.1.5.tar.xz
 # Locally computed
 sha256  716d6f1d18cb97cdd4a2ef7b101d944a250ca9de57578a490c038b9aaf950648  COPYING
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index 167748b338..a179e06713 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XLSCLIENTS_VERSION = 1.1.4
-XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
-XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSCLIENTS_VERSION = 1.1.5
+XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.xz
+XAPP_XLSCLIENTS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLSCLIENTS_LICENSE = MIT
 XAPP_XLSCLIENTS_LICENSE_FILES = COPYING
 XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu libxcb xcb-util
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
