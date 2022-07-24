Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CF4C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E91F40C4F;
	Sun, 24 Jul 2022 16:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E91F40C4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTWgNOCFEUAB; Sun, 24 Jul 2022 16:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BA76404C6;
	Sun, 24 Jul 2022 16:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BA76404C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A154A1BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29F24416A3
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F24416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lg1NfQQCU2sB for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B679C42478
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B679C42478
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 84E2212DFB
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:04 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePd-3IU3sK0; Sun, 24 Jul 2022 18:25:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePd-0007mb-0I;
 Sun, 24 Jul 2022 18:25:01 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:54 +0200
Message-Id: <20220724162500.2683871-15-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679901-0144CFA9-4B3B943E/0/0 CLEAN NORMAL
X-TOI-MSGID: 1304bf71-cf33-4307-9ad1-de8743fd8a92
Subject: [Buildroot] [PATCH 14/20] package/x11r7/xapp_xrefresh: bump version
 to 1.0.7
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xrefresh/xapp_xrefresh.hash | 10 ++++------
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
index 8eae8ed1bb..adb9a3b521 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002872.html
-md5 c56fa4adbeed1ee5173f464a4c4a61a6  xrefresh-1.0.6.tar.bz2
-sha1 11eb5b3f905631281d2cedd86a0b666bab0d9bdc  xrefresh-1.0.6.tar.bz2
-sha256 287dfb9bb7e8d780d07e672e3252150850869cb550958ed5f8401f0835cd6353  xrefresh-1.0.6.tar.bz2
-sha512 361e97fecfc2706d5eeab69df0d4dd4baa55b6783cfddabf51d8561b7c930d71ce6c217e0512c6564208d69b04f89c69ea8c0bfb2e4f6cc25b062b55e4db3674  xrefresh-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003188.html
+sha256  a9f1d635f2f42283d0174e94d09ab69190c227faa5ab542bfe15ed9607771b1e  xrefresh-1.0.7.tar.xz
+sha512  8fcbb01aa368944ca536f050ab194b21bbd6b2a56265a7ed5807882e5c2f9660105283cdba0ea35b3e4a17a015586aeb82906e081da030332dfc49169a191c31  xrefresh-1.0.7.tar.xz
 # Locally computed
-sha256 4f51c9a91cd277697cbea6604bf4cb240c1ed14cdba82550cb9cac8f1286f663 COPYING
+sha256  4f51c9a91cd277697cbea6604bf4cb240c1ed14cdba82550cb9cac8f1286f663 COPYING
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 36a4feaad1..9affbd468e 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XREFRESH_VERSION = 1.0.6
-XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
-XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XREFRESH_VERSION = 1.0.7
+XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.xz
+XAPP_XREFRESH_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XREFRESH_LICENSE = MIT
 XAPP_XREFRESH_LICENSE_FILES = COPYING
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
