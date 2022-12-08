Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6ABC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4CF7403E9;
	Thu,  8 Dec 2022 22:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4CF7403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJSH0S2y61uv; Thu,  8 Dec 2022 22:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 911FD403A5;
	Thu,  8 Dec 2022 22:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 911FD403A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 220471BF96B
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 887FA820EE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 887FA820EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzAMCNZSfOhf for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B382820A7
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B382820A7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout12.t-online.de (Postfix) with SMTP id 314CC17C41
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:24 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd70.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-1iKQVO0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-2O
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:58 +0100
Message-Id: <20221208223817.1088619-52-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-48FF9689-97C9C871/0/0 CLEAN NORMAL
X-TOI-MSGID: 40ae523b-8d52-41db-9659-d9964716f4be
Subject: [Buildroot] [PATCH 51/70] package/x11r7/xapp_xkbprint: bump version
 to 1.0.6
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

https://lists.x.org/archives/xorg-announce/2022-October/003222.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkbprint/xapp_xkbprint.hash | 8 +++-----
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
index 69a80576c4..8ca7656b5c 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-November/003030.html
-md5  9c34da77363dc3d0f616980da87244bf  xkbprint-1.0.5.tar.bz2
-sha1  e707caffb3c680b3a869a776aa3f80caeac9e9c3  xkbprint-1.0.5.tar.bz2
-sha256  5b58fe834f0822f06d63d283fac404098c6d3f6acce61888b81016f1c41023fa  xkbprint-1.0.5.tar.bz2
-sha512  ac3870352f3a595b5b8a8cb64f39e9bea81b17572c73cfbf72482477a2f576d0ffcdcf735cb3c66b8a88a7fe0f7aece6738cbac87df5641e44fae1ab9b97111f  xkbprint-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003222.html
+sha256  99cc9404f7b90289ae04944c0d98a208cc8b158492ad6481386e31d4d09aa7b0  xkbprint-1.0.6.tar.xz
+sha512  a1c2401b2a2ef4c6bd2efc18923ecb176adcf38b6c5dfdce25f22f1f5ab21e25f494b25dac25b1765fb9a0f6acc24d191cd41b9a098a9e3c6eaf9a9df490be29  xkbprint-1.0.6.tar.xz
 # Locally computed
 sha256  79b32f28f7f5063054a564e1fdeee56f82a525b6516303704a1f70e55fe7197e  COPYING
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index 8643cb4276..f374c18dae 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKBPRINT_VERSION = 1.0.5
-XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
-XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBPRINT_VERSION = 1.0.6
+XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.xz
+XAPP_XKBPRINT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBPRINT_LICENSE = MIT
 XAPP_XKBPRINT_LICENSE_FILES = COPYING
 XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
