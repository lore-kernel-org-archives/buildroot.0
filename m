Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF468C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 09:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D9A610AC;
	Sun, 11 Jun 2023 09:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D9A610AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tg1yJh8jhuwJ; Sun, 11 Jun 2023 09:32:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9653260A6B;
	Sun, 11 Jun 2023 09:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9653260A6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 778FF1BF38D
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 09:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C8B418A9
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 09:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C8B418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1gx_KKFrFWQ for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 09:32:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F4004418A7
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F4004418A7
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 09:32:00 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout08.t-online.de (Postfix) with SMTP id D6A9A22F6B
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 11:31:57 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8HQT-0xCBlZ0; Sun, 11 Jun 2023 11:31:57 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:33706)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8HQS-000444-38
 for buildroot@buildroot.org; Sun, 11 Jun 2023 11:31:57 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 11:31:56 +0200
Message-Id: <20230611093156.655621-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686475917-09FCA714-6E145B39/0/0 CLEAN NORMAL
X-TOI-MSGID: a7f7662b-d522-45e4-af04-4a2c05d29c51
Subject: [Buildroot] [PATCH 1/1] package/wget: bump version to 1.21.4
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
https://lists.gnu.org/archive/html/bug-wget/2023-05/msg00004.html

Added upstream sha1 hash.
Updated license hash due to copyright year bump:
https://git.savannah.gnu.org/gitweb/?p=wget.git;a=commitdiff;h=42239969300cae065e38781df3d157483897ff6b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wget/wget.hash | 8 +++++---
 package/wget/wget.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 22674650a2..eed87e8e3d 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,8 @@
+# From https://lists.gnu.org/archive/html/bug-wget/2023-05/msg00004.html
+sha1 42384273c1937458c9db3766a5509afa636a2f00  wget-1.21.4.tar.lz
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  dbd2fb5e47149d4752d0eaa0dac68cc49cf20d46df4f8e326ffc8f18b2af4ea5  wget-1.21.3.tar.lz
+sha256  3683619a5f50edcbccb1720a79006fa37bf9b9a255a8c5b48048bc3c7a874bd9  wget-1.21.4.tar.lz
 # Locally calculated
-sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
+sha256  f7dc7522e7e1be9227f3dc8de8b39a4d1d2471968c893af15f00c1a2076a0eec  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 455faaed12..d2d3087961 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.3
+WGET_VERSION = 1.21.4
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
