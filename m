Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6C0C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 798A260B2F;
	Thu,  8 Dec 2022 22:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 798A260B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSvRns7fy2Yx; Thu,  8 Dec 2022 22:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DADE60A8D;
	Thu,  8 Dec 2022 22:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DADE60A8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 306A81BF96B
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04E51400FE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E51400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fLzR-VJOzOtg for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A489401B7
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A489401B7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 0EDEE5A5D
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-3PxxNm0; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-0h
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:50 +0100
Message-Id: <20221208223817.1088619-44-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-3C882535-B05A747B/0/0 CLEAN NORMAL
X-TOI-MSGID: c5db821f-6093-4477-8d7e-46ac26232f2d
Subject: [Buildroot] [PATCH 43/70] package/x11r7/xapp_xfsinfo: bump version
 to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2022-October/003238.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash | 8 +++-----
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
index dbdf8e0eda..7d5976473d 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002949.html
-md5  0060d6151427d9e570e54fc52a88e7d7  xfsinfo-1.0.6.tar.bz2
-sha1  cbfe7470179f1ab5eecf992226dc1b28902c6b4c  xfsinfo-1.0.6.tar.bz2
-sha256  8a3e8b9b9ae6ed571989d04e1846d39b9043e28f7623b500ebe1d47762c9b1d6  xfsinfo-1.0.6.tar.bz2
-sha512  901fc3817d7c95f2ba75ed0c51de91abd8efa67bbb93ad6b7d66e56a2f721af9db364e92f9ef2e719835fd48e934a5ea7402e5565c0ccd9b6b82633e869dc57b  xfsinfo-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003238.html
+sha256  92f3ca451cba7717eed15f80de3c123aa56c82a1ee7d6e9116ba513021b98874  xfsinfo-1.0.7.tar.xz
+sha512  1914916bf995c08a520bd009ddfa57c7e4a997a829380232d359f9bf68852c67650efb8f1fe3cc8a11889b2ec067f50ac38df711ffaf4536802a0b530dc1789c  xfsinfo-1.0.7.tar.xz
 # Locally computed
 sha256  bae01fa08f30f21f9cfb75e8339d081b34e5e03d12677177f85a55b0ca41d0db  COPYING
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index bef9787ffe..29e9fc75c4 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFSINFO_VERSION = 1.0.6
-XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.bz2
-XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFSINFO_VERSION = 1.0.7
+XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.xz
+XAPP_XFSINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFSINFO_LICENSE = MIT
 XAPP_XFSINFO_LICENSE_FILES = COPYING
 XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
