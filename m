Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AABC04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 07:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CE444171F;
	Sun, 25 Sep 2022 07:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CE444171F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0hfpk_Gsl2B; Sun, 25 Sep 2022 07:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01D4D41711;
	Sun, 25 Sep 2022 07:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01D4D41711
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2A1C1BF5DC
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE93607BC
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BE93607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YhABvnddKgWC for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 07:08:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A41606A0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7A41606A0
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 07:08:34 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout09.t-online.de (Postfix) with SMTP id 68DEB2A81
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:08:32 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.201.33]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ocLkY-49EQWv0; Sun, 25 Sep 2022 09:08:26 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:54486)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ocLkY-0007JT-0k;
 Sun, 25 Sep 2022 09:08:26 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 09:08:22 +0200
Message-Id: <20220925070826.11210-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220925070826.11210-1-bernd.kuhls@t-online.de>
References: <20220925070826.11210-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1664089706-E67DE07E-212841D6/0/0 CLEAN NORMAL
X-TOI-MSGID: 2157ff7a-c5ea-4d59-9a13-abe310c42ddf
Subject: [Buildroot] [PATCH 3/7] package/kodi-pvr-stalker: bump version to
 19.0.4-Matrix
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index ad47f02bd8..167905f637 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c0d71dad5fdbc334ea8b0b66f5155c72b6f59a76c268a1de71edb837688ebf81  kodi-pvr-stalker-19.0.3-Matrix.tar.gz
+sha256  191b2bd2dcbe15de29c1b867c127668784991e43817b00947cf955e569cf148e  kodi-pvr-stalker-19.0.4-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index bda1c8ff75..f306c3a51b 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = 19.0.3-Matrix
+KODI_PVR_STALKER_VERSION = 19.0.4-Matrix
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
