Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C5CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 11:58:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC13861038
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 11:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC13861038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B886C80F4B;
	Sun, 26 Sep 2021 11:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IxO1B0VZaak; Sun, 26 Sep 2021 11:58:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE3380EF3;
	Sun, 26 Sep 2021 11:58:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD8AC1BF354
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 11:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB6F84021D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 11:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqGsskm5qzei for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 11:57:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E344640214
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 11:57:22 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout11.t-online.de (Postfix) with SMTP id AB34E2577
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:57:20 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.205.79]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mUSmW-1Nwbj70; Sun, 26 Sep 2021 13:57:20 +0200
Received: from [192.168.1.109] (port=47022 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mUSmV-0000iz-JM
 for buildroot@buildroot.org; Sun, 26 Sep 2021 13:57:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 13:56:46 +0200
Message-Id: <20210926115717.1687968-11-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210926115717.1687968-1-bernd.kuhls@t-online.de>
References: <20210926115717.1687968-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632657440-00001454-9183CED2/0/0 CLEAN NORMAL
X-TOI-MSGID: b92d84cc-089d-4eba-96e4-068e23fd7744
Subject: [Buildroot] [PATCH 11/42] package/kodi-visualisation-fishbmc: bump
 version to 19.0.0-Matrix
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
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash  | 2 +-
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index f03602c003..c595b0ba1b 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fd6a4383e36ed67590d40eb945d11bc5eae0c83e0ea56bfcadbc0ff03de0b2a4  kodi-visualisation-fishbmc-6.3.0-Matrix.tar.gz
+sha256  b8cb7793f29b3c3d097a5348831347af8fbed1e4ef44d37d9faeff83ff22a830  kodi-visualisation-fishbmc-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index ecb118e52b..1008e6f6f1 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 6.3.0-Matrix
+KODI_VISUALISATION_FISHBMC_VERSION = 19.0.0-Matrix
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
