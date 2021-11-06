Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981A7C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 08:46:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59CDA6108D
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 08:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59CDA6108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20E934062E;
	Sat,  6 Nov 2021 08:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2WE-KzEz5vG; Sat,  6 Nov 2021 08:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FF3740623;
	Sat,  6 Nov 2021 08:46:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2521BF3EB
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 08:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B5B140623
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 08:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-o8HU07WTcX for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 08:46:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 319CD40608
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 08:46:01 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout12.t-online.de (Postfix) with SMTP id 4364510FF9
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 09:44:57 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.142]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mjHJm-0iHyO90; Sat, 6 Nov 2021 09:44:54 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:40870)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mjHJm-0002AC-9T
 for buildroot@buildroot.org; Sat, 06 Nov 2021 09:44:54 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 09:44:54 +0100
Message-Id: <20211106084454.8483-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636188294-00001441-40E47033/0/0 CLEAN NORMAL
X-TOI-MSGID: de69fbc6-5fd7-47ed-84aa-c25e126598e1
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-audioencoder-lame: bump
 version to 19.1.0-Matrix
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

Release notes:
https://github.com/xbmc/audioencoder.lame/releases/tag/19.1.0-Matrix

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added select to Config.in (Peter)

 package/kodi-audioencoder-lame/Config.in                   | 1 +
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk   | 6 +++++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audioencoder-lame/Config.in b/package/kodi-audioencoder-lame/Config.in
index dc6a0cd7e5..b050ac6b93 100644
--- a/package/kodi-audioencoder-lame/Config.in
+++ b/package/kodi-audioencoder-lame/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_KODI_AUDIOENCODER_LAME
 	bool "kodi-audioencoder-lame"
 	select BR2_PACKAGE_KODI_OPTICALDRIVE
 	select BR2_PACKAGE_LAME
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  An audioencoder addon for Kodi
 
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 7863ff497c..080bef06d2 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2bdf17e5739cc025627a92421b967e5dda3cb35d2e4bb948a64ac97bf0e734e  kodi-audioencoder-lame-19.0.0-Matrix.tar.gz
+sha256  054593ea6572cd1e6ea771758bd759c630f47abef1ad2eeb332d453fc6c03e0b  kodi-audioencoder-lame-19.1.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index b774ac63e9..d2c2750022 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 19.0.0-Matrix
+KODI_AUDIOENCODER_LAME_VERSION = 19.1.0-Matrix
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
@@ -12,4 +12,8 @@ KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
 KODI_AUDIOENCODER_LAME_CONF_OPTS += \
 	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
 
+ifeq ($(BR2_ENABLE_LOCALE),)
+KODI_AUDIOENCODER_LAME_DEPENDENCIES += libiconv
+endif
+
 $(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
