Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498EEC43334
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 13:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8DDC82E9D;
	Sun,  3 Jul 2022 13:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8DDC82E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aykswg96hxu8; Sun,  3 Jul 2022 13:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D969A82D96;
	Sun,  3 Jul 2022 13:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D969A82D96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD231BF307
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 13:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC97D6070A
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 13:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC97D6070A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id as_LZDO69EeN for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 13:05:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D796B606FF
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D796B606FF
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 13:05:27 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout11.t-online.de (Postfix) with SMTP id 907C71C31F;
 Sun,  3 Jul 2022 15:05:25 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.181.254]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o7zHw-0kVSqH0; Sun, 3 Jul 2022 15:05:24 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48954)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o7zHw-0007o5-Bt;
 Sun, 03 Jul 2022 15:05:24 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  3 Jul 2022 15:05:24 +0200
Message-Id: <20220703130524.101210-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1656853524-01433199-B4FDD858/0/0 CLEAN NORMAL
X-TOI-MSGID: 18298e35-6d0a-4748-a9ab-89776fb92b34
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.10.5
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

Release notes:
https://docs.python.org/release/3.10.5/whatsnew/changelog.html#python-3-10-5-final

Drop md5 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python3/python3.hash | 4 +---
 package/python3/python3.mk   | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 5ae0add789..8052e3f6e0 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,3 @@
-# From https://www.python.org/downloads/release/python-3104/
-md5  21f2e113e087083a1e8cf10553d93599  Python-3.10.4.tar.xz
 # Locally computed
-sha256  80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19  Python-3.10.4.tar.xz
+sha256  8437efd5b106ef0a75aabfbf23d880625120a73a86a22ade4d2e2e68d7b74486  Python-3.10.5.tar.xz
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6d03e2c6b1..40711dc99c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
