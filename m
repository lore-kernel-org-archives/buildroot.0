Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C65C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9B040213;
	Thu,  8 Dec 2022 22:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9B040213
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_kyqsd6BRDZ; Thu,  8 Dec 2022 22:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F29F401A2;
	Thu,  8 Dec 2022 22:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F29F401A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB7E41BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83F4960B08
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83F4960B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cofo75o1P4Hg for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0A4560A8D
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0A4560A8D
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:22 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout07.t-online.de (Postfix) with SMTP id DA8DC13ACF
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:19 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-3PxxNh0; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-1N
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:38 +0100
Message-Id: <20221208223817.1088619-32-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-3C882535-D500EA5A/0/0 CLEAN NORMAL
X-TOI-MSGID: 5ca6f06c-8f06-46ae-8cd9-a71c4c7cb5e4
Subject: [Buildroot] [PATCH 31/70] package/x11r7/xapp_xkill: bump version to
 1.0.6
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

https://lists.x.org/archives/xorg-announce/2022-November/003256.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkill/xapp_xkill.hash | 8 +++-----
 package/x11r7/xapp_xkill/xapp_xkill.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xkill/xapp_xkill.hash b/package/x11r7/xapp_xkill/xapp_xkill.hash
index 911a28d0b6..8cee05d871 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.hash
+++ b/package/x11r7/xapp_xkill/xapp_xkill.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002864.html
-md5  938177e4472c346cf031c1aefd8934fc  xkill-1.0.5.tar.bz2
-sha1  c5ee06b33adb252a41e4f737be6bd47651ff582a  xkill-1.0.5.tar.bz2
-sha256  c5f0bb6a95e1ac7c4def8a657496d5d2f21ccd41eb47ef2c9ccb03fb6d6aff6b  xkill-1.0.5.tar.bz2
-sha512  4603a1794f114f5cea2c885020c9d073c8421d1e785c99ff6b936ae97139c8dac8020a187b5bbd0fa6d56ed6fab879441b42ba900cc5f2f5a534dafdc86b9249  xkill-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003256.html
+sha256  e5a8aa78c475677b11504646da8d93dacc30744258076a2ca418a24438aeb907  xkill-1.0.6.tar.xz
+sha512  a755a8db51d7860b9942161776390007b9b530c2f7fcf8ddb3383311d36d185a6f08a44c5f6f7735576b146902e66aca21cbd7e746c1289d035e79332e8173b6  xkill-1.0.6.tar.xz
 # Locally computed
 sha256  13306c3890e4c8710bc468dee0eba7f9677cd94c7a67d2d81fa932d4f635b21f  COPYING
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 64ddbca694..84dad0b5c7 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKILL_VERSION = 1.0.5
-XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
-XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKILL_VERSION = 1.0.6
+XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.xz
+XAPP_XKILL_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKILL_LICENSE = MIT
 XAPP_XKILL_LICENSE_FILES = COPYING
 XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
