Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD74C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 14:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BDF260E34;
	Sun, 11 Jun 2023 14:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BDF260E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxGg-XJInhFS; Sun, 11 Jun 2023 14:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9443F6114D;
	Sun, 11 Jun 2023 14:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9443F6114D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9C041BF3E8
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A364340493
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A364340493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJJ34132X3Fa for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 14:56:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB8640129
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FB8640129
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 14:56:23 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout10.t-online.de (Postfix) with SMTP id 739734D3E9
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 16:56:21 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8MUP-1x7DYv0; Sun, 11 Jun 2023 16:56:21 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8MUO-0001vD-2L
 for buildroot@buildroot.org; Sun, 11 Jun 2023 16:56:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 16:56:08 +0200
Message-Id: <20230611145617.758070-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611145617.758070-1-bernd.kuhls@t-online.de>
References: <20230611145617.758070-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686495381-43FF1266-2D563CA2/0/0 CLEAN NORMAL
X-TOI-MSGID: 012114a5-acd5-4969-8ec9-71c1d7d98c9a
Subject: [Buildroot] [PATCH 03/12] package/x11r7/xapp_setxkbmap: bump
 version to 1.3.4
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash | 6 +++---
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
index a57d7cc737..a3ad6ce38c 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003146.html
-sha256  b560c678da6930a0da267304fa3a41cc5df39a96a5e23d06f14984c87b6f587b  setxkbmap-1.3.3.tar.xz
-sha512  208f07a7f7bce47b573099d4cd8c941a3a4d74b456720bc3ca1cbba298381a2ab98c7500d6e6cd6d5dd61840b7c42cf6521da754ec395f266f8158102a55ad58  setxkbmap-1.3.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-May/003397.html
+sha256  be8d8554d40e981d1b93b5ff82497c9ad2259f59f675b38f1b5e84624c07fade  setxkbmap-1.3.4.tar.xz
+sha512  f4d026e7707656173f54d79b95ff3370ae06eaf252b89b79bc7175edeaf3ef79073d4d7d8a35fdee95608bf85d7d23514d74f00e55b613810ef6c3ccc0cf498b  setxkbmap-1.3.4.tar.xz
 # Locally computed
 sha256  afb8ce58340b6a6b85b73e256425263ce46f5a427279785e275991cb660cce82  COPYING
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index 4d48a3fbc1..9049b36944 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SETXKBMAP_VERSION = 1.3.3
+XAPP_SETXKBMAP_VERSION = 1.3.4
 XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.xz
 XAPP_SETXKBMAP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SETXKBMAP_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
