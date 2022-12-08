Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915C2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4483660B2F;
	Thu,  8 Dec 2022 22:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4483660B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_1Y2w2_Rv66; Thu,  8 Dec 2022 22:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F7960AD7;
	Thu,  8 Dec 2022 22:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F7960AD7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4491BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 140E541914
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 140E541914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXwCQo8RmjPI for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAC70418BD
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAC70418BD
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout08.t-online.de (Postfix) with SMTP id D9A001375E
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-0XYn5A0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-07
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:17 +0100
Message-Id: <20221208223817.1088619-11-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E77DC07E-03BBAA23/0/0 CLEAN NORMAL
X-TOI-MSGID: de98572d-efba-4851-b235-a70170b728fe
Subject: [Buildroot] [PATCH 10/70] package/x11r7/xlib_libXScrnSaver: bump
 version to 1.2.4
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

https://lists.x.org/archives/xorg-announce/2022-December/003279.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash | 8 +++-----
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
index 01f468b77a..a32997e1fe 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-July/002906.html
-md5  eeea9d5af3e6c143d0ea1721d27a5e49  libXScrnSaver-1.2.3.tar.bz2
-sha1  70c791c5755a298ecf1a0823e239a24fa4b2b42f  libXScrnSaver-1.2.3.tar.bz2
-sha256  f917075a1b7b5a38d67a8b0238eaab14acd2557679835b154cf2bca576e89bf8  libXScrnSaver-1.2.3.tar.bz2
-sha512  7ea628324a11b25ee82c7b11c6bf98f37de219354de51c1e29467b5de422669ba1ab121f3b9dc674093c8f3960e93c5d5428122f5539092f79bc8451c768354a  libXScrnSaver-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003279.html
+sha256  75cd2859f38e207a090cac980d76bc71e9da99d48d09703584e00585abc920fe  libXScrnSaver-1.2.4.tar.xz
+sha512  e4395af85f8496618afb23ffdaca1a75f5e3d213478d8dc73249cbc9840d7b993ba7513dbf6015cb38b48fe3f2223496365158a148dd5e1ac7475c5ee569e28c  libXScrnSaver-1.2.4.tar.xz
 # Locally computed
 sha256  5cf3e16f5dd753a4c0853e8227134ab65f5562d9ef89b1a2d7681f5c8ac9feb5  COPYING
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 92abb902eb..55ae7a6801 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXSCRNSAVER_VERSION = 1.2.3
-XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
-XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.4
+XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.xz
+XLIB_LIBXSCRNSAVER_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXSCRNSAVER_LICENSE = MIT
 XLIB_LIBXSCRNSAVER_LICENSE_FILES = COPYING
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
