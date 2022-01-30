Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BFFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 12:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3A6F60E58;
	Sun, 30 Jan 2022 12:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3ZGxdzFAjiV; Sun, 30 Jan 2022 12:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6919D60E5F;
	Sun, 30 Jan 2022 12:34:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D88831BF5A2
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 12:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C62DD40577
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 12:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Txu-87iCprmY for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 12:34:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88A9C405BE
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 12:34:42 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout10.t-online.de (Postfix) with SMTP id 908451271
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:34:39 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nE9Pg-0knt7R0; Sun, 30 Jan 2022 13:34:36 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55094)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nE9Pf-0001Qk-Ss
 for buildroot@buildroot.org; Sun, 30 Jan 2022 13:34:35 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 13:34:35 +0100
Message-Id: <20220130123435.13149-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643546076-00014AB5-6A2ADF2F/0/0 CLEAN NORMAL
X-TOI-MSGID: 518b86fd-a627-4dd9-a7b8-419483830351
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.16.3
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

Changelog:
https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 7960522f35..36b0c8c8a1 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ee07a66a2cd8332695fb377b685ccf90e56fcff1717316211dee22bde7357d1f  xmrig-6.16.2.tar.gz
+sha256  d413b6a20a0ce30410388d330e1056715333e0863165369668dda596766e9d5b  xmrig-6.16.3.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index ff2e8d6c1f..7fa638a54c 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.16.2
+XMRIG_VERSION = 6.16.3
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
