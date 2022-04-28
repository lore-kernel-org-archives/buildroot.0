Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEE6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 20:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B953761188;
	Thu, 28 Apr 2022 20:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90K-1GNLmLvU; Thu, 28 Apr 2022 20:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF7A060B5C;
	Thu, 28 Apr 2022 20:24:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33FDF1BF36D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21CAB40408
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRROovROn3xZ for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 20:24:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32E2E400E3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 20:24:50 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout10.t-online.de (Postfix) with SMTP id F04EF6D24
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 22:24:16 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.204.173]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nkAgS-3gfXZB0; Thu, 28 Apr 2022 22:24:16 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55366)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nkAgS-0000Sm-GN
 for buildroot@buildroot.org; Thu, 28 Apr 2022 22:24:16 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 22:24:16 +0200
Message-Id: <20220428202416.3560203-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1651177456-00010BFA-EAB1F9DA/0/0 CLEAN NORMAL
X-TOI-MSGID: 85c06b7d-a77d-4e52-a0a4-f7e2681a9fcd
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.15.7
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

Release notes: https://www.samba.org/samba/history/samba-4.15.7.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 20e5f00b21..ac28c35614 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.15.6.tar.asc
-sha256  0575b999a9048445820428dc540ba8a9527ce596fa66af02ea2ba1ea9578bcb4  samba-4.15.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.15.7.tar.asc
+sha256  76d0096c16ed0265b337d5731f3c0b32eed3adab6fa8b7585c055b287cd05d6b  samba-4.15.7.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 688aaac3eb..df3a7e58c8 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.15.6
+SAMBA4_VERSION = 4.15.7
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
