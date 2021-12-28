Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30374C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 14:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B058481D70;
	Tue, 28 Dec 2021 14:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vvQ-2UvCk7nX; Tue, 28 Dec 2021 14:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0565681D5A;
	Tue, 28 Dec 2021 14:36:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09BC61BF471
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0686081D5A
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNviZ60_2Ziu for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 14:36:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D1D181C93
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 14:36:12 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout01.t-online.de (Postfix) with SMTP id CB81B3D2F
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 15:36:09 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.0.156]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n2DaD-0oGvMg0; Tue, 28 Dec 2021 15:36:09 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35534)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n2DaD-0002VD-8Z
 for buildroot@buildroot.org; Tue, 28 Dec 2021 15:36:09 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 15:36:01 +0100
Message-Id: <20211228143608.24270-6-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211228143608.24270-1-bernd.kuhls@t-online.de>
References: <20211228143608.24270-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640702169-0000B8A1-73FFA67B/0/0 CLEAN NORMAL
X-TOI-MSGID: 106fd3c6-ea41-4776-9d7f-3ad3d8c8d3fd
Subject: [Buildroot] [PATCH 06/13] package/kodi-pvr-hts: bump version to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 4ac0f3e785..135b0088c4 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b97e48b70ab0c3769f0ab2c613ac3a0741a7751bb5bb20187bd47bc2a99d86d3  kodi-pvr-hts-19.0.3-Matrix.tar.gz
+sha256  25799d0d043df7819c767adc89d081cbd6eb61d29135befbc621719274a1c074  kodi-pvr-hts-19.0.4-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index d1fc4d0ed2..6c9e5a715f 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 19.0.3-Matrix
+KODI_PVR_HTS_VERSION = 19.0.4-Matrix
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
