Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B780EC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 13:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 287F941830;
	Thu, 11 Aug 2022 13:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 287F941830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Eo2FkxuHRcm; Thu, 11 Aug 2022 13:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF273417BC;
	Thu, 11 Aug 2022 13:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF273417BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0B171BF2F6
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 13:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D82EC4179A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 13:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D82EC4179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kSZM6DwOFac for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 13:37:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD079417BC
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD079417BC
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 13:37:47 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout12.t-online.de (Postfix) with SMTP id 8E5F614A3E
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 15:37:00 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.204.197]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oM8Ms-47JMLx0; Thu, 11 Aug 2022 15:36:58 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:52920)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oM8Ms-0004pm-1R
 for buildroot@buildroot.org; Thu, 11 Aug 2022 15:36:58 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 15:36:57 +0200
Message-Id: <20220811133658.170963-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1660225018-01446235-0170004A/0/0 CLEAN NORMAL
X-TOI-MSGID: 5f2c1856-71e9-477a-8ec8-88b82b8a0638
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-dvbviewer: bump version to
 19.1.0-Matrix
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
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index d6a3e1c29c..e3ff5bd1c1 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a6d6ff8ee87f37e2a6580b2a880a2ede635a4d9615962996831362150a5a20e  kodi-pvr-dvbviewer-19.0.2-Matrix.tar.gz
+sha256  5ccb4fa952c8909169dddd0a4c8f393ef8c1e8d35b9df0332f66a5f6442d6e85  kodi-pvr-dvbviewer-19.1.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index db7884fcf7..e4b00c06b5 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBVIEWER_VERSION = 19.0.2-Matrix
+KODI_PVR_DVBVIEWER_VERSION = 19.1.0-Matrix
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
