Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F136EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 990B660AD7;
	Thu,  8 Dec 2022 22:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 990B660AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8AqE-hqvfdE; Thu,  8 Dec 2022 22:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9087760A8D;
	Thu,  8 Dec 2022 22:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9087760A8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87DC51BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A39ED400FE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A39ED400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjAHKpgewyJf for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46F03401B7
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46F03401B7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 107385A5E
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-3PxxNn0; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-1K
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:53 +0100
Message-Id: <20221208223817.1088619-47-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-3C882535-3D505600/0/0 CLEAN NORMAL
X-TOI-MSGID: 78401ade-a62f-48d0-a4f7-b15b6b689f94
Subject: [Buildroot] [PATCH 46/70] package/x11r7/xcb-util-keysyms: bump
 version to 0.4.1
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

https://lists.x.org/archives/xorg-announce/2022-October/003233.html

Added license file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash |  7 +++++--
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk   | 10 ++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
index 6437d070f4..20a341ca22 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
@@ -1,2 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-October/002485.html
-sha256  0ef8490ff1dede52b7de533158547f8b454b241aa3e4dcca369507f66f216dd9  xcb-util-keysyms-0.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003233.html
+sha256  7c260a5294412aed429df1da2f8afd3bd07b7cba3fec772fba15a613a6d5c638  xcb-util-keysyms-0.4.1.tar.xz
+sha512  dd53a36b52647f22bf0da8cded4b2974a51899eaac799797017ed8534f14bc2d2d339a14fa5ef387ae4528b7d9a5d31920bb0c71b09ca34f58e5081e768e2bbf  xcb-util-keysyms-0.4.1.tar.xz
+# Locally computed
+sha256  d499c1bf2c2a5f0a0498e5204d998388e308dcf2273dfbe2250a5b9a73f66537  COPYING
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 9036b06fe8..364dc5b6da 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-XCB_UTIL_KEYSYMS_VERSION = 0.4.0
-XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.bz2
-XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist
-
-# unfortunately, no license file
+XCB_UTIL_KEYSYMS_VERSION = 0.4.1
+XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.xz
+XCB_UTIL_KEYSYMS_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XCB_UTIL_KEYSYMS_LICENSE = MIT
-
+XCB_UTIL_KEYSYMS_LICENSE_FILES = COPYING
 XCB_UTIL_KEYSYMS_INSTALL_STAGING = YES
 
 XCB_UTIL_KEYSYMS_DEPENDENCIES = host-pkgconf libxcb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
