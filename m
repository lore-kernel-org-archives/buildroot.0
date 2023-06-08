Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E444C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9772083F35;
	Thu,  8 Jun 2023 18:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9772083F35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rG_WcZmbi2HZ; Thu,  8 Jun 2023 18:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7C983B7E;
	Thu,  8 Jun 2023 18:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE7C983B7E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 053BD1BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA69D4199A
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA69D4199A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqJ9JuzBNMgl for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:54:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB9CD41999
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB9CD41999
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:54:07 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout08.t-online.de (Postfix) with SMTP id 3582ED228;
 Thu,  8 Jun 2023 20:53:00 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7Kkh-2gkVlq0; Thu, 8 Jun 2023 20:52:55 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:59576)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7Kkh-0002b9-10;
 Thu, 08 Jun 2023 20:52:55 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:52:55 +0200
Message-Id: <20230608185255.3505647-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230608185255.3505647-1-bernd.kuhls@t-online.de>
References: <20230608185255.3505647-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686250375-5AE6F570-8F53AE3A/0/0 CLEAN NORMAL
X-TOI-MSGID: d2f02b2f-ba82-4a1c-ab24-cfeb1199df41
Subject: [Buildroot] [PATCH 4/4] package/libgpgme: bump to version 1.20.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added upstream sha1 & sha256 hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgpgme/libgpgme.hash | 7 +++----
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 7d02b9e139..a71cec1e38 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,6 +1,5 @@
-# Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.17.1.tar.bz2.sig
-# using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  711eabf5dd661b9b04be9edc9ace2a7bc031f6bd9d37a768d02d0efdef108f5f  gpgme-1.17.1.tar.bz2
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  369deeec95f1bb77fafc0b6c8fa65995ba82fd1e  gpgme-1.20.0.tar.bz2
+sha256  25a5785a5da356689001440926b94e967d02e13c49eb7743e35ef0cf22e42750  gpgme-1.20.0.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 2120ee8e3c..21a0b30d3b 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.17.1
+LIBGPGME_VERSION = 1.20.0
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
