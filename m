Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BE2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 21:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E99C415EC;
	Mon, 12 Dec 2022 21:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E99C415EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjrxD5ySfONE; Mon, 12 Dec 2022 21:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56CB94155E;
	Mon, 12 Dec 2022 21:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56CB94155E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4E281BF30A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A080B8144B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A080B8144B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGYhAttDntmG for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 21:43:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 984D381766
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 984D381766
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 21:43:38 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout07.t-online.de (Postfix) with SMTP id B5BA48C46
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 22:43:35 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4qaE-1qpZGD0; Mon, 12 Dec 2022 22:43:34 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37312)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4qaE-0002Xf-1r
 for buildroot@buildroot.org; Mon, 12 Dec 2022 22:43:34 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 22:43:34 +0100
Message-Id: <20221212214334.2635166-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670881414-F2FF5ECF-577DB8A0/0/0 CLEAN NORMAL
X-TOI-MSGID: 3ef79344-c9da-4e39-bf22-01d423077376
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xutil_makedepend: bump
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

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003300.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.hash | 6 +++---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.hash b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
index 3a7496e1a4..e2fe117f10 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.hash
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003243.html
-sha256  a729cfd3c0f4e16c0db1da351e7f53335222e058e3434e84f91251fd6d407065  makedepend-1.0.7.tar.xz
-sha512  fd575de737aa56ef8e475d1ddb7b2392e730ee1b23c0b853bbb21975b757c3fc56f94d57ecc5a784dceed2be653feb10909e86fd96fdc074b50fbbd0e27a19db  makedepend-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-December/003300.html
+sha256  bfb26f8025189b2a01286ce6daacc2af8fe647440b40bb741dd5c397572cba5b  makedepend-1.0.8.tar.xz
+sha512  6707b1107c07d4ffbcf008181e877d18a0bcc4aea03860ee1158f5630c7fdce4cf9ad7bee3b38ee420c3a44819ed4b56a6f2428a5b695c0dbd17fb3e60825a6d  makedepend-1.0.8.tar.xz
 # Locally computed
 sha256  0530078db78c47ae978dc2bd77f4f427e6cd97df868672c95b1ef284113c8cb7  COPYING
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index b16bbe0978..0c4a32c006 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.7
+XUTIL_MAKEDEPEND_VERSION = 1.0.8
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.xz
 XUTIL_MAKEDEPEND_SITE = https://xorg.freedesktop.org/archive/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
