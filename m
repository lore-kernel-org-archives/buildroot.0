Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C3AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51DEB418D1;
	Thu,  8 Dec 2022 22:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51DEB418D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w40gSYFiGD0G; Thu,  8 Dec 2022 22:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB086408BE;
	Thu,  8 Dec 2022 22:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB086408BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2874D1BF96B
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B80FD820D4
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B80FD820D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJCJaP9lGL7W for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87DE1820DE
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87DE1820DE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout12.t-online.de (Postfix) with SMTP id 5C83318AC2
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-2hBjc10; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-1a
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:39 +0100
Message-Id: <20221208223817.1088619-33-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-62A0A2DC-4554784F/0/0 CLEAN NORMAL
X-TOI-MSGID: 680914ce-1a90-4d29-817c-a5bec192f460
Subject: [Buildroot] [PATCH 32/70] package/x11r7/xapp_xkbevd: bump version
 to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2022-November/003255.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkbevd/xapp_xkbevd.hash | 5 +++--
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
index c3cf2f32b2..40b813fcf2 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002577.html
-sha256  2430a2e5302a4cb4a5530c1df8cb3721a149bbf8eb377a2898921a145197f96a  xkbevd-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003255.html
+sha256  38357b702de9d3457c4ff75053390f457b84c4accc7f088101255c37c684926b  xkbevd-1.1.5.tar.xz
+sha512  9e4a56484771e5eb5444fbd11e7d0bb952a2746eea79b84298e2000ada96896d501b886727c4ef08c120b5dcce550fca2d3e3dd762f4ca0327c38d9609961c5b  xkbevd-1.1.5.tar.xz
 # Locally computed
 sha256  38c6dbf8f88b1c920561ff3a4d1ffdb85c069c664f5f8b64a9adb477ef347b7c  COPYING
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 7a9a8fb18f..5b99e6967f 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKBEVD_VERSION = 1.1.4
-XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
-XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBEVD_VERSION = 1.1.5
+XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.xz
+XAPP_XKBEVD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBEVD_LICENSE = MIT
 XAPP_XKBEVD_LICENSE_FILES = COPYING
 XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
