Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E04C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 20:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B50C819B4;
	Thu, 29 Dec 2022 20:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B50C819B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKiiLHBk7ODk; Thu, 29 Dec 2022 20:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D59088188A;
	Thu, 29 Dec 2022 20:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D59088188A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 093171BF386
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4C78408BF
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 20:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C78408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgqqdptbroFD for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 20:18:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 906FE408BA
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 906FE408BA
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 20:18:55 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout12.t-online.de (Postfix) with SMTP id 9489C3DC3
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 21:18:52 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pAzMU-20fTjl0; Thu, 29 Dec 2022 21:18:46 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46660)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pAzMU-0000Rc-1O
 for buildroot@buildroot.org; Thu, 29 Dec 2022 21:18:46 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 21:18:44 +0100
Message-Id: <20221229201846.3498030-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229201846.3498030-1-bernd.kuhls@t-online.de>
References: <20221229201846.3498030-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672345126-3AFEA81E-D16DBEA9/0/0 CLEAN NORMAL
X-TOI-MSGID: ab68a100-1409-4795-954d-de961047b153
Subject: [Buildroot] [PATCH 2/4] package/x11r7/xlib_libSM: bump version to
 1.2.4
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

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003307.html

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libSM/xlib_libSM.hash | 8 +++-----
 package/x11r7/xlib_libSM/xlib_libSM.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libSM/xlib_libSM.hash b/package/x11r7/xlib_libSM/xlib_libSM.hash
index 7ac288ba4e..3068c85b93 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.hash
+++ b/package/x11r7/xlib_libSM/xlib_libSM.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-October/002922.html
-md5  87c7fad1c1813517979184c8ccd76628  libSM-1.2.3.tar.bz2
-sha1  437d7b13fa2eba325df3a106f177df46ccec6546  libSM-1.2.3.tar.bz2
-sha256  2d264499dcb05f56438dee12a1b4b71d76736ce7ba7aa6efbf15ebb113769cbb  libSM-1.2.3.tar.bz2
-sha512  74c42e27029db78475e62025b4711dbac5e22d2f8e8a24be98a1c31b03c0fc4afe859928f851800ea0b76854f12147900dc4f27bbfd3d8ea45daaaf24b70a903  libSM-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003307.html
+sha256  fdcbe51e4d1276b1183da77a8a4e74a137ca203e0bcfb20972dd5f3347e97b84  libSM-1.2.4.tar.xz
+sha512  7f1d41b7b6c5dd456c49ccad7740c3ba9791a2793fa50fd94814a4164ce2e20c4a0a0ad42a87708e494ed5c23f611be6d3ccd9ef1e9add6d46ac545e2b0f6f86  libSM-1.2.4.tar.xz
 # Locally computed
 sha256  af7926a14d85ad367622688636e8c9c6f7807c8a6867536af1c530b5c262bfba  COPYING
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 708224e2d1..8e5c90127a 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBSM_VERSION = 1.2.3
-XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
-XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBSM_VERSION = 1.2.4
+XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.xz
+XLIB_LIBSM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBSM_LICENSE = MIT
 XLIB_LIBSM_LICENSE_FILES = COPYING
 XLIB_LIBSM_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
