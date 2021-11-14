Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F60EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D839461027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D839461027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4E196072C;
	Sun, 14 Nov 2021 14:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oPgnVDGFLiWB; Sun, 14 Nov 2021 14:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD1966072A;
	Sun, 14 Nov 2021 14:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2581BF973
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 039B680D7E
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DE8gv32vo0nM for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:44:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 435E880D86
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:44:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CC3738D2F4; Sun, 14 Nov 2021 14:40:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:43:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c96d38828f59c7e018d69ed3cc5ff479d23aff30
X-Git-Newrev: 84172271134260eb2c37e56f70f346857e28e998
X-Patchwork-Hint: ignore
Message-Id: <20211114144017.CC3738D2F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/kodi-audioencoder-lame: bump version to 19.1.0-Matrix
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84172271134260eb2c37e56f70f346857e28e998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/xbmc/audioencoder.lame/releases/tag/19.1.0-Matrix

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
