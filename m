Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511BFC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 051FD81AC4;
	Thu,  8 Dec 2022 22:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 051FD81AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgGOM5cV_xO0; Thu,  8 Dec 2022 22:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E5481F57;
	Thu,  8 Dec 2022 22:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E5481F57
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD781BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1028F40145
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1028F40145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLwY_V6UPs98 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F6E401D2
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21F6E401D2
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout02.t-online.de (Postfix) with SMTP id 671FE11E7A
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-0X2tPV0; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-36
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:31 +0100
Message-Id: <20221208223817.1088619-25-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-E20B2E65-187103D4/0/0 CLEAN NORMAL
X-TOI-MSGID: 1295089f-97ed-40f4-895d-77fbf9f19fe5
Subject: [Buildroot] [PATCH 24/70] package/x11r7/xapp_xcursorgen: bump
 version to 1.0.8
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

https://lists.x.org/archives/xorg-announce/2022-December/003264.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash | 8 +++-----
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
index 2f64671434..45bff55ed2 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-January/002936.html
-md5  25cc7ca1ce5dcbb61c2b471c55e686b5  xcursorgen-1.0.7.tar.bz2
-sha1  109367eb23b0ad52cf5de15f50c02ebe872698ae  xcursorgen-1.0.7.tar.bz2
-sha256  35b6f844b24f1776e9006c880a745728800764dbe3b327a128772b4610d8eb3d  xcursorgen-1.0.7.tar.bz2
-sha512  bd13ad23691d3daa2d5dcdc5902cf62e3dcb97a0289aff362e6cd85866a1d8cafb64f98800a75bfb4cf1f3c76244ca20201847dff594543d136d0abaec7011d2  xcursorgen-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003264.html
+sha256  32b33ce27b4e285e64ff375731806bb7988cc626ff10915c65f1dc4da640cc9b  xcursorgen-1.0.8.tar.xz
+sha512  dede5b9e1e09f9253365bbb83fdab26c681641913f3586cef52d4802db9cecc7e252344911cd969a873c3a5c5ebbd4b862f786de263f92ea1bcb2df90236f9c4  xcursorgen-1.0.8.tar.xz
 # Locally computed
 sha256  8c773336b654442ac8018715a52be1a8254895c57c898d5387016e9488cc2009  COPYING
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index bcc696b01c..318cd562db 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCURSORGEN_VERSION = 1.0.7
-XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
-XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCURSORGEN_VERSION = 1.0.8
+XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.xz
+XAPP_XCURSORGEN_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCURSORGEN_LICENSE = MIT
 XAPP_XCURSORGEN_LICENSE_FILES = COPYING
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
