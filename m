Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC5EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EBC3820F4;
	Thu,  8 Dec 2022 22:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EBC3820F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3w5qtoWg1GpL; Thu,  8 Dec 2022 22:42:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CE03820ED;
	Thu,  8 Dec 2022 22:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE03820ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2D11BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BECD820DE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BECD820DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaCDSbq5WdJq for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F58820E8
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6F58820E8
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout08.t-online.de (Postfix) with SMTP id D635B13759
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PWz-0XYn580; Thu, 8 Dec 2022 23:38:17 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PWz-00048i-2V
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:13 +0100
Message-Id: <20221208223817.1088619-7-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539097-E77DC07E-E0C9B0F2/0/0 CLEAN NORMAL
X-TOI-MSGID: 26bf203c-13c6-4081-8308-ee20068cf1b1
Subject: [Buildroot] [PATCH 06/70] package/x11r7/xlib_libXau: bump version
 to 1.0.11
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

https://lists.x.org/archives/xorg-announce/2022-December/003284.html
https://lists.x.org/archives/xorg-announce/2022-August/003201.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXau/xlib_libXau.hash | 8 +++-----
 package/x11r7/xlib_libXau/xlib_libXau.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXau/xlib_libXau.hash b/package/x11r7/xlib_libXau/xlib_libXau.hash
index 65ae54ec32..8d2a6ff43c 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.hash
+++ b/package/x11r7/xlib_libXau/xlib_libXau.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002942.html
-md5  c5f16288f2da9f071b29111d68797480  libXau-1.0.9.tar.bz2
-sha1  ef9b1ad00f958c8b6e30a1bbc11fdfac311c9733  libXau-1.0.9.tar.bz2
-sha256  ccf8cbf0dbf676faa2ea0a6d64bcc3b6746064722b606c8c52917ed00dcb73ec  libXau-1.0.9.tar.bz2
-sha512  3ca454ba466a807ea28b0f715066d73dc76ad312697b121d43e4d5766215052e9b7ffb8fe3ed3e496fa3f2a13f164ac692ff85cc428e26731b679f0f06a1d562  libXau-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003284.html
+sha256  f3fa3282f5570c3f6bd620244438dbfbdd580fc80f02f549587a0f8ab329bbeb  libXau-1.0.11.tar.xz
+sha512  f56abba3bef3fdd4739dfa69367a4251b5fab7c89194c9aece9efa66b9ebbf0736690cc9bd654aab19d9db377e4b9a5268c9c020b3d293bb5351bff5fe75a4dd  libXau-1.0.11.tar.xz
 # Locally computed
 sha256  56abe29bb1d9806a9e04fa9f80fed2c0f18027594df3f098148d814aef6bddfa  COPYING
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index bac10818f1..0e9f79d38d 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXAU_VERSION = 1.0.9
-XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
+XLIB_LIBXAU_VERSION = 1.0.11
+XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.xz
 XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_LICENSE = MIT
 XLIB_LIBXAU_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
