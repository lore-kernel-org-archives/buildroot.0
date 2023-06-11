Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A4AC7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 14:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84C77611CA;
	Sun, 11 Jun 2023 14:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84C77611CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmP6V0KzHT8k; Sun, 11 Jun 2023 14:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A500D611A4;
	Sun, 11 Jun 2023 14:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A500D611A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6E41BF3E8
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09031400C1
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09031400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGVncLMuSzV8 for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 14:56:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE2FC40488
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE2FC40488
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 14:56:23 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout10.t-online.de (Postfix) with SMTP id 71D5D4D3E8
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 16:56:21 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8MUO-1woWEj0; Sun, 11 Jun 2023 16:56:21 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8MUO-0001vD-27
 for buildroot@buildroot.org; Sun, 11 Jun 2023 16:56:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 16:56:07 +0200
Message-Id: <20230611145617.758070-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611145617.758070-1-bernd.kuhls@t-online.de>
References: <20230611145617.758070-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686495381-43FF1266-22AA49CD/0/0 CLEAN NORMAL
X-TOI-MSGID: 96cd17ab-6d0e-499d-80d9-a5d2c4c9e50d
Subject: [Buildroot] [PATCH 02/12] package/x11r7/xdriver_xf86-video-i128:
 bump version to 1.4.1
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

Release notes:
https://lists.x.org/archives/xorg-announce/2023-May/003395.html

Switched tarball to xz and _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash  | 8 +++-----
 .../xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk    | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
index 96bd42ac36..c17d3086a1 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-December/002932.html
-md5  a980f1b8532ccfe81932580bc4e0f2a0  xf86-video-i128-1.4.0.tar.bz2
-sha1  56d5b897b2695222c13e59d2ade74620a99e1011  xf86-video-i128-1.4.0.tar.bz2
-sha256  8f2c0a6bf5a169dad3fc07c6dd4537b492d0e44489e4a1297311e617c3bed0ea  xf86-video-i128-1.4.0.tar.bz2
-sha512  d58baee3f20b3ad2ece6853da0ff20a6d54b984c6e3289bad2715cc003b277a0b44d20ded25cfc116400468df552390bdb5d80fbd3fb60861488ee5d027664b2  xf86-video-i128-1.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-May/003395.html
+sha256  7064b513ffe33efa040577c4d355ce2c76ed218989ab38feb8972750d5acbc46  xf86-video-i128-1.4.1.tar.xz
+sha512  ec6b4dd9092292b5aabff7cf477090fe62c89944d251689817ac8114a65672f85880b719a442f4c742d63dc2d6c61ec315e53da5b5c625074d1aa0b9ace8e865  xf86-video-i128-1.4.1.tar.xz
 # Locally computed
 sha256  7677424d79633dbf255a81bd4e05dd621931b89997af33c31522269ec2ed391e  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index e44deaf621..266678105c 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_I128_VERSION = 1.4.0
-XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_I128_VERSION = 1.4.1
+XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_I128_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_I128_LICENSE = MIT
 XDRIVER_XF86_VIDEO_I128_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
