Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AC9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C94F81CE9;
	Thu,  8 Dec 2022 22:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C94F81CE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2ooSWxftsqj; Thu,  8 Dec 2022 22:55:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BE8881358;
	Thu,  8 Dec 2022 22:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BE8881358
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E001F1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F55D404BA
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F55D404BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIwYi--5PCvw for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72296401D2
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72296401D2
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 207C85A61
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-3PxxNq0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-2n
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:00 +0100
Message-Id: <20221208223817.1088619-54-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-3C882535-B9676D21/0/0 CLEAN NORMAL
X-TOI-MSGID: 28fc7cae-0047-4764-b9dd-ef1b79cc0b01
Subject: [Buildroot] [PATCH 53/70] package/x11r7/xapp_xditview: bump version
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

https://lists.x.org/archives/xorg-announce/2022-October/003220.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xditview/xapp_xditview.hash | 8 +++-----
 package/x11r7/xapp_xditview/xapp_xditview.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xditview/xapp_xditview.hash b/package/x11r7/xapp_xditview/xapp_xditview.hash
index 4586c0b5a4..dbaf5e42b7 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.hash
+++ b/package/x11r7/xapp_xditview/xapp_xditview.hash
@@ -1,7 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002570.html
-md5  3a909116a3b2abe3845215cf49e09fa5  xditview-1.0.5.tar.bz2
-sha1  f06f65bca31168c86bcebd7f92dbbda08817a5cc  xditview-1.0.5.tar.bz2
-sha256  eecb1ed51ab4edc7f454476d1248cfb7799a17c5679b3dd834e8b4658331c04b  xditview-1.0.5.tar.bz2
-sha512  e20c903f38394b496111267e142d84d11e69a3b89f91869652d1f2ee5c997a13f90bfa2966651b42cd3979a330b348a6e397cc6a74c45b1f3f91643e7c06765d  xditview-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003220.html
+sha256  517700df205d4fdf65db182698157c959f1e7c10597670a7f45b1fcb2319819f  xditview-1.0.6.tar.xz
+sha512  249769d27980e9a69ac8f056f329dfa514f3ab6267d6ed69814c5695f315d2a7021c560a0e26fdd2568290a071793d7f2eafdd92f9981ed556047deb244ebf5a  xditview-1.0.6.tar.xz
 # Locally computed
 sha256  023d879308a49249181f78bbb567e93c45138ad847fe969d191e4802e7a1a005  COPYING
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 388710034c..8655bd3e92 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XDITVIEW_VERSION = 1.0.5
-XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
-XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDITVIEW_VERSION = 1.0.6
+XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.xz
+XAPP_XDITVIEW_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDITVIEW_LICENSE = MIT
 XAPP_XDITVIEW_LICENSE_FILES = COPYING
 XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
