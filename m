Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B77EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D753F60B08;
	Thu,  8 Dec 2022 22:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D753F60B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIWpzkWxh1AT; Thu,  8 Dec 2022 22:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD17760A6B;
	Thu,  8 Dec 2022 22:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD17760A6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 458DC1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB4E9820DE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB4E9820DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1ryndf2-XPt for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC66820EB
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AC66820EB
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout03.t-online.de (Postfix) with SMTP id D4B961ABA9
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:22 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX1-325S410; Thu, 8 Dec 2022 23:38:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX1-00048i-0x
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:36 +0100
Message-Id: <20221208223817.1088619-30-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539099-D924D9D3-13B54486/0/0 CLEAN NORMAL
X-TOI-MSGID: 5b5e0407-32b4-4998-b3b8-5f1a6acd87a2
Subject: [Buildroot] [PATCH 29/70] package/x11r7/xapp_xlsatoms: bump version
 to 1.1.4
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

https://lists.x.org/archives/xorg-announce/2022-November/003258.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash | 8 +++-----
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
index 21484fdcdf..be9ed6f0b4 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002951.html
-md5  61671fee12535347db24ec3a715032a7  xlsatoms-1.1.3.tar.bz2
-sha1  9fdb1e8df6bb08529a812ac90f63d500bf5174cc  xlsatoms-1.1.3.tar.bz2
-sha256  57868f958c263976727881f3078e55b86b4a109dc578d2b92f5c6d690850a382  xlsatoms-1.1.3.tar.bz2
-sha512  c267ccfdc5a83e834bfb5c3b144e22642badcadef4eb146eeec2df6fe6f85e9379500ae4219912c70fa2e535036a1a96cf496381f5d814e79af075e03c975f30  xlsatoms-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003258.html
+sha256  f4bfa15f56c066d326a5d5b292646708f25b9247506840b9047cd2687dcc71b7  xlsatoms-1.1.4.tar.xz
+sha512  82f0d1e17850770537eac82947eff4514639f8122bd864e02685ede49db110a4c90c7782702ffb677a2b581f3eacd10dba80e63e29e7a1ed1c9255ee163fe0c4  xlsatoms-1.1.4.tar.xz
 # Locally computed
 sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index a3230fc2dc..2ef09ef2d5 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XLSATOMS_VERSION = 1.1.3
-XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
-XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSATOMS_VERSION = 1.1.4
+XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.xz
+XAPP_XLSATOMS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLSATOMS_LICENSE = MIT
 XAPP_XLSATOMS_LICENSE_FILES = COPYING
 XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
