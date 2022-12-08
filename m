Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452CBC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1A5D408AD;
	Thu,  8 Dec 2022 22:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1A5D408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ha4TyyY6rcIP; Thu,  8 Dec 2022 22:46:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64501408BB;
	Thu,  8 Dec 2022 22:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64501408BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29C4E1BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E87560A8D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E87560A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulLkl4g7ZNgU for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61CA960B08
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61CA960B08
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:32 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout11.t-online.de (Postfix) with SMTP id 90698246C6
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-21qtnN0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-1R
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:09 +0100
Message-Id: <20221208223817.1088619-63-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-C13271D1-87531438/0/0 CLEAN NORMAL
X-TOI-MSGID: 8dc4655a-9198-4670-842b-f65d9bacabdb
Subject: [Buildroot] [PATCH 62/70] package/x11r7/xapp_xmh: bump version to
 1.0.4
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

https://lists.x.org/archives/xorg-announce/2022-August/003208.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xmh/xapp_xmh.hash | 5 +++--
 package/x11r7/xapp_xmh/xapp_xmh.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xmh/xapp_xmh.hash b/package/x11r7/xapp_xmh/xapp_xmh.hash
index 1dadc34586..f0c9fa9567 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.hash
+++ b/package/x11r7/xapp_xmh/xapp_xmh.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002582.html
-sha256  b92f4f912a5fb6346d52cc2b639aea087b347f3b2e4e1a4fc7a165b1345f5689  xmh-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003208.html
+sha256  e82c425a4c4156eee2e344d2e952f3fd816e03973005cd656ec1e9acf6f329db  xmh-1.0.4.tar.xz
+sha512  03bba7d3e7c2070b03378335aed0188dd0fd0a488f19dc5ad3f26674a9b38e6599377d082328041dd3ab72123ed60acae32cff19d7149517545b80e1339db26a  xmh-1.0.4.tar.xz
 # Locally computed
 sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index c18bbfe5da..db6102eb75 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMH_VERSION = 1.0.3
-XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
-XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMH_VERSION = 1.0.4
+XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.xz
+XAPP_XMH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMH_LICENSE = MIT
 XAPP_XMH_LICENSE_FILES = COPYING
 XAPP_XMH_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
