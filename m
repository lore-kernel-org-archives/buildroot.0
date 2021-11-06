Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCB6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 08:44:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D58E1611C1
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 08:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D58E1611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4B19608FB;
	Sat,  6 Nov 2021 08:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5u1Tk8QfDfk5; Sat,  6 Nov 2021 08:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11F2F6073D;
	Sat,  6 Nov 2021 08:44:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F58D1BF3EB
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 08:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F8634061C
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 08:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fmmWwmwFFdY4 for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 08:44:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87F1D40608
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 08:44:33 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout06.t-online.de (Postfix) with SMTP id 5F6FA16A37
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 09:43:21 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.142]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mjHIE-2clInp0; Sat, 6 Nov 2021 09:43:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:40868)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mjHIE-0001t6-2l
 for buildroot@buildroot.org; Sat, 06 Nov 2021 09:43:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 09:43:16 +0100
Message-Id: <20211106084316.7915-9-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211106084316.7915-1-bernd.kuhls@t-online.de>
References: <20211106084316.7915-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636188198-00001440-D7558EF4/0/0 CLEAN NORMAL
X-TOI-MSGID: ceb106d2-ae21-451a-a561-32c9cd1a7e29
Subject: [Buildroot] [PATCH 9/9] package/kodi-pvr-wmc: bump version to
 19.0.1-Matrix
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
index 32f98a1271..bfd95b37f7 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d3cfa954c01ddec0f69e6777a12fca6314ee579d770a4be8728657e323a8eb8c  kodi-pvr-wmc-19.0.0-Matrix.tar.gz
+sha256  f8e05a70948f31289a5c1a19114e904e088189ad12bf478dc4ab8e3b7dca211e  kodi-pvr-wmc-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 313335b91a..2eaaaaa77a 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 19.0.0-Matrix
+KODI_PVR_WMC_VERSION = 19.0.1-Matrix
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
