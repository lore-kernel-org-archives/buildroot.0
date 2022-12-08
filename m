Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED31C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEF3D401AF;
	Thu,  8 Dec 2022 22:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEF3D401AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vm0vBcRyjEbG; Thu,  8 Dec 2022 22:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0C3C40108;
	Thu,  8 Dec 2022 22:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0C3C40108
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AAC81BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89314820E8
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89314820E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izrwGQMJOlHW for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0052820DE
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0052820DE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout02.t-online.de (Postfix) with SMTP id 6A6BD11E7C
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-0lIgb40; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-22
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:12 +0100
Message-Id: <20221208223817.1088619-66-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-E20B2E65-177B05E9/0/0 CLEAN NORMAL
X-TOI-MSGID: 28ec033b-3593-433a-b324-0a0a153f470f
Subject: [Buildroot] [PATCH 65/70] package/x11r7/xapp_ico: bump version to
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

https://lists.x.org/archives/xorg-announce/2022-August/003205.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_ico/xapp_ico.hash | 8 +++-----
 package/x11r7/xapp_ico/xapp_ico.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_ico/xapp_ico.hash b/package/x11r7/xapp_ico/xapp_ico.hash
index a0970cd507..0258537fd5 100644
--- a/package/x11r7/xapp_ico/xapp_ico.hash
+++ b/package/x11r7/xapp_ico/xapp_ico.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002880.html
-md5  7895f2d109f4206b6d2db37257e07d12  ico-1.0.5.tar.bz2
-sha1  8759ec954375f3a1b37dc920a12790bfbfb0cad3  ico-1.0.5.tar.bz2
-sha256  d73b62f29eb98d850f16b76d759395180b860b613fbe1686b18eee99a6e3773f  ico-1.0.5.tar.bz2
-sha512  93a94a66d4a41b39d4b3657050e58f8269d352dae5d5916c9ecdda1cb14f23b9d159d67c50fdfa654b4b1c2ad11434bed140ace70703c82b05d3fe8686aab8f6  ico-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003205.html
+sha256  38f369d431e753280fde70fa489cc94ce204f9f8eabd2f49fc7d32afa69f4405  ico-1.0.6.tar.xz
+sha512  0ada451b8026ea10d1a5633f847b7bf833292e4cd01e3f1079d82c91fd142c06c6c4005b7146900ee34ac7acc8fd981db37ada9052dff49c2cfce995b9146c8c  ico-1.0.6.tar.xz
 # Locally computed
 sha256  97ef3a622f2f385cabfc8ab7aff13dc46468c10a5520670b5edfa33f2c3999eb  COPYING
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 8b0d4f90f3..56dbd64b38 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_ICO_VERSION = 1.0.5
-XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
-XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_ICO_VERSION = 1.0.6
+XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.xz
+XAPP_ICO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_ICO_LICENSE = MIT
 XAPP_ICO_LICENSE_FILES = COPYING
 XAPP_ICO_DEPENDENCIES = xlib_libX11
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
