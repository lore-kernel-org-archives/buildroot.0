Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0F4C3DA7A
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B76B1607B5;
	Thu, 29 Dec 2022 19:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B76B1607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5ahrIztKclF; Thu, 29 Dec 2022 19:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F0C607A4;
	Thu, 29 Dec 2022 19:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07F0C607A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C7051BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06E58401B0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06E58401B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4q7v2rSooMw for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:45:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3F2C401A0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3F2C401A0
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:45:09 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout04.t-online.de (Postfix) with SMTP id CF6501F58A;
 Thu, 29 Dec 2022 20:45:06 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pAypt-0awbOj0; Thu, 29 Dec 2022 20:45:06 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:47848)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pAypt-0002wg-21;
 Thu, 29 Dec 2022 20:45:05 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:45:05 +0100
Message-Id: <20221229194505.3315137-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672343106-C0B261D1-4C9032E0/0/0 CLEAN NORMAL
X-TOI-MSGID: 0548f278-3f6e-47c8-9ace-3195d2f63d50
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 98499eb955..45c8bd62b0 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ed32401d1ed85f9e2d28d122a046c3f2c01b6ca5c0da1a7d78fa8f400e858107  tvheadend-fbc94aee8bfdd25baba87ab62a39234da20e8dd2.tar.gz
+sha256  06c6d33a8e9d1d645cea9c63a06f6bddb309e5546177966d7b9285f68313bf5b  tvheadend-c9a156a25a07f1f84c2f48a1b03b481430c8257d.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 8ceb7493c8..0ca8f46dc5 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = fbc94aee8bfdd25baba87ab62a39234da20e8dd2
+TVHEADEND_VERSION = c9a156a25a07f1f84c2f48a1b03b481430c8257d
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
