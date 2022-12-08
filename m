Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00A9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74D5440145;
	Thu,  8 Dec 2022 22:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D5440145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uaxCmmHwU38T; Thu,  8 Dec 2022 22:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BA6A40465;
	Thu,  8 Dec 2022 22:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BA6A40465
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28F571BF96B
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE7D860A8D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE7D860A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tYo3h0IDNVG3 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EBC560B3A
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EBC560B3A
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout03.t-online.de (Postfix) with SMTP id DA4DD1ABAD
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:22 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-325S450; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-0H
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:48 +0100
Message-Id: <20221208223817.1088619-42-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-D924D9D3-C00D498B/0/0 CLEAN NORMAL
X-TOI-MSGID: 35e491ac-2475-48a9-8627-d00311f63373
Subject: [Buildroot] [PATCH 41/70] package/x11r7/xapp_xsetroot: bump version
 to 1.1.3
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

https://lists.x.org/archives/xorg-announce/2022-October/003240.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xsetroot/xapp_xsetroot.hash | 8 +++-----
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
index 32294c1f3d..43f7cd66d0 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002874.html
-md5  5fe769c8777a6e873ed1305e4ce2c353  xsetroot-1.1.2.tar.bz2
-sha1  42ab81761823b44974feab86477007c49dbace50  xsetroot-1.1.2.tar.bz2
-sha256  10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c  xsetroot-1.1.2.tar.bz2
-sha512  0b9df1b72305e5c24f1e1664578aa4411a5ffcdc5d318458117594e641f01c34700205b0d16c08abf4a8106d36128ccdbe1ea1f1035fce9018d6b52801a8b72b  xsetroot-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003240.html
+sha256  6081b45a9eb4426e045d259d1e144b32417fb635e5b96aa90647365ac96638d1  xsetroot-1.1.3.tar.xz
+sha512  f333d1bfd92bb943044da36331ae2cf68a811c8f3891719d9ebc1749e2dd0c67068f86face0794c3c4ae584c4dd189bad4998dccb38fe1ac37a8921e5713e7c0  xsetroot-1.1.3.tar.xz
 # Locally computed
 sha256  48e9c9572e0dc1c14b93b753542f780e7751dd7f035816374d8a8be0211a4520  COPYING
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 98ba344cfa..1ffbb2b6b0 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XSETROOT_VERSION = 1.1.2
-XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
-XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSETROOT_VERSION = 1.1.3
+XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.xz
+XAPP_XSETROOT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XSETROOT_LICENSE = MIT
 XAPP_XSETROOT_LICENSE_FILES = COPYING
 XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXcursor xdata_xbitmaps
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
