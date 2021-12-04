Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E42C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CA9C408D0;
	Sat,  4 Dec 2021 22:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ap_4r_sXw0LD; Sat,  4 Dec 2021 22:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7253941BE1;
	Sat,  4 Dec 2021 22:11:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6BB1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C528408D0
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLgir1bonGMd for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:11:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0984408C6
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 69215935E5; Sat,  4 Dec 2021 22:06:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:11:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b4bdf704fea59db81433bbc07585e4c4db258d9a
X-Git-Newrev: acbbe87a865c9d6cdd6311ecf0c3a5063b6d821d
X-Patchwork-Hint: ignore
Message-Id: <20211204220632.69215935E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/kodi-audioencoder-flac: bump version to 19.0.1-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=acbbe87a865c9d6cdd6311ecf0c3a5063b6d821d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index fb75bdbf15..5784c2585b 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ee5ace606749d7d89b0fadf73432f900e4b51f83531f952b193a235e06d1e73  kodi-audioencoder-flac-19.0.0-Matrix.tar.gz
+sha256  fdc70c68b10e28469c8d20f5a0dcc1c24fdddda81afe98dd031bff58c8e184e8  kodi-audioencoder-flac-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 8d875630eb..65d5ff4aee 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 19.0.0-Matrix
+KODI_AUDIOENCODER_FLAC_VERSION = 19.0.1-Matrix
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
