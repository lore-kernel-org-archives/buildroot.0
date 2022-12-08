Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2A0C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A42D760AD7;
	Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A42D760AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHql2f-KBrh6; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B76360B43;
	Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B76360B43
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C7B91BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6131D40145
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6131D40145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDvZuGC42CWb for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E09AA400FE
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E09AA400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:22 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout05.t-online.de (Postfix) with SMTP id 7D97FBFE7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:20 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-2btxJZ0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-0y
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:21 +0100
Message-Id: <20221208223817.1088619-15-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-62A0A2DC-FDCAF26F/0/0 CLEAN NORMAL
X-TOI-MSGID: 3ccca3e5-db23-4199-a7dd-c4760bb1fbf4
Subject: [Buildroot] [PATCH 14/70] package/x11r7/xdriver_xf86-video-r128:
 bump version to 6.12.1
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

https://lists.x.org/archives/xorg-announce/2022-December/003275.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash  | 8 +++-----
 .../xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk    | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
index 455c3d4439..cf9b21ebe8 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-October/002926.html
-md5  105ebcfe1bac06fe84645ac3def91184  xf86-video-r128-6.12.0.tar.bz2
-sha1  7cfa41d386fa43b5d30299203e4845d8afba4899  xf86-video-r128-6.12.0.tar.bz2
-sha256  801c86882cbd2bbb3084d471dcc5cfee2c1754dcbfb4dc446676d58a6bd9e057  xf86-video-r128-6.12.0.tar.bz2
-sha512  0e667e2cfa8a87a00846361d86528c93754c403c812b66798953fa4c857b2143b2c4c44885da467e7f910d8cb910b69492cdcb6f25e2197bae6617364d152e38  xf86-video-r128-6.12.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003275.html
+sha256  7d023c2b171f1664e43d12a1d21674079d8065536f82bb95b448bfce4981c741  xf86-video-r128-6.12.1.tar.xz
+sha512  18b2408fe68161c32f84c7147717f8e6c6377e81e9d59e2f098843c54cd0ae757aab5059568da8c71ef38100807d56ee22447417c236c1b3deea292bb676e700  xf86-video-r128-6.12.1.tar.xz
 # Locally computed
 sha256  69f7c71859dc8f51aabdbe7a9ee915a480933eb81658f8af2bf4c918e65afe8b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 1931dbecd7..49514e3d3a 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_R128_VERSION = 6.12.0
-XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_R128_VERSION = 6.12.1
+XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_R128_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_R128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
