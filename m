Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9F8C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A88380DCC;
	Thu,  8 Dec 2022 22:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A88380DCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpDLws2dTqob; Thu,  8 Dec 2022 22:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7642580D7E;
	Thu,  8 Dec 2022 22:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7642580D7E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0492F1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C932E41918
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C932E41918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QXL4FydpWep for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC8C41915
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFC8C41915
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout12.t-online.de (Postfix) with SMTP id 3306517C42
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:24 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd70.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-1iKQVP0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-0c
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:05 +0100
Message-Id: <20221208223817.1088619-59-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-48FF9689-6AE51FAA/0/0 CLEAN NORMAL
X-TOI-MSGID: 8fe9583f-36e0-49fc-b158-5eb4de529e3e
Subject: [Buildroot] [PATCH 58/70] package/x11r7/xlib_libXtst: bump version
 to 1.2.4
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

https://lists.x.org/archives/xorg-announce/2022-September/003214.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.hash | 5 +++--
 package/x11r7/xlib_libXtst/xlib_libXtst.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.hash b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
index f64a018567..7bdcdb9c17 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.hash
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002726.html
-sha256  4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204  libXtst-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-September/003214.html
+sha256  84f5f30b9254b4ffee14b5b0940e2622153b0d3aed8286a3c5b7eeb340ca33c8  libXtst-1.2.4.tar.xz
+sha512  f2f4e01239b892b8e26284cede90feb4fe7738beb243bca0f6adb349029f8bf87b5a482911edcd2401733c92ef78eec07fcd455b92e5b8c4828374769e60098d  libXtst-1.2.4.tar.xz
 # Locally computed
 sha256  940190489c7a0e5ae3d83fc4fcbd79e0cd1b765bf1a4efd408293c1ee0332ceb  COPYING
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index c79301e064..47103377aa 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXTST_VERSION = 1.2.3
-XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
-XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXTST_VERSION = 1.2.4
+XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.xz
+XLIB_LIBXTST_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXTST_LICENSE = MIT
 XLIB_LIBXTST_LICENSE_FILES = COPYING
 XLIB_LIBXTST_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
