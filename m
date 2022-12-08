Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D576C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2768940302;
	Thu,  8 Dec 2022 22:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2768940302
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8l2uznvmGMw; Thu,  8 Dec 2022 22:41:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA2FA402C1;
	Thu,  8 Dec 2022 22:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA2FA402C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52E151BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9C8B60B2F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9C8B60B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xa02aXBiDTzL for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02F9D60B08
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02F9D60B08
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout08.t-online.de (Postfix) with SMTP id DB3CA13760
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-0XYn5B0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PWz-00048i-1q
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:10 +0100
Message-Id: <20221208223817.1088619-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E77DC07E-14A0B6DA/0/0 CLEAN NORMAL
X-TOI-MSGID: f0444354-16ba-4c11-83b1-fccd0e4dc063
Subject: [Buildroot] [PATCH 03/70] package/x11r7/xlib_libxshmfence: bump
 version to 1.3.2
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

https://lists.x.org/archives/xorg-announce/2022-December/003287.html
https://lists.x.org/archives/xorg-announce/2022-October/003229.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash | 8 +++-----
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
index 3ec055a792..e8f83d427f 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-February/002840.html
-md5  42dda8016943dc12aff2c03a036e0937  libxshmfence-1.3.tar.bz2
-sha1  3472218fc0e8ee8183533d22dbcd4bbe90bf3ab8  libxshmfence-1.3.tar.bz2
-sha256  b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7  libxshmfence-1.3.tar.bz2
-sha512  c446e055f8fac62b9aa266132289a4cfc030282147974c45ce96d1768a98d1afb997470e58e4a68513174c404cbf373bdde2f0cd4b34abdbce1d89dd0b6fe2b7  libxshmfence-1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003287.html
+sha256  870df257bc40b126d91b5a8f1da6ca8a524555268c50b59c0acd1a27f361606f  libxshmfence-1.3.2.tar.xz
+sha512  e20a6827e370726cf50489a69f4a52b897f1c44e3eba8c72a4e626b08724e877d090770b8016765736d887d5d5eaba1fda9c29066e62d259b4d1e2064bc1626c  libxshmfence-1.3.2.tar.xz
 # Locally computed
 sha256  64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index 605408fff7..4241102855 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXSHMFENCE_VERSION = 1.3
-XLIB_LIBXSHMFENCE_SOURCE = libxshmfence-$(XLIB_LIBXSHMFENCE_VERSION).tar.bz2
+XLIB_LIBXSHMFENCE_VERSION = 1.3.2
+XLIB_LIBXSHMFENCE_SOURCE = libxshmfence-$(XLIB_LIBXSHMFENCE_VERSION).tar.xz
 XLIB_LIBXSHMFENCE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSHMFENCE_LICENSE = MIT
 XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
