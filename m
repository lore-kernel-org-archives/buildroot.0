Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16DBC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 17:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CC1A4052E;
	Fri, 29 Jul 2022 17:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CC1A4052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ICAFazCzvP4U; Fri, 29 Jul 2022 17:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E472402EB;
	Fri, 29 Jul 2022 17:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E472402EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCB91BF3FB
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 17:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2475060B16
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 17:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2475060B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBKCKvBZRVev for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 17:44:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B0A1607F1
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B0A1607F1
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 17:44:51 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout04.t-online.de (Postfix) with SMTP id BBD4C52D0
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:44:47 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.206.67]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oHU2W-1Ac0i90; Fri, 29 Jul 2022 19:44:44 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:56506)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oHU2W-0001R5-1V
 for buildroot@buildroot.org; Fri, 29 Jul 2022 19:44:44 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 19:44:44 +0200
Message-Id: <20220729174444.352284-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659116684-014551EF-E92CC7CE/0/0 CLEAN NORMAL
X-TOI-MSGID: f1e7a46a-fdb3-40f7-88cc-4f32e7623a90
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-nv: bump
 version to 2.1.22
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

Release notes: https://lists.x.org/archives/xorg-announce/2022-July/003196.html

Switched tarball from bz2 to xz
Switched _SITE to https

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash  | 5 +++--
 .../x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk    | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
index e1835687aa..ec7d198c18 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002761.html
-sha256  1f98649e6ff0e8214b9d5dcac661f1d004be8e73823d8247b9c7025fd81db32d  xf86-video-nv-2.1.21.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003196.html
+sha256  6218932db5c389878d853b11b8fbb667c321b65276f55aa6842a56fb1a30d288  xf86-video-nv-2.1.22.tar.xz
+sha512  a54767e9060404cafbb028ea36e582e8cfb7431a746cfc1d698c435fa73e41c4dfc12f84e50d002a582ac61e2d4c377f4defdf407250ee9e8656e5ff989b3cda  xf86-video-nv-2.1.22.tar.xz
 # Locally calculated
 sha256  10d10e1ec37594d481c3de8dda22a40b731ebd43be7ccd462baaa7394738a9f3  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 1e5fc26ddb..2aab60aaf9 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.21
-XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.22
+XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_NV_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NV_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
