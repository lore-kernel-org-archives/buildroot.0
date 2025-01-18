Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEDFC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9B166FBF8;
	Fri, 28 Feb 2025 17:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0nfUuvk_jlP; Fri, 28 Feb 2025 17:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC7F6707E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC7F6707E0;
	Fri, 28 Feb 2025 17:00:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DCF71DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3C8E49986
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hh17SVA4jgZa for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E399742E3D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E399742E3D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E09B284109; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 22:12:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a663be1b0527d7fdeb2cdfc23a250ade2a617d87
X-Git-Newrev: 32c66b585fc844b3d20801b132840236247163dd
X-Patchwork-Hint: ignore
Message-Id: <20250228163014.E09B284109@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/kodi-imagedecoder-heif: bump version to 21.0.2-Omega
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

commit: https://git.buildroot.net/buildroot/commit/?id=32c66b585fc844b3d20801b132840236247163dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash | 2 +-
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
index c68a26808e..2fdc34162c 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  12578bc027871dce331ea82070dd8f3e59bf89e72ae43b9178b8083a36be9c23  kodi-imagedecoder-heif-bf9771060dddc753ac7cf1dbf561059cad54dfb0.tar.gz
+sha256  ac4d6604400cccd16399be19ce0fa9129575cb933d8fb5ff4c76b57c3a39eeeb  kodi-imagedecoder-heif-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
index 600f3fa7d2..35dd8547ab 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_HEIF_VERSION = bf9771060dddc753ac7cf1dbf561059cad54dfb0
+KODI_IMAGEDECODER_HEIF_VERSION = 21.0.2-Omega
 KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
 KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
