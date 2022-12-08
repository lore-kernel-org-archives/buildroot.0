Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B9FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88E238186E;
	Thu,  8 Dec 2022 22:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88E238186E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtvSJ9inGX8T; Thu,  8 Dec 2022 22:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C2F0812BA;
	Thu,  8 Dec 2022 22:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C2F0812BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 188151BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E542960B3A
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E542960B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OaBNVh7sPcYe for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0F4460A8D
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0F4460A8D
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:31 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout11.t-online.de (Postfix) with SMTP id 8D649246C2
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-1y2xph0; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-17
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:52 +0100
Message-Id: <20221208223817.1088619-46-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-C1B201D1-BC20068F/0/0 CLEAN NORMAL
X-TOI-MSGID: e3f91551-2b55-4915-a73b-e7348c9c4b35
Subject: [Buildroot] [PATCH 45/70] package/x11r7/xcb-util-renderutil: bump
 version to 0.3.10
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

https://lists.x.org/archives/xorg-announce/2022-October/003234.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash | 5 +++--
 package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
index 19ed9d4640..cb3ed55cea 100644
--- a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
+++ b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-June/002446.html
-sha256  c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b  xcb-util-renderutil-0.3.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003234.html
+sha256  3e15d4f0e22d8ddbfbb9f5d77db43eacd7a304029bf25a6166cc63caa96d04ba  xcb-util-renderutil-0.3.10.tar.xz
+sha512  9cfa9201be2df7c0b832e1e1fe506e7c7a1e0f2b1b1d4a4b58620eadc241190a36478fa3ea27c32047fa79bf199f17dcd0b106853dbf5eda8cd584f3fc2b0c15  xcb-util-renderutil-0.3.10.tar.xz
 # Locally computed
 sha256  271169dd66674e9c396697af0b4822d1c59ccd2342b7740864d667a02963068b  COPYING
diff --git a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
index 9e6683bf3a..d15d19f7e2 100644
--- a/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
+++ b/package/x11r7/xcb-util-renderutil/xcb-util-renderutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XCB_UTIL_RENDERUTIL_VERSION = 0.3.9
-XCB_UTIL_RENDERUTIL_SITE = http://xcb.freedesktop.org/dist
-XCB_UTIL_RENDERUTIL_SOURCE = xcb-util-renderutil-$(XCB_UTIL_RENDERUTIL_VERSION).tar.bz2
+XCB_UTIL_RENDERUTIL_VERSION = 0.3.10
+XCB_UTIL_RENDERUTIL_SITE = https://xorg.freedesktop.org/archive/individual/lib
+XCB_UTIL_RENDERUTIL_SOURCE = xcb-util-renderutil-$(XCB_UTIL_RENDERUTIL_VERSION).tar.xz
 XCB_UTIL_RENDERUTIL_LICENSE = MIT
 XCB_UTIL_RENDERUTIL_LICENSE_FILES = COPYING
 XCB_UTIL_RENDERUTIL_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
