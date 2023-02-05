Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F60C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 08:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7A460A6B;
	Sun,  5 Feb 2023 08:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F7A460A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vMujRuX4d2v; Sun,  5 Feb 2023 08:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADF1D606EC;
	Sun,  5 Feb 2023 08:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF1D606EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9DF1BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D258E400D7
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D258E400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LTIMi77MsZz1 for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 08:16:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EB79400AF
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EB79400AF
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 08:16:21 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout12.t-online.de (Postfix) with SMTP id CAA381A6BC;
 Sun,  5 Feb 2023 09:16:18 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.195.67]) by fwd74.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pOaCA-1niWvZ0; Sun, 5 Feb 2023 09:16:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:34828)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pOaCA-0008Sg-0E;
 Sun, 05 Feb 2023 09:16:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 09:16:15 +0100
Message-Id: <20230205081617.113018-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675584978-B202B007-8516FCDC/0/0 CLEAN NORMAL
X-TOI-MSGID: 8d13fd17-17d1-47e3-9f5d-4b01fc649a54
Subject: [Buildroot] [PATCH 1/3] package/libks: bump version to 1.8.2
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for upcoming bump of freeswitch to version 1.10.9.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libks/libks.hash | 2 +-
 package/libks/libks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libks/libks.hash b/package/libks/libks.hash
index d4ad7ebbbc..dba442bdd2 100644
--- a/package/libks/libks.hash
+++ b/package/libks/libks.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b42544a5544ac00ceeb0675a9e6a99c8e6ecc752452c7f38c6ffe32fbedb906d  libks-1.8.0.tar.gz
+sha256  131d7896c81a7f3c9bf06860e4f564ca558d4be1614568fec688b3eb66d38107  libks-1.8.2.tar.gz
 sha256  1d1327f37b58a4c9ce520fcf9dd3f348c7c639229ee7aed41c47164a8f7836cd  copyright
diff --git a/package/libks/libks.mk b/package/libks/libks.mk
index 4aca5c5c4c..c4f0cd5c78 100644
--- a/package/libks/libks.mk
+++ b/package/libks/libks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKS_VERSION = 1.8.0
+LIBKS_VERSION = 1.8.2
 LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
 LIBKS_LICENSE = MIT
 LIBKS_LICENSE_FILES = copyright
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
