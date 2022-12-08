Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1F2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99B5B410A1;
	Thu,  8 Dec 2022 22:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99B5B410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xc1bPizf39rb; Thu,  8 Dec 2022 22:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4347D40933;
	Thu,  8 Dec 2022 22:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4347D40933
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6C61BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30D82820EB
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D82820EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BhG9H2AFi79 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BCE7820D4
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BCE7820D4
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 083CB5A59
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-3PxxNi0; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-2d
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:44 +0100
Message-Id: <20221208223817.1088619-38-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-3C882535-7B5C4819/0/0 CLEAN NORMAL
X-TOI-MSGID: 392a411e-1a27-48f9-92f3-bab3d532f2de
Subject: [Buildroot] [PATCH 37/70] package/x11r7/xlib_libXinerama: bump
 version to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2022-October/003244.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXinerama/xlib_libXinerama.hash | 8 +++-----
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash b/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
index ca4081d375..e3ac880b39 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-July/002905.html
-md5  0d5f826a197dae74da67af4a9ef35885  libXinerama-1.1.4.tar.bz2
-sha1  34a1d9908ffbd46805d2357c6b05f5e341a8dc7c  libXinerama-1.1.4.tar.bz2
-sha256  0008dbd7ecf717e1e507eed1856ab0d9cf946d03201b85d5dcf61489bb02d720  libXinerama-1.1.4.tar.bz2
-sha512  cff777ad942614fbf6bc6d8529f399e62debf3ecbf6cc0694a94e38c022bf929ffd5636fb59f55533c394d89b23af3ea51fa5128927f12a85787e16239330f14  libXinerama-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003244.html
+sha256  5094d1f0fcc1828cb1696d0d39d9e866ae32520c54d01f618f1a3c1e30c2085c  libXinerama-1.1.5.tar.xz
+sha512  735b5320de4782005b379e409bf2f976131c17d496b297d33a0e127ca1443034778586b6b25c077b2ad73a4ab34d440d7510475e0041f38202bb40f15fb08ff7  libXinerama-1.1.5.tar.xz
 # Locally computed
 sha256  f661fd883b6e980b3b118e0fbe230fbf10eef8d4d4a35931355f29ed647ddbe3  COPYING
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index 48e32d55e2..67e3398c71 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXINERAMA_VERSION = 1.1.4
-XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
-XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXINERAMA_VERSION = 1.1.5
+XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.xz
+XLIB_LIBXINERAMA_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXINERAMA_LICENSE = MIT
 XLIB_LIBXINERAMA_LICENSE_FILES = COPYING
 XLIB_LIBXINERAMA_CPE_ID_VENDOR = x
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
