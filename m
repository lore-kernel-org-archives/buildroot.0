Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D400FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CE440898;
	Thu,  8 Dec 2022 22:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75CE440898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYHKbnAuq2_Z; Thu,  8 Dec 2022 22:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B00408BB;
	Thu,  8 Dec 2022 22:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B00408BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7E21BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC7F4401B7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC7F4401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hncvy_OCRUEQ for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4925401D2
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4925401D2
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:33 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout11.t-online.de (Postfix) with SMTP id 8FF32246C5
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-1y2xpl0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-0C
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:03 +0100
Message-Id: <20221208223817.1088619-57-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-C13271D1-886A70C6/0/0 CLEAN NORMAL
X-TOI-MSGID: 235d4ff8-2f8f-456a-9795-5be60c1aab23
Subject: [Buildroot] [PATCH 56/70] package/x11r7/xdriver_xf86-input-vmmouse:
 bump version to 13.2.0
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

https://lists.x.org/archives/xorg-announce/2022-October/003217.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-vmmouse.hash                         | 5 +++--
 .../xdriver_xf86-input-vmmouse.mk                           | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
index fd6221fa23..2a221a4c12 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-June/002616.html
-sha256  0af558957ac1be1b2863712c2475de8f4d7f14921fd01ded2e2fde4921b19319  xf86-input-vmmouse-13.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003217.html
+sha256  56f077580ab8f02e2f40358c5c46b0ae3e1828fc77744526b24adf1ceea339b8  xf86-input-vmmouse-13.2.0.tar.xz
+sha512  26a01347a679db058abdc7cbd9a363bb4fccd1a727dc18e279d15b8a0dce71f67af5ff54df28b908391da8d2fc311d8c1813f26dcded4e9a2668db7b55ca5687  xf86-input-vmmouse-13.2.0.tar.xz
 # Locally calculated
 sha256  804737a1582428fdde4e2bfd1e9f3ca07971fc3bdce20ba2d06cc2bba6c84a9e  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index b8c77de5f6..178e1344b2 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 13.1.0
-XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMOUSE_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 13.2.0
+XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMOUSE_VERSION).tar.xz
+XDRIVER_XF86_INPUT_VMMOUSE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
