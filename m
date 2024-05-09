Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3748BC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F062A40546;
	Thu,  9 May 2024 17:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwLBVlUDiI17; Thu,  9 May 2024 17:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9669641F10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9669641F10;
	Thu,  9 May 2024 17:24:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62D871BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48EE180EC9
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hVzubGHTwCc for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6003C80F21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6003C80F21
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56CA986D3A; Thu,  9 May 2024 17:23:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 19:03:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 089de84d5b7a49619f736cc87fcdebd6fb911c73
X-Git-Newrev: ce0f6dee2acf085047c3d6aa8d6937269faa752d
X-Patchwork-Hint: ignore
Message-Id: <20240509172345.56CA986D3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-vfs-*: mass version bump to
 Omega
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce0f6dee2acf085047c3d6aa8d6937269faa752d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash | 2 +-
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk   | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash               | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk                 | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash             | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
index d395ba2d42..1e686715ea 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06be9bfcda3e676e0757ea9602351d67f2bf0aa9aa9e408b14d947772a615e4f  kodi-vfs-libarchive-20.3.0-Nexus.tar.gz
+sha256  22977bd2479244c4b06e2149bae891bc7dbc64649a89813f4e6fc88e78169f68  kodi-vfs-libarchive-a5443a3896b9638018e69d1e4430a7524ac20ffc.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
index 975e28485a..069c92cc5f 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_LIBARCHIVE_VERSION = 20.3.0-Nexus
+KODI_VFS_LIBARCHIVE_VERSION = a5443a3896b9638018e69d1e4430a7524ac20ffc
 KODI_VFS_LIBARCHIVE_SITE = $(call github,xbmc,vfs.libarchive,$(KODI_VFS_LIBARCHIVE_VERSION))
 KODI_VFS_LIBARCHIVE_LICENSE = GPL-2.0+
 KODI_VFS_LIBARCHIVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index 4d7f800acf..e368515a5a 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  50870b24a3663f8d8d88802b327a8fd2fec441a9fed952baf71faba6854a8e1b  kodi-vfs-rar-20.1.0-Nexus.tar.gz
+sha256  c1da0e8aafa5419ae414857893a59c22109138ad7245071e0678b26f401a7be1  kodi-vfs-rar-2f49a0de43bc9f4e91dfec73a13dcb04df285233.tar.gz
 # License files
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index 4322e41abd..8dfd205c27 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 20.1.0-Nexus
+KODI_VFS_RAR_VERSION = 2f49a0de43bc9f4e91dfec73a13dcb04df285233
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index 2f439e8e0d..12ddbae63d 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  66f139d3d06c06d03ceccdcee12b79d3886bd0ea7aec662341736f1c9bdd63e2  kodi-vfs-sftp-20.2.0-Nexus.tar.gz
+sha256  2197096f7081d140efb573e1afcee257e55bd0312e48c25e787bf10879e6bc92  kodi-vfs-sftp-9fe870e71a10a37f2d793b2261bac48b195f2705.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index c050b4bc20..e3298465fe 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 20.2.0-Nexus
+KODI_VFS_SFTP_VERSION = 9fe870e71a10a37f2d793b2261bac48b195f2705
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
