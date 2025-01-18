Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B92DC282D1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B63E707D6;
	Fri, 28 Feb 2025 17:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VF53G6ws3QHl; Fri, 28 Feb 2025 17:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D51A6707D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D51A6707D5;
	Fri, 28 Feb 2025 17:00:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07B6B1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EF4242642
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJFXtk5wG09h for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB2D4419D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB2D4419D7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF1FE85EF6; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 22:12:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0d2788c2ea5eca3a93fb7313bed0431e6c4e14d
X-Git-Newrev: a663be1b0527d7fdeb2cdfc23a250ade2a617d87
X-Patchwork-Hint: ignore
Message-Id: <20250228163014.CF1FE85EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi-audioencoder-*:
 mass version bump to 21.0.2-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=a663be1b0527d7fdeb2cdfc23a250ade2a617d87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
index 8910a6e499..de326bc619 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  37bf7e8b6bff74f7609df7c7d0672b2c847ac6bc8d0a586a7a8c136712d57cbd  kodi-audioencoder-flac-de8f0937d8f3ddda987599041b82b7f1c32beec7.tar.gz
+sha256  2e7f21f4c42ac2c627ed381436d430a83f18ebc07cb92e91b6c98c4ff9528cc5  kodi-audioencoder-flac-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 6d7920b108..5fccb82313 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = de8f0937d8f3ddda987599041b82b7f1c32beec7
+KODI_AUDIOENCODER_FLAC_VERSION = 21.0.2-Omega
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 17a2524756..6c9439ec5d 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4241e4d4a5b6619de684d67b79b8e7b18003cee6dcc6d8f87e5c429899f48146  kodi-audioencoder-lame-f272aeb7aeb94e9d8bf1454e23f0232790bf0ef6.tar.gz
+sha256  cf593053e7413f6790352ab3c2fcf227763a23c8e7a90381b46afdde3d92df7f  kodi-audioencoder-lame-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index b0a870995d..a1fa2c51dd 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = f272aeb7aeb94e9d8bf1454e23f0232790bf0ef6
+KODI_AUDIOENCODER_LAME_VERSION = 21.0.2-Omega
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 6a5617717c..91f51421c2 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6b05ece93cb843a84facd1240141b6f1ea0653b07e95939f9837310bc3ecdda7  kodi-audioencoder-vorbis-88c1a68efa644aaf2bb91378e26a3f054dcf025c.tar.gz
+sha256  5acd05c5e90459c1f07abe60c1df40f72ebcb3519287f104968c7cad17aca07d  kodi-audioencoder-vorbis-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 11c1a863f1..85a320c55c 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 88c1a68efa644aaf2bb91378e26a3f054dcf025c
+KODI_AUDIOENCODER_VORBIS_VERSION = 21.0.2-Omega
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index 56f16824ab..34370b536b 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2f9d7bf7be9b4d521a103115e204150fd029c50fb55e6fd700d32945a8d8551  kodi-audioencoder-wav-d4449bb3f2066893649cdbcc72375a628e610289.tar.gz
+sha256  2bbc3e15706e02bbd3e6be3c232522e2091509a6fdf88d8af5db4cd6bf7b3476  kodi-audioencoder-wav-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 8dbc84038b..76f092302b 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = d4449bb3f2066893649cdbcc72375a628e610289
+KODI_AUDIOENCODER_WAV_VERSION = 21.0.2-Omega
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
