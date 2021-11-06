Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DB9C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 08:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 483D46108D
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 08:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 483D46108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2475782430;
	Sat,  6 Nov 2021 08:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAyFAoSb3XUR; Sat,  6 Nov 2021 08:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02F3F827C9;
	Sat,  6 Nov 2021 08:44:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFFB21BF95E
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 08:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC6F34061C
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 08:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6fn6v91KyYQ for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 08:43:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DBCE40606
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 08:43:48 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout10.t-online.de (Postfix) with SMTP id AE6C91A1B4
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 09:43:17 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.142]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mjHID-3eIyUz0; Sat, 6 Nov 2021 09:43:17 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:40868)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mjHIC-0001t6-LM
 for buildroot@buildroot.org; Sat, 06 Nov 2021 09:43:16 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 09:43:10 +0100
Message-Id: <20211106084316.7915-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211106084316.7915-1-bernd.kuhls@t-online.de>
References: <20211106084316.7915-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636188197-000010D9-67419D27/0/0 CLEAN NORMAL
X-TOI-MSGID: 1d8a3099-fdc0-4498-939f-45659efaa786
Subject: [Buildroot] [PATCH 3/9] package/kodi-audiodecoder-sidplay: bump
 version to 19.0.1-Matrix
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
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash    | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 906573adbf..28999afb7b 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0da9327e99b18a4ab42f71709ec07ea4e58d9c5f677192c7fa6f5ebb4db5fd08  kodi-audiodecoder-sidplay-19.0.0-Matrix.tar.gz
+sha256  a4fe4f0c48649222930c8c574156c5c3b2ad82fc97de2bdbd0c5e510402853ec  kodi-audiodecoder-sidplay-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index 171171c28d..173a2b10ca 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 19.0.0-Matrix
+KODI_AUDIODECODER_SIDPLAY_VERSION = 19.0.1-Matrix
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
