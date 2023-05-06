Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5085FC77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F069D40C12;
	Sat,  6 May 2023 17:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F069D40C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGcRRLAiwMIq; Sat,  6 May 2023 17:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1555142A7A;
	Sat,  6 May 2023 17:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1555142A7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAC6C1BF85D
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 908B9415CB
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 908B9415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2EZKB6gJc6m for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53212409B1
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53212409B1
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:29 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout03.t-online.de (Postfix) with SMTP id 5126F583C
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-0Z0R1d0; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsN-0004jT-0f
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:09 +0200
Message-Id: <20230506173917.1112500-14-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-DD540C15-C7965C4B/0/0 CLEAN NORMAL
X-TOI-MSGID: 735515f4-c607-4872-99d2-73edd1a19718
Subject: [Buildroot] [PATCH 14/22] package/x11r7/xapp_xwininfo: bump version
 to 1.1.6
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
https://lists.x.org/archives/xorg-announce/2023-April/003379.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xwininfo/-/commit/9a5623e2ffc6995b2c6edf379f191d76d7b4444a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xwininfo/xapp_xwininfo.hash | 10 ++++------
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
index fbc7f7be00..bbf2e37328 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003012.html
-md5  26d46f7ef0588d3392da3ad5802be420  xwininfo-1.1.5.tar.bz2
-sha1  9f67b1eb07c5824d437bf577cf6198962af1aeb7  xwininfo-1.1.5.tar.bz2
-sha256  7a405441dfc476666c744f5fcd1bc8a75abf8b5b1d85db7b88b370982365080e  xwininfo-1.1.5.tar.bz2
-sha512  a3268bbeeeeafac94e589fdd47554a965910d40df7cc3d9c36c7c24fa4f5dd49615484d5916ccb41efca9cd4cf9d8981a4c60953b921220b3f4f57f9cce0e1a6  xwininfo-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-April/003379.html
+sha256  3518897c17448df9ba99ad6d9bb1ca0f17bc0ed7c0fd61281b34ceed29a9253f  xwininfo-1.1.6.tar.xz
+sha512  c6df4ed3dcf97772450612f2786ecab8313a43bb78e0b8020cc9ec228b3f466f55090313ad02c8159a73a6892d117322ad85e28d9d76e38bb84c9750712c20bc  xwininfo-1.1.6.tar.xz
 # Locally computed
-sha256  443d675237c023a47e4886506b72796afbb2633394812027f91d6e8fa433b2af  COPYING
+sha256  1be1f0763a5efd08e48089c52728a822bf769b690a2fd82fbab456cfffee822f  COPYING
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index 9652487aae..196b73c83d 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XWININFO_VERSION = 1.1.5
-XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
+XAPP_XWININFO_VERSION = 1.1.6
+XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.xz
 XAPP_XWININFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XWININFO_LICENSE = MIT
 XAPP_XWININFO_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
