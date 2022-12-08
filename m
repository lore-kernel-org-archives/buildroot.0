Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048CEC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D01414FA;
	Thu,  8 Dec 2022 22:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85D01414FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFW8RJN6yhnt; Thu,  8 Dec 2022 22:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AB0F410C6;
	Thu,  8 Dec 2022 22:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB0F410C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15C251BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B446F60A8D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B446F60A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dT7BwrIhup9V for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92B2260B43
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92B2260B43
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout02.t-online.de (Postfix) with SMTP id 5E9AF11E75
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PWz-0X2tPN0; Thu, 8 Dec 2022 23:38:17 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PWz-00048i-1d
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:09 +0100
Message-Id: <20221208223817.1088619-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E20B2E65-6D54FA40/0/0 CLEAN NORMAL
X-TOI-MSGID: d8409ca5-d76c-4e19-bbfb-462a852aa310
Subject: [Buildroot] [PATCH 02/70] package/x11r7/xlib_libICE: bump version
 to 1.1.1
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

https://lists.x.org/archives/xorg-announce/2022-December/003288.html
https://lists.x.org/archives/xorg-announce/2022-December/003274.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libICE/xlib_libICE.hash | 8 +++-----
 package/x11r7/xlib_libICE/xlib_libICE.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.hash b/package/x11r7/xlib_libICE/xlib_libICE.hash
index 2bfbe54788..4a58f97698 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.hash
+++ b/package/x11r7/xlib_libICE/xlib_libICE.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003006.html
-md5  76d77499ee7120a56566891ca2c0dbcf  libICE-1.0.10.tar.bz2
-sha1  5b5eb125d4f43a3ab8153b0f850963ee6c982c24  libICE-1.0.10.tar.bz2
-sha256  6f86dce12cf4bcaf5c37dddd8b1b64ed2ddf1ef7b218f22b9942595fb747c348  libICE-1.0.10.tar.bz2
-sha512  2f1ef2c32c833c71894a08fa7e7ed53f301f6c7bd22485d71c12884d8e8b36b99f362ec886349dcc84d08edc81c8b2cea035320831d64974edeba021b433c468  libICE-1.0.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003288.html
+sha256  03e77afaf72942c7ac02ccebb19034e6e20f456dcf8dddadfeb572aa5ad3e451  libICE-1.1.1.tar.xz
+sha512  2f7833a25f31cc743ca95cb88f9a8403b50e19ffb5bf43bfef87ba405857d359789daaa9ec2391351237d958f16d35dbf082adb76d301e46d3a54162a6b452d3  libICE-1.1.1.tar.xz
 # Locally computed
 sha256  60105b7ea93cb07a67fee8443b092b727e3db7f0dff4fbe05bc6cd7747fb53c8  COPYING
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 2b56aaab98..d92e81c0ab 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.0.10
-XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
+XLIB_LIBICE_VERSION = 1.1.1
+XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.xz
 XLIB_LIBICE_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBICE_LICENSE = MIT
 XLIB_LIBICE_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
