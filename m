Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC3FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 12:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A548190B;
	Sun, 20 Mar 2022 12:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RP2WmfKiO41; Sun, 20 Mar 2022 12:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79F9818B5;
	Sun, 20 Mar 2022 12:48:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A48CD1BF591
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C22C40390
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XkuGCIpWpxKw for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 12:48:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9106A40182
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 12:48:53 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout11.t-online.de (Postfix) with SMTP id 1B31E1DC72
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 13:48:51 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.211]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nVuzH-0boDw10; Sun, 20 Mar 2022 13:48:47 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56752)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nVuzG-0003e7-QJ
 for buildroot@buildroot.org; Sun, 20 Mar 2022 13:48:46 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 13:48:46 +0100
Message-Id: <20220320124846.664904-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647780527-0001619A-FF5FF860/0/0 CLEAN NORMAL
X-TOI-MSGID: 848d6d01-9593-406c-9df0-7eae3b805420
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump to version 3.38.1
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

Release notes: https://sqlite.org/releaselog/3_38_1.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index deb8d4c14c..1b3dc35ccb 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4089a8d9b467537b3f246f217b84cd76e00b1d1a971fe5aca1e30e230e46b2d8  sqlite-autoconf-3370200.tar.gz
+sha256  8e3a8ceb9794d968399590d2ddf9d5c044a97dd83d38b9613364a245ec8a2fc4  sqlite-autoconf-3380100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b702139f6c..a0c90b7f62 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.37.2
-SQLITE_TAR_VERSION = 3370200
+SQLITE_VERSION = 3.38.1
+SQLITE_TAR_VERSION = 3380100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
