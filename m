Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1F8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 14:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 391DB41755;
	Sun, 22 May 2022 14:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0IpN6k54yDb; Sun, 22 May 2022 14:30:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DAA241713;
	Sun, 22 May 2022 14:30:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D681C1BF35B
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 14:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C483B41713
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 14:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-gy0hPVUkzK for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 14:30:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AC444170F
 for <buildroot@buildroot.org>; Sun, 22 May 2022 14:30:33 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout08.t-online.de (Postfix) with SMTP id 8122DE587
 for <buildroot@buildroot.org>; Sun, 22 May 2022 16:30:30 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.201.144]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nsmbD-22syBt0; Sun, 22 May 2022 16:30:27 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:56588)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nsmbD-0006OQ-Bj
 for buildroot@buildroot.org; Sun, 22 May 2022 16:30:27 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 16:30:27 +0200
Message-Id: <20220522143027.1258744-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653229827-00014AB5-16A78665/0/0 CLEAN NORMAL
X-TOI-MSGID: d03a8a02-fc7b-4255-9f6a-2e4b6653bee9
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-vfs-libarchive: bump
 version to 19.2.0-Matrix
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
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash | 2 +-
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
index f3a2c8fcef..c0468517f2 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1360154d86bc73fc6f01f546d7b09a92968653cf05b037b0cd80a825d95a9187  kodi-vfs-libarchive-19.0.1-Matrix.tar.gz
+sha256  957c76d3327b618396d9530394b235cebb73090b53afdeb2bd0d87f9677622d9  kodi-vfs-libarchive-19.2.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
index eac02d7442..1f79bad71f 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_LIBARCHIVE_VERSION = 19.0.1-Matrix
+KODI_VFS_LIBARCHIVE_VERSION = 19.2.0-Matrix
 KODI_VFS_LIBARCHIVE_SITE = $(call github,xbmc,vfs.libarchive,$(KODI_VFS_LIBARCHIVE_VERSION))
 KODI_VFS_LIBARCHIVE_LICENSE = GPL-2.0+
 KODI_VFS_LIBARCHIVE_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
