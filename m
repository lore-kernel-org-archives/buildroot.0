Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CDBC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D52058177C;
	Sun, 11 Dec 2022 16:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D52058177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id juAF_76UYNgA; Sun, 11 Dec 2022 16:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F12038176B;
	Sun, 11 Dec 2022 16:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F12038176B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E94E1BF868
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2990740293
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2990740293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38mnWrWgD1yn for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:03:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 980B140281
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 980B140281
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:03:22 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout10.t-online.de (Postfix) with SMTP id 49AE039D7
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:03:20 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4OnP-0HnEDS0; Sun, 11 Dec 2022 17:03:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56504)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4OnP-0008VD-1t
 for buildroot@buildroot.org; Sun, 11 Dec 2022 17:03:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:03:18 +0100
Message-Id: <20221211160319.3470254-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211160319.3470254-1-bernd.kuhls@t-online.de>
References: <20221211160319.3470254-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670774600-F9C53742-BDE11D0F/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b77bebc-d622-4121-86cf-339ea1e26028
Subject: [Buildroot] [PATCH 3/4] package/x11r7/xdriver_xf86-video-vesa: bump
 version to 2.6.0
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

https://lists.x.org/archives/xorg-announce/2022-December/003297.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash    | 6 +++---
 .../xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
index d179228a74..3e32249f12 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-September/003060.html
-sha256  1f1624f3c73906801ad1bc98335a2cb5676a7a4d18e5374d9a1d18464e54c659  xf86-video-vesa-2.5.0.tar.bz2
-sha512  36fd921f54f33eb25966b5f9ea1e1b3e9009965c012c8b9c676686b472111719921b80cf62dafc746058878253e21f0ef341a2ff2d650df22ca1e35e81716a8b  xf86-video-vesa-2.5.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003297.html
+sha256  10082771b1a8f659c60b3d9b70456a4b59948a75b3cade2dfa33b8b05e549bb1  xf86-video-vesa-2.6.0.tar.xz
+sha512  494e117c1e6e0ce4c66ac7798de54667862c62605bfd76dd9373447d40dcd0521100810c9285cbe9c159440e217954c0cad6d5219c5894e075509c7c0bc353c7  xf86-video-vesa-2.6.0.tar.xz
 # Locally computed
 sha256  bda49ba1e860501c20fd444423bc790f6da4f769561b69acc0cbe5abff9409b6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index b08bab4ec8..8a5a5ebf58 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VESA_VERSION = 2.5.0
-XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_VESA_VERSION = 2.6.0
+XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_VESA_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_VESA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_VESA_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
