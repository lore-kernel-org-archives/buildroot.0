Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9E7C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC9281926;
	Thu,  8 Dec 2022 22:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DC9281926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i43scbWBxwgk; Thu,  8 Dec 2022 22:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FBC981403;
	Thu,  8 Dec 2022 22:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FBC981403
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22DAE1BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9418560B08
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9418560B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Z4sB5pbtzw6 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F4BB60B3A
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F4BB60B3A
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout02.t-online.de (Postfix) with SMTP id 603C311E77
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-0X2tPO0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PWz-00048i-24
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:11 +0100
Message-Id: <20221208223817.1088619-5-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E20B2E65-E163DF71/0/0 CLEAN NORMAL
X-TOI-MSGID: d12ce634-8fda-461c-a05c-45102e4e80d0
Subject: [Buildroot] [PATCH 04/70] package/x11r7/xlib_libxkbfile: bump
 version to 1.1.2
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

https://lists.x.org/archives/xorg-announce/2022-December/003286.html
https://lists.x.org/archives/xorg-announce/2022-October/003227.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash | 8 +++-----
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
index 3f2ffdf09a..7e6199f16b 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002977.html
-md5  dd7e1e946def674e78c0efbc5c7d5b3b  libxkbfile-1.1.0.tar.bz2
-sha1  487f314b6dbc17e93d0fe1e3741392156a9ca895  libxkbfile-1.1.0.tar.bz2
-sha256  758dbdaa20add2db4902df0b1b7c936564b7376c02a0acd1f2a331bd334b38c7  libxkbfile-1.1.0.tar.bz2
-sha512  1c6a57564e916ccdc3df3c49b9f3589f701df0cec55112c12ddc35ac3ed556608c28fe98e5ba0ac1962e9a65ed1e90eb7e6169b564951bf55a7cf3499b745826  libxkbfile-1.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003286.html
+sha256  b8a3784fac420b201718047cfb6c2d5ee7e8b9481564c2667b4215f6616644b1  libxkbfile-1.1.2.tar.xz
+sha512  0639fad7b64b36a85f8d24cdd40085e0ec18d7a671793b8b5c26449e9cc5a84c37117e7757fb1238ac353044935dd00013e42166de5af9dec428e873a47e598d  libxkbfile-1.1.2.tar.xz
 # Locally computed
 sha256  e1b3fdad8037ab3f986ef9caaa7c8da47d8d55875e680c7d6011f6c07363ea7c  COPYING
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 6b68496650..2e7f82922f 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXKBFILE_VERSION = 1.1.0
-XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.bz2
+XLIB_LIBXKBFILE_VERSION = 1.1.2
+XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.xz
 XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_LICENSE = MIT
 XLIB_LIBXKBFILE_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
