Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CC8C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 10:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0822981AF4;
	Sun,  7 May 2023 10:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0822981AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BlNv2uz-quR; Sun,  7 May 2023 10:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1BF681BB4;
	Sun,  7 May 2023 10:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1BF681BB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D4E01BF307
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 932EC82105
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 932EC82105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SnOboOgC-dBq for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 10:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92AE8820EC
 for <buildroot@buildroot.org>; Sun,  7 May 2023 10:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92AE8820EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79C1285EE1; Sun,  7 May 2023 10:37:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 12:28:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 171d4f56dcf95c356a20174d925690b4feb24e43
X-Git-Newrev: b516744fd1eb2621efb676561460d817de3a1d04
X-Patchwork-Hint: ignore
Message-Id: <20230507103723.79C1285EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-audioencoder-*: mass version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b516744fd1eb2621efb676561460d817de3a1d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
