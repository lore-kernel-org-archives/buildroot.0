Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F6EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BABD9403A5;
	Thu,  8 Dec 2022 22:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BABD9403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyUAlBuVxYHW; Thu,  8 Dec 2022 22:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94021401B7;
	Thu,  8 Dec 2022 22:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94021401B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 504171BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 020D860B08
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 020D860B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tX1SlAvnIdgk for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06E9060B2F
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06E9060B2F
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:31 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout11.t-online.de (Postfix) with SMTP id 8E689246C3
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-1y2xpi0; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-1X
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:54 +0100
Message-Id: <20221208223817.1088619-48-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-C13271D1-EFAF79EA/0/0 CLEAN NORMAL
X-TOI-MSGID: 31b1f5da-8ea6-493f-b0b9-2a502bae28d5
Subject: [Buildroot] [PATCH 47/70] package/x11r7/xcb-util-image: bump
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

https://lists.x.org/archives/xorg-announce/2022-October/003231.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-util-image/xcb-util-image.hash | 5 +++--
 package/x11r7/xcb-util-image/xcb-util-image.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xcb-util-image/xcb-util-image.hash b/package/x11r7/xcb-util-image/xcb-util-image.hash
index b2c42d6899..e200853e47 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.hash
+++ b/package/x11r7/xcb-util-image/xcb-util-image.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-October/002489.html
-sha256  2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc  xcb-util-image-0.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003231.html
+sha256  ccad8ee5dadb1271fd4727ad14d9bd77a64e505608766c4e98267d9aede40d3d  xcb-util-image-0.4.1.tar.xz
+sha512  9b47ba38b91196d76541b6ccabeaf291d3b91036f15422909cd6a79b3fd1a9786d5b1728e411bc41cfdf3d60a253485f4ef7c65ffa6ae646fa93439ec782746e  xcb-util-image-0.4.1.tar.xz
 # License file, locally calculated
 sha256  19672c6153d8c4870abe734fa4dd2197481a311f4788d02ad729be07e116b26b  COPYING
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
index 8ddb0be86d..446d545ef2 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.mk
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XCB_UTIL_IMAGE_VERSION = 0.4.0
-XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist
-XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.bz2
+XCB_UTIL_IMAGE_VERSION = 0.4.1
+XCB_UTIL_IMAGE_SITE = https://xorg.freedesktop.org/archive/individual/lib
+XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.xz
 XCB_UTIL_IMAGE_INSTALL_STAGING = YES
 XCB_UTIL_IMAGE_LICENSE = MIT
 XCB_UTIL_IMAGE_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
