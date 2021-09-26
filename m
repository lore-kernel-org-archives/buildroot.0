Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BF2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5754A60F9C
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5754A60F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3083060712;
	Sun, 26 Sep 2021 19:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6ZVoOWa9i_h; Sun, 26 Sep 2021 19:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9787160591;
	Sun, 26 Sep 2021 19:54:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16BFC1BF97A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E9CD6078E
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhMThWVeWMbB for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A1C96071B
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B0D9B8D25D; Sun, 26 Sep 2021 19:50:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:08:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe77c30f6129d01875a33135be172beea175fbc6
X-Git-Newrev: a43a40ea688ca9e45ff21331e1c1aae86393b0ad
X-Patchwork-Hint: ignore
Message-Id: <20210926195017.B0D9B8D25D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-vfs-rar: bump version to
 19.0.0-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=a43a40ea688ca9e45ff21331e1c1aae86393b0ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-vfs-rar/kodi-vfs-rar.hash | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index e4d0f7fe63..b5f7fc7f24 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1111d1f90cc4addc2adb0884b779f4b47e30abb2766ba1708053e5f100b514bf  kodi-vfs-rar-4.0.0-Matrix.tar.gz
+sha256  50f188649466752be3aada267a64252813bac6b975a65527b96a571bd3fb47f5  kodi-vfs-rar-19.0.0-Matrix.tar.gz
 # License files
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index 001bd7c61c..6eda193e00 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 4.0.0-Matrix
+KODI_VFS_RAR_VERSION = 19.0.0-Matrix
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
