Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C32C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD953403E9;
	Thu,  8 Dec 2022 22:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD953403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RAcCbf9oHIK8; Thu,  8 Dec 2022 22:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A75BD401B7;
	Thu,  8 Dec 2022 22:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A75BD401B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E13D91BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41847418BD
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41847418BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ux6gXlep7FsL for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FFE041915
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FFE041915
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout08.t-online.de (Postfix) with SMTP id D7EB61375C
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-0XYn590; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PWz-00048i-2v
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:15 +0100
Message-Id: <20221208223817.1088619-9-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E77DC07E-4C3F9590/0/0 CLEAN NORMAL
X-TOI-MSGID: 01a71ac5-b92e-4b22-b5a0-bacaeaba7c32
Subject: [Buildroot] [PATCH 08/70] package/x11r7/xlib_libXxf86dga: bump
 version to 1.1.6
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

https://lists.x.org/archives/xorg-announce/2022-December/003281.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash | 8 +++-----
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
index 1b05624783..9057d4e8e2 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002982.html
-md5  0ddeafc13b33086357cfa96fae41ee8e  libXxf86dga-1.1.5.tar.bz2
-sha1  332ba80d1b3d06473f7bbfe1612e7c5b58fbdf69  libXxf86dga-1.1.5.tar.bz2
-sha256  2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203  libXxf86dga-1.1.5.tar.bz2
-sha512  0e77c4003aeba737b10c17d55aeefa935fc57c4ba9e8f79a834f3f8c690d6a1d98f69ad707eded784346c1cf40c41829719d257283b5eae3207147fb4c79ed89  libXxf86dga-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003281.html
+sha256  be44427579808fe3a217d59f51cae756a26913eb6e4c8738ccab65ff56d7980f  libXxf86dga-1.1.6.tar.xz
+sha512  61f7954471df63840ffb5e82347018e285d30d64d4d0a97770ca031c8554a0f52d1b007ab8342a283cd2f0d534f564fb59f57ec92515714f20a7d145912c65d9  libXxf86dga-1.1.6.tar.xz
 # Locally computed
 sha256  dd27933ebc5c063128b158b085e4c442a36b0e6f704cf753116da119610191da  COPYING
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index a5173fbc7c..1094e1a1ad 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86DGA_VERSION = 1.1.5
-XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
+XLIB_LIBXXF86DGA_VERSION = 1.1.6
+XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.xz
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_LICENSE = MIT
 XLIB_LIBXXF86DGA_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
