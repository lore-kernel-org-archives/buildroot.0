Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F8CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 19:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBBE840010;
	Sun,  2 Jan 2022 19:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-3ZXz6KqyYZ; Sun,  2 Jan 2022 19:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FC3940223;
	Sun,  2 Jan 2022 19:11:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72E8C1BF3F4
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 19:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7016D81417
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 19:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08h2pusyGtPS for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 19:10:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2E4B8133C
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 19:10:31 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout07.t-online.de (Postfix) with SMTP id 898CAF57F
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 20:10:27 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.179.119]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n46FP-3un5Hx0; Sun, 2 Jan 2022 20:10:27 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46198)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n46FO-0006Wg-Sm
 for buildroot@buildroot.org; Sun, 02 Jan 2022 20:10:26 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 20:10:25 +0100
Message-Id: <20220102191025.259154-19-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220102191025.259154-1-bernd.kuhls@t-online.de>
References: <20220102191025.259154-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641150627-0000EDC4-44DD933D/0/0 CLEAN NORMAL
X-TOI-MSGID: 5e1a0941-9b6f-4503-85ac-750e4f7ec933
Subject: [Buildroot] [PATCH 19/19] package/kodi-vfs-sftp: bump version to
 19.0.1-Matrix
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
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index 217b2b5ee3..1f3cc4978f 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06015d9c645642f92ed2b28d6c6e3c1c9b149e7fb1e212b66a02510d438b4947  kodi-vfs-sftp-19.0.0-Matrix.tar.gz
+sha256  671bc7bd45d8d744f7e8a60bde9d1f9a0c821d7dd79b9e33d29b2bb2b5d231a1  kodi-vfs-sftp-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index ea6cef069c..6415fcb1de 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 19.0.0-Matrix
+KODI_VFS_SFTP_VERSION = 19.0.1-Matrix
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
