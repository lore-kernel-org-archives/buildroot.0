Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB773C77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 16:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6619661555;
	Wed,  3 May 2023 16:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6619661555
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmmgzADSVG83; Wed,  3 May 2023 16:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ADE66155B;
	Wed,  3 May 2023 16:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ADE66155B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4648F1BF3FF
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 16:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC783818CA
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 16:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC783818CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDDiwXfZ2UJ6 for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 16:45:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0BE2819F3
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0BE2819F3
 for <buildroot@buildroot.org>; Wed,  3 May 2023 16:45:03 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout03.t-online.de (Postfix) with SMTP id 65FA11856B
 for <buildroot@buildroot.org>; Wed,  3 May 2023 18:45:01 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.11.39]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1puFbA-0Na52X0; Wed, 3 May 2023 18:45:00 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:51960)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1puFb9-0002ho-2D
 for buildroot@buildroot.org; Wed, 03 May 2023 18:44:59 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 18:44:51 +0200
Message-Id: <20230503164458.747478-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503164458.747478-1-bernd.kuhls@t-online.de>
References: <20230503164458.747478-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683132300-87355C3F-03CDEADA/0/0 CLEAN NORMAL
X-TOI-MSGID: 21e611a6-dd75-45a9-9043-7c320716261b
Subject: [Buildroot] [PATCH 04/11] package/kodi-audioencoder-*: mass version
 bump to Nexus
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
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash     | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk       | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash     | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk       | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk   | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash       | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index 5784c2585b..e54eafcdf8 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fdc70c68b10e28469c8d20f5a0dcc1c24fdddda81afe98dd031bff58c8e184e8  kodi-audioencoder-flac-19.0.1-Matrix.tar.gz
+sha256  71daf8c35bbf644591600fef93412cd068a6bf6173d2258dc243ee04c8e5b091  kodi-audioencoder-flac-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 65d5ff4aee..d14843cb53 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 19.0.1-Matrix
+KODI_AUDIOENCODER_FLAC_VERSION = 20.2.0-Nexus
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index a9cb12af6a..f66db7d680 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  774e75b051b1872620a706aa5e6c8741708364ac8d9d849286c4a265dd1a22f7  kodi-audioencoder-lame-19.1.2-Matrix.tar.gz
+sha256  90f36ee0b4972669ed2876eae2502e58d86287aacdbf4bb25180aca01385e1c1  kodi-audioencoder-lame-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index fbc7489782..ce891f1838 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 19.1.2-Matrix
+KODI_AUDIOENCODER_LAME_VERSION = 20.3.0-Nexus
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 02e976f2d4..2b551a81df 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  26f5b3e60ec3d3e17ea81a009fc91886159335fb8eec56e874e357901c90deeb  kodi-audioencoder-vorbis-19.0.1-Matrix.tar.gz
+sha256  359e972ddcc498727620ff224a82f970fa2ae22b71ea6ab30b96898dffe6f1f9  kodi-audioencoder-vorbis-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 66faba19f3..451884d0bc 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 19.0.1-Matrix
+KODI_AUDIOENCODER_VORBIS_VERSION = 20.2.0-Nexus
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index f616d76992..9318b69e48 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  32069979efb02daaa79b8ce09e060eed73f3fa73a4614b6c67e50ee33f1b096f  kodi-audioencoder-wav-19.0.1-Matrix.tar.gz
+sha256  1baf69cca688ebd389705ea2bef2c5285ba75dcfd0d0b534b6ab1e61c0020979  kodi-audioencoder-wav-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index d8c7b1a694..b13ee8ea4c 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 19.0.1-Matrix
+KODI_AUDIOENCODER_WAV_VERSION = 20.2.0-Nexus
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
