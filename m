Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C094C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2632A60A72;
	Thu,  8 Dec 2022 22:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2632A60A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThoNri-nyubf; Thu,  8 Dec 2022 22:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2610860A8D;
	Thu,  8 Dec 2022 22:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2610860A8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62A591BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA1EA400FE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA1EA400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oegkmV_x0bpB for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE2940145
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DE2940145
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout02.t-online.de (Postfix) with SMTP id 6399E11E79
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX0-0X2tPS0; Thu, 8 Dec 2022 23:38:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX0-00048i-1c
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:24 +0100
Message-Id: <20221208223817.1088619-18-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539098-E20B2E65-3E661B7A/0/0 CLEAN NORMAL
X-TOI-MSGID: a0a6c6e8-3547-41ea-9985-3bf581a68071
Subject: [Buildroot] [PATCH 17/70] package/x11r7/xapp_xset: bump version to
 1.2.5
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

https://lists.x.org/archives/xorg-announce/2022-December/003271.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xset/xapp_xset.hash | 8 +++-----
 package/x11r7/xapp_xset/xapp_xset.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xset/xapp_xset.hash b/package/x11r7/xapp_xset/xapp_xset.hash
index a4f19d0273..dea34a1a13 100644
--- a/package/x11r7/xapp_xset/xapp_xset.hash
+++ b/package/x11r7/xapp_xset/xapp_xset.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002873.html
-md5  70ea7bc7bacf1a124b1692605883f620  xset-1.2.4.tar.bz2
-sha1  41a857f30ff5bb0dfbda1549bb703984344ea228  xset-1.2.4.tar.bz2
-sha256  e4fd95280df52a88e9b0abc1fee11dcf0f34fc24041b9f45a247e52df941c957  xset-1.2.4.tar.bz2
-sha512  f24714c9a82081a09d3054bbad98553de9366992f22eaf3e2bcadbb58fad1d3dad2547fef6fa9898d8a9df064573c29df9d82a5c801fa92248604c95f65dc83d  xset-1.2.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003271.html
+sha256  9f692d55635b3862cd63633b1222a87680ec283c7a8e8ed6dd698a3147f75e2f  xset-1.2.5.tar.xz
+sha512  12b53d7cd6b7ccf6515c03f68151490fce6b2629e99b8d85ac5d760f4ed93394a457213c3947533809fbbb04acd1ed260aeea1256099a10397660eef3088150d  xset-1.2.5.tar.xz
 # Locally computed
 sha256  6bfc619b6d37dd0e6ca575edcb3a05194136e04d1d9989b8e14e6f7850587382  COPYING
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 9ead55a20f..498e6a123c 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XSET_VERSION = 1.2.4
-XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
-XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSET_VERSION = 1.2.5
+XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.xz
+XAPP_XSET_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XSET_LICENSE = MIT
 XAPP_XSET_LICENSE_FILES = COPYING
 XAPP_XSET_DEPENDENCIES = xlib_libXmu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
