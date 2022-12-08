Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF68C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C1D60A6B;
	Thu,  8 Dec 2022 22:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5C1D60A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sa3MC2ffas4A; Thu,  8 Dec 2022 22:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7DFD60A8D;
	Thu,  8 Dec 2022 22:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7DFD60A8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56A8B1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B111F820EE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B111F820EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gR9uOT4eA7wq for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A34820EC
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1A34820EC
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout10.t-online.de (Postfix) with SMTP id 6C19720C18
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX4-0lIgb60; Thu, 8 Dec 2022 23:38:22 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-1d
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:10 +0100
Message-Id: <20221208223817.1088619-64-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539102-E20B2E65-C89BB239/0/0 CLEAN NORMAL
X-TOI-MSGID: 49a21323-671f-45a9-b66b-8d3ac7f8e9af
Subject: [Buildroot] [PATCH 63/70] package/x11r7/xapp_showfont: bump version
 to 1.0.6
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

https://lists.x.org/archives/xorg-announce/2022-August/003207.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_showfont/xapp_showfont.hash | 5 +++--
 package/x11r7/xapp_showfont/xapp_showfont.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_showfont/xapp_showfont.hash b/package/x11r7/xapp_showfont/xapp_showfont.hash
index ff35e9c9eb..7bec4e8728 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.hash
+++ b/package/x11r7/xapp_showfont/xapp_showfont.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-December/002513.html
-sha256  e9735c1c530b8a52edfab7415cc0fd7f8d2889095114f4cb689a27476461ac89  showfont-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003207.html
+sha256  2b9b9f06e65e095ed76ce560b701b9fc47fa63310ee706b54c8787af061d0e56  showfont-1.0.6.tar.xz
+sha512  21a318519492f4ba46a8bcb3590097fc5f96fe01fdb557257ae56bae813671952a2aad6c0df8cd69659e06708571c398e6d97969224cf692e22c8a35c8e6c363  showfont-1.0.6.tar.xz
 # Locally computed
 sha256  c32217021e0507207e2ee6da3fcee3d9e32816003a7153b3357c08cdc97934a8  COPYING
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index c0b8c9a3a2..a805f35231 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_SHOWFONT_VERSION = 1.0.5
-XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
-XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SHOWFONT_VERSION = 1.0.6
+XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.xz
+XAPP_SHOWFONT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SHOWFONT_LICENSE = MIT
 XAPP_SHOWFONT_LICENSE_FILES = COPYING
 XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
