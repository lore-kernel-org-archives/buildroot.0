Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377DFC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 21:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E36818D7;
	Mon, 12 Dec 2022 21:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E36818D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0C5QDbZ2BSCd; Mon, 12 Dec 2022 21:58:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E420981362;
	Mon, 12 Dec 2022 21:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E420981362
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5681BF30A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0998960B57
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0998960B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZv_KSFZvJr1 for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 21:58:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 080706072A
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 080706072A
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 21:58:41 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout08.t-online.de (Postfix) with SMTP id 45113225DC
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 22:58:39 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4qon-0ILbKT0; Mon, 12 Dec 2022 22:58:37 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:52628)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4qom-000580-2K
 for buildroot@buildroot.org; Mon, 12 Dec 2022 22:58:36 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 22:58:36 +0100
Message-Id: <20221212215836.2929166-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670882317-60A0E2DC-009B105A/0/0 CLEAN NORMAL
X-TOI-MSGID: bdab3c81-a6f1-4511-9524-20a1fc084827
Subject: [Buildroot] [PATCH 1/1] package/libfreeglut: bump version to 3.4.0
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
https://github.com/FreeGLUTProject/freeglut/releases/tag/v3.4.0

Upstream switched to github:
https://freeglut.sourceforge.net/news.php
https://sourceforge.net/p/freeglut/mailman/message/37622871/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libfreeglut/libfreeglut.hash | 5 +----
 package/libfreeglut/libfreeglut.mk   | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/libfreeglut/libfreeglut.hash b/package/libfreeglut/libfreeglut.hash
index ce9fb9e299..249a780f04 100644
--- a/package/libfreeglut/libfreeglut.hash
+++ b/package/libfreeglut/libfreeglut.hash
@@ -1,6 +1,3 @@
-# From http://sourceforge.net/projects/freeglut/files/freeglut/3.2.2/
-md5  485c1976165315fc42c0b0a1802816d9  freeglut-3.2.2.tar.gz
-sha1  8e53cc0251165d02cce8d6d5054159c310958b74  freeglut-3.2.2.tar.gz
 # Locally computed
-sha256  c5944a082df0bba96b5756dddb1f75d0cd72ce27b5395c6c1dde85c2ff297a50  freeglut-3.2.2.tar.gz
+sha256  3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec  freeglut-3.4.0.tar.gz
 sha256  b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275  COPYING
diff --git a/package/libfreeglut/libfreeglut.mk b/package/libfreeglut/libfreeglut.mk
index 484b0f4b97..09309aeceb 100644
--- a/package/libfreeglut/libfreeglut.mk
+++ b/package/libfreeglut/libfreeglut.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBFREEGLUT_VERSION = 3.2.2
+LIBFREEGLUT_VERSION = 3.4.0
 LIBFREEGLUT_SOURCE = freeglut-$(LIBFREEGLUT_VERSION).tar.gz
-LIBFREEGLUT_SITE = http://downloads.sourceforge.net/freeglut
+LIBFREEGLUT_SITE = https://github.com/FreeGLUTProject/freeglut/releases/download/v$(LIBFREEGLUT_VERSION)
 LIBFREEGLUT_LICENSE = MIT
 LIBFREEGLUT_LICENSE_FILES = COPYING
 LIBFREEGLUT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
