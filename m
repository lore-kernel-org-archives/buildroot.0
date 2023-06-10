Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DD7C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 16:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C42141FF9;
	Sat, 10 Jun 2023 16:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C42141FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jtR-9G-8c3a; Sat, 10 Jun 2023 16:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1205242647;
	Sat, 10 Jun 2023 16:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1205242647
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70B191BF32E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 578E660E74
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 578E660E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rw3enORWmAK6 for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 16:44:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38FC260F53
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38FC260F53
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 16:44:21 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout09.t-online.de (Postfix) with SMTP id 320D259A3A
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 18:44:13 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd88.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q81hE-1I5M7V0; Sat, 10 Jun 2023 18:44:12 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57504)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q81hE-0001jA-0k
 for buildroot@buildroot.org; Sat, 10 Jun 2023 18:44:12 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 18:44:12 +0200
Message-Id: <20230610164412.1029852-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686415452-13FFFE62-F07AC57A/0/0 CLEAN NORMAL
X-TOI-MSGID: ff88d40c-0d20-4bac-86cf-1647721acab1
Subject: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.31.3
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

Removed md5 hash, switched _SITE to https.

Updated license hash due to copyright year bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpg123/mpg123.hash | 9 ++++-----
 package/mpg123/mpg123.mk   | 4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index e5fb09b46a..39ded93fb9 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,7 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.15/
-sha1  286fcb83afad3ecbfea60434d3ee1b6d7f41bb7c  mpg123-1.25.15.tar.bz2
-md5  9a050d4b3573661c606f8095a3f34ca3  mpg123-1.25.15.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.31.3/
+sha1  c41b98e4c5ac55a5b3787b5aa309a71a6d458145  mpg123-1.31.3.tar.bz2
 # Locally calculated
-sha256  503a76d82d97f1a6513bbeb284e460a99fb17ef80f23a661d8fc026ce6adcbbc  mpg123-1.25.15.tar.bz2
+sha256  1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a  mpg123-1.31.3.tar.bz2
 # License file
-sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
+sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index fbb011c2c2..64c8e0d8e5 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.25.15
+MPG123_VERSION = 1.31.3
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
-MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
+MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPL-2.1
 MPG123_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
