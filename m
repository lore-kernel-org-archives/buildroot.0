Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07856C001B2
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A671741524;
	Thu,  8 Dec 2022 22:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A671741524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4w0zsJLoMga; Thu,  8 Dec 2022 22:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB7A40E46;
	Thu,  8 Dec 2022 22:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BB7A40E46
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F38751BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8309740145
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8309740145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5k6Xf1hAiK4q for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C1E3403E9
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C1E3403E9
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 13A405A60
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-3PxxNp0; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-1k
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:55 +0100
Message-Id: <20221208223817.1088619-49-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-3C882535-F02806EE/0/0 CLEAN NORMAL
X-TOI-MSGID: 939e573d-6dd7-4e56-b2cb-f5ededa86ca5
Subject: [Buildroot] [PATCH 48/70] package/x11r7/xcb-util-cursor: bump
 version to 0.1.4
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

https://lists.x.org/archives/xorg-announce/2022-October/003230.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-util-cursor/xcb-util-cursor.hash | 5 +++--
 package/x11r7/xcb-util-cursor/xcb-util-cursor.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
index 14cea17138..fc861fb4d9 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-May/002691.html
-sha1  26562eb6d4151307f7b6a53453d360ecfc0563ac  xcb-util-cursor-0.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003230.html
+sha256  28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb  xcb-util-cursor-0.1.4.tar.xz
+sha512 d27dd59a4d7ded9994dca77774421dd9533e3ee823b880af35d3219bd7340c89fbc61d1d0fa10e2991de2cac9e6395e09497769d7b8728eedc691e76649107b1  xcb-util-cursor-0.1.4.tar.xz
 # Locally computed
 sha256  0dde91ae1d443105dc9e13cbaed6674c36683b7095836ad9ddfce26be270aad5  COPYING
diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
index 07b37c5e47..0fb131693b 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XCB_UTIL_CURSOR_VERSION = 0.1.3
-XCB_UTIL_CURSOR_SITE = http://xcb.freedesktop.org/dist
-XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.bz2
+XCB_UTIL_CURSOR_VERSION = 0.1.4
+XCB_UTIL_CURSOR_SITE = https://xorg.freedesktop.org/archive/individual/lib
+XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.xz
 XCB_UTIL_CURSOR_LICENSE = MIT
 XCB_UTIL_CURSOR_LICENSE_FILES = COPYING
 XCB_UTIL_CURSOR_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
