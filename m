Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF503C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A0DE40CA8;
	Sat,  6 May 2023 17:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A0DE40CA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoAitnSlCb9a; Sat,  6 May 2023 17:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0EA442A86;
	Sat,  6 May 2023 17:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0EA442A86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E52A1BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BFCB40B80
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BFCB40B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id it6q8z_NrRr7 for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 709B740C17
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 709B740C17
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:29 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout03.t-online.de (Postfix) with SMTP id 534F8583D
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-0Z0R1e0; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsN-0004jT-1j
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:14 +0200
Message-Id: <20230506173917.1112500-19-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-DED45C15-BEE4AEA0/0/0 CLEAN NORMAL
X-TOI-MSGID: 18f0acc8-7fb9-4848-b9df-1affc9b715b5
Subject: [Buildroot] [PATCH 19/22] package/x11r7/xdata_xcursor-themes: bump
 version to 1.0.7
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
https://lists.x.org/archives/xorg-announce/2023-February/003332.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash  | 8 +++-----
 .../x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk    | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
index 2b88f567a0..1bb3831c91 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002945.html
-md5  aea14eabf40528ec4db18f1cfcf5c458  xcursor-themes-1.0.6.tar.bz2
-sha1  b56fd5bf5b1ada0532a85c27db0d296e392168c5  xcursor-themes-1.0.6.tar.bz2
-sha256  ee1ec574741293abcf66ac14ce7e74add7ac6be7deb8b38179ef010d22354999  xcursor-themes-1.0.6.tar.bz2
-sha512  2ad3586a5571a5ddc0001187362b54b839644916164834213af98e58698044aec4392dd6e1e42f1794fda85c8fedf259b09214a9636bd0e71a1629c710f198d3  xcursor-themes-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003332.html
+sha256  95bae8f48823d894a05bf42dfbf453674ab7dbdeb11e2bc079e8525ad47378c8  xcursor-themes-1.0.7.tar.xz
+sha512  910925dd17c576028ae0d9dfe5683888648b941806b53cd9ff74ed18ff2de537664b07ab4c647a55290aeba37f6051f322b29e8ecd54f348e32abe2ccea1c902  xcursor-themes-1.0.7.tar.xz
 # Locally computed
 sha256  e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6  COPYING
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index c3c5f388e9..e5bf1e502f 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDATA_XCURSOR_THEMES_VERSION = 1.0.6
-XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
-XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
+XDATA_XCURSOR_THEMES_VERSION = 1.0.7
+XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.xz
+XDATA_XCURSOR_THEMES_SITE = https://xorg.freedesktop.org/archive/individual/data
 XDATA_XCURSOR_THEMES_LICENSE = MIT
 XDATA_XCURSOR_THEMES_LICENSE_FILES = COPYING
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
