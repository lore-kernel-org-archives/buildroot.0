Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12C1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 19:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E47402E1;
	Sun,  2 Jan 2022 19:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id leY9SykR6_Um; Sun,  2 Jan 2022 19:11:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2704028F;
	Sun,  2 Jan 2022 19:11:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 308BF1BF3F4
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 19:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 203A540288
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 19:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4Mr3dq5nzyj for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 19:10:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E33840286
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 19:10:29 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout10.t-online.de (Postfix) with SMTP id DD4CE5B2
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 20:10:26 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.179.119]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n46FO-28iqYO0; Sun, 2 Jan 2022 20:10:26 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46198)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n46FO-0006Wg-KS
 for buildroot@buildroot.org; Sun, 02 Jan 2022 20:10:26 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 20:10:20 +0100
Message-Id: <20220102191025.259154-14-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220102191025.259154-1-bernd.kuhls@t-online.de>
References: <20220102191025.259154-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641150626-0000B8A1-B26C53B6/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e3a2a15-d728-4e85-8597-55ceb682c49c
Subject: [Buildroot] [PATCH 14/19] package/kodi-pvr-wmc: bump version to
 19.0.2-Matrix
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
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index bfd95b37f7..4a04c07ac8 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f8e05a70948f31289a5c1a19114e904e088189ad12bf478dc4ab8e3b7dca211e  kodi-pvr-wmc-19.0.1-Matrix.tar.gz
+sha256  d5addd39f64f97beb6e14090561583de47f0acdc70bedb39b3037613430cc71a  kodi-pvr-wmc-19.0.2-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 2eaaaaa77a..3bf21b3440 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 19.0.1-Matrix
+KODI_PVR_WMC_VERSION = 19.0.2-Matrix
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
