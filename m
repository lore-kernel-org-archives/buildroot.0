Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5378C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 18:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3319D82111;
	Thu, 16 Feb 2023 18:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3319D82111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awy85prY65qm; Thu, 16 Feb 2023 18:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B62082106;
	Thu, 16 Feb 2023 18:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B62082106
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 877171BF963
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61B0F82106
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B0F82106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uuGb5wIvjM9d for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 18:20:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8DF9820FE
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8DF9820FE
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 18:20:41 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout01.t-online.de (Postfix) with SMTP id 24072BFBE;
 Thu, 16 Feb 2023 19:20:39 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.190.165]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pSis0-23A1Dt0; Thu, 16 Feb 2023 19:20:37 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:53488)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pSis0-0004El-20;
 Thu, 16 Feb 2023 19:20:36 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 19:20:36 +0100
Message-Id: <20230216182036.40830-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676571637-17FFA778-09FA3E15/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ac133ee-2718-48b4-bbd2-fc193d91f691
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.11.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://docs.python.org/release/3.11.2/whatsnew/changelog.html#python-3-11-2

Updated license hash due to copyright year bump:
https://github.com/python/cpython/commit/07d1f99e8faefcf24dab2113fb0df27202fa6f71

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 7f079865d9..f235347efb 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  85879192f2cffd56cb16c092905949ebf3e5e394b7f764723529637901dfb58f  Python-3.11.1.tar.xz
-sha256  d4a223f033419313218c9b8444167e91e87a5bebdb43fb8490df441df5220a8b  LICENSE
+sha256  29e4b8f5f1658542a8c13e2dd277358c9c48f2b2f7318652ef1675e402b9d2af  Python-3.11.2.tar.xz
+sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index fb6dbf2e64..56fe95cd07 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
