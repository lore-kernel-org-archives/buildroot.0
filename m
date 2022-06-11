Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDE8CCA47A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 17:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA1460F48;
	Sat, 11 Jun 2022 17:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XlhzLmiSLvYS; Sat, 11 Jun 2022 17:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA1860E74;
	Sat, 11 Jun 2022 17:23:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF09C1BF82C
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 17:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E5EB408D1
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 17:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0l8bXlk0RpkB for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 17:23:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AB2040448
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 17:23:50 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout11.t-online.de (Postfix) with SMTP id 75B5C150AA
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 19:23:48 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o04pw-2uVmWv0; Sat, 11 Jun 2022 19:23:48 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:47348)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o04pv-00065c-JW
 for buildroot@buildroot.org; Sat, 11 Jun 2022 19:23:47 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 19:23:47 +0200
Message-Id: <20220611172347.2956493-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654968228-01421A9A-20D044BC/0/0 CLEAN NORMAL
X-TOI-MSGID: c76233fa-9337-4a1a-b394-f0ae31a12592
Subject: [Buildroot] [PATCH 1/1] package/gptfdisk: bump version to 1.0.9
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gptfdisk/gptfdisk.hash | 6 +++---
 package/gptfdisk/gptfdisk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index caded358ec..0b98677afb 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.8/
-sha1  c8824e779056158fa32887e415f5399a8646c3c5  gptfdisk-1.0.8.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.9/
+sha1  284bd000edaf7874b472bd01719c6a71a8030e13  gptfdisk-1.0.9.tar.gz
 # Locally computed
-sha256  95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df  gptfdisk-1.0.8.tar.gz
+sha256  dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2  gptfdisk-1.0.9.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 9869975f51..0df9cda08f 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.8
+GPTFDISK_VERSION = 1.0.9
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
