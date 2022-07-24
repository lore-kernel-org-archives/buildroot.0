Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1F4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2474611A1;
	Sun, 24 Jul 2022 16:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2474611A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3PS1gk4tzoRJ; Sun, 24 Jul 2022 16:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA3A76117A;
	Sun, 24 Jul 2022 16:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA3A76117A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 354321BF96B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EBB284970
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EBB284970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SI6GLqZwpu-N for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 870828492E
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 870828492E
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:06 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 420E012DF0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:04 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePc-3I37570; Sun, 24 Jul 2022 18:25:00 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePc-0007mb-0k;
 Sun, 24 Jul 2022 18:25:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:41 +0200
Message-Id: <20220724162500.2683871-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679900-0144CFA9-F1509DC9/0/0 CLEAN NORMAL
X-TOI-MSGID: cc094514-4f38-4c68-bef1-b2fb4984bfe9
Subject: [Buildroot] [PATCH 01/20] package/x11r7/xapp_xclipboard: bump
 version to 1.1.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.hash | 5 +++--
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
index ef45b92891..d848a47342 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002299.html
-sha256  9c0e0a1f4f1d49f73c6cf3ccd27b5ca0e18afc63679f1a1ee466b1d82446ebb5  xclipboard-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003171.html
+sha256  f43d4560d1464e8ff58e850212f6bdb703989b66d599fb61f351b5f9e077f253  xclipboard-1.1.4.tar.xz
+sha512  efa7800e0c4fb0242362c4263d80182d591bded07d1064a36b157b6202b15b0c82f083658ced2b82392eca905fb57c04a537d67e75c1237a1667ed2ce0cb09fe  xclipboard-1.1.4.tar.xz
 # Locally computed
 sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index d77ac98621..c76d5ded3c 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCLIPBOARD_VERSION = 1.1.3
-XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
-XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLIPBOARD_VERSION = 1.1.4
+XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.xz
+XAPP_XCLIPBOARD_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLIPBOARD_LICENSE = MIT
 XAPP_XCLIPBOARD_LICENSE_FILES = COPYING
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw xlib_libXmu xlib_libXt
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
