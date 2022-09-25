Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0422C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 07:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88F1760B1B;
	Sun, 25 Sep 2022 07:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88F1760B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKBHeqRWuF2m; Sun, 25 Sep 2022 07:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF4D4607BC;
	Sun, 25 Sep 2022 07:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF4D4607BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4A41BF97E
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 155F24026A
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 155F24026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFRRAO3M4eC5 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 07:08:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34A34016D
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C34A34016D
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 07:08:31 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout01.t-online.de (Postfix) with SMTP id 73693149B
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:08:28 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.201.33]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ocLkY-498eVF0; Sun, 25 Sep 2022 09:08:26 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:54486)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ocLkY-0007JT-0a;
 Sun, 25 Sep 2022 09:08:26 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 09:08:21 +0200
Message-Id: <20220925070826.11210-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220925070826.11210-1-bernd.kuhls@t-online.de>
References: <20220925070826.11210-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1664089706-EF7F5A26-6F84DE31/0/0 CLEAN NORMAL
X-TOI-MSGID: ad31860a-7a3b-4a83-bbbd-90bae5a1a79c
Subject: [Buildroot] [PATCH 2/7] package/kodi-pvr-nextpvr: bump version to
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
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index df13732957..74f15e6d9b 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f9a03f7e61ae69096b149184a1ababa2d98cf2486688022e7b63823047c04496  kodi-pvr-nextpvr-19.0.3-Matrix.tar.gz
+sha256  278411430d41ac24f28e05f76d2d46a90cb3989202a450399ac0495c264a6846  kodi-pvr-nextpvr-19.0.4-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index c245a7e0bc..c2f54e0c2c 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 19.0.3-Matrix
+KODI_PVR_NEXTPVR_VERSION = 19.0.4-Matrix
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
