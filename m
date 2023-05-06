Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F89C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8B2840BE3;
	Sat,  6 May 2023 17:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8B2840BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2zig_G52vHV7; Sat,  6 May 2023 17:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D4014168F;
	Sat,  6 May 2023 17:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4014168F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 834461BF859
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D924607CA
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D924607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvDVNBOvQ0eR for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F3E6608A6
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F3E6608A6
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:24 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout11.t-online.de (Postfix) with SMTP id 05912BCBD
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:22 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd83.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-3nniD40; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsN-0004jT-1W
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:13 +0200
Message-Id: <20230506173917.1112500-18-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-0AFFAC11-D8D9DFEB/0/0 CLEAN NORMAL
X-TOI-MSGID: 74aa1712-98b7-4a32-837b-6c03cbdf49cb
Subject: [Buildroot] [PATCH 18/22] package/x11r7/xdata_xbitmaps: bump
 version to 1.1.3
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
https://lists.x.org/archives/xorg-announce/2023-February/003333.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash | 8 +++-----
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
index 7ebc88a0be..c9a3956686 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002881.html
-md5  cedeef095918aca86da79a2934e03daf  xbitmaps-1.1.2.tar.bz2
-sha1  1cb0e485a66280e9a64b48426140b8a0de9cf169  xbitmaps-1.1.2.tar.bz2
-sha256  b9f0c71563125937776c8f1f25174ae9685314cbd130fb4c2efce811981e07ee  xbitmaps-1.1.2.tar.bz2
-sha512  eed5e2fce9fc6c532984e6ed1262e440591e311ca6c61a7fe7a5c877df84bfc2d7aff388fb9c894fc098785b8e5352f0bd7c918252247a040cf123874847450d  xbitmaps-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003333.html
+sha256  ad6cad54887832a17d86c2ccfc5e52a1dfab090f8307b152c78b0e1529cd0f7a  xbitmaps-1.1.3.tar.xz
+sha512  b9a7340385fcce2dcd0204f14a462685b14b72ff58f3ec53cd76695bef2b02af902bdac809622dcb27fd4075d5ba13587b5d059530aff502cd5288d161352814  xbitmaps-1.1.3.tar.xz
 # Locally computed
 sha256  e121ec6605558ee021674d33b1ab9306e16b9ea7d30453df42286556247be17a  COPYING
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index e9545abaec..c8b6445829 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDATA_XBITMAPS_VERSION = 1.1.2
-XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
-XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
+XDATA_XBITMAPS_VERSION = 1.1.3
+XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.xz
+XDATA_XBITMAPS_SITE = https://xorg.freedesktop.org/archive/individual/data
 XDATA_XBITMAPS_LICENSE = MIT
 XDATA_XBITMAPS_LICENSE_FILES = COPYING
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
