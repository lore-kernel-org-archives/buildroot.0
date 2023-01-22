Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC7CC27C76
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 11:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 631DF60BF0;
	Sun, 22 Jan 2023 11:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 631DF60BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7sYpd3evitp; Sun, 22 Jan 2023 11:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC2860E60;
	Sun, 22 Jan 2023 11:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC2860E60
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28EFA1BF379
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 11:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ABE6408E1
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 11:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ABE6408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_7Rg3cDxKl4 for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 11:56:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27CEB41605
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27CEB41605
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 11:56:44 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout10.t-online.de (Postfix) with SMTP id 099AA15AE4
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 12:56:42 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.185.38]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pJYxl-1MiRBB0; Sun, 22 Jan 2023 12:56:41 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:36428)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pJYxk-0007vS-2i
 for buildroot@buildroot.org; Sun, 22 Jan 2023 12:56:40 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 22 Jan 2023 12:56:37 +0100
Message-Id: <20230122115640.24776-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230122115640.24776-1-bernd.kuhls@t-online.de>
References: <20230122115640.24776-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674388601-D53B29DF-3F4735DE/0/0 CLEAN NORMAL
X-TOI-MSGID: ef2785db-eb72-4df6-8cac-836d0211276c
Subject: [Buildroot] [PATCH 3/6] package/kodi-peripheral-xarcade: bump
 version to 19.0.5-Matrix
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
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 0ae1ffaa50..5467513a0b 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1327ecd05e2e66a4faf809efee4c5b99627912d971db26a0a905f0299e4f876b  kodi-peripheral-xarcade-19.0.4-Matrix.tar.gz
+sha256  11f746cfeeffdfc1de6829d17aad999c8b598ca2239fcddb64801738546be6c9  kodi-peripheral-xarcade-19.0.5-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index 9ee26ea2fe..2d9e33b625 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 19.0.4-Matrix
+KODI_PERIPHERAL_XARCADE_VERSION = 19.0.5-Matrix
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
