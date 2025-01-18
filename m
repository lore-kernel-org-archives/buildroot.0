Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D26C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25CCB706CB;
	Fri, 28 Feb 2025 17:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tl6OYXytnkV8; Fri, 28 Feb 2025 17:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA5B707E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFA5B707E4;
	Fri, 28 Feb 2025 17:01:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 104EE68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09ADC4998D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHht1gK4Jbby for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EA9842E4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EA9842E4F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7416387A55; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 22:13:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 41013bb615b9eb1e20874bbe6e2b47ed2fac062d
X-Git-Newrev: 5940088ffcb98460659b64a8840150cdf8c1f5ae
X-Patchwork-Hint: ignore
Message-Id: <20250228163015.7416387A55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi-vfs-*: mass
 version bump to 21.0.2-Omega
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

commit: https://git.buildroot.net/buildroot/commit/?id=5940088ffcb98460659b64a8840150cdf8c1f5ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash | 2 +-
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk   | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash               | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk                 | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash             | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
index 729a569f9a..e65ba18fa5 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  23515c84f4a0cceaf845c1d6c0c39947a28be2d515cff995b384b29e93b11831  kodi-vfs-libarchive-0333aa5e189221e76282eeefb3f573e27b187551.tar.gz
+sha256  aab35cb6b03191609a7e97df02f2f102659c12e414f7b95595f9bb2047554daf  kodi-vfs-libarchive-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
index 257a0d04f6..ee1ca59b52 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_LIBARCHIVE_VERSION = 0333aa5e189221e76282eeefb3f573e27b187551
+KODI_VFS_LIBARCHIVE_VERSION = 21.0.2-Omega
 KODI_VFS_LIBARCHIVE_SITE = $(call github,xbmc,vfs.libarchive,$(KODI_VFS_LIBARCHIVE_VERSION))
 KODI_VFS_LIBARCHIVE_LICENSE = GPL-2.0+
 KODI_VFS_LIBARCHIVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index e368515a5a..c69e57758f 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c1da0e8aafa5419ae414857893a59c22109138ad7245071e0678b26f401a7be1  kodi-vfs-rar-2f49a0de43bc9f4e91dfec73a13dcb04df285233.tar.gz
+sha256  7492cf73d52299218acc982c4b35b020ea801d36d47e40460341f4dde712de50  kodi-vfs-rar-21.0.2-Omega.tar.gz
 # License files
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index 8dfd205c27..7cffe1274a 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 2f49a0de43bc9f4e91dfec73a13dcb04df285233
+KODI_VFS_RAR_VERSION = 21.0.2-Omega
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index 12ddbae63d..3a59241d7b 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2197096f7081d140efb573e1afcee257e55bd0312e48c25e787bf10879e6bc92  kodi-vfs-sftp-9fe870e71a10a37f2d793b2261bac48b195f2705.tar.gz
+sha256  01a23958331cb0cd78fd2e9367d1269d4319c20b84db5b132632f9c1acd5f3c5  kodi-vfs-sftp-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index e3298465fe..18ea2bc099 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 9fe870e71a10a37f2d793b2261bac48b195f2705
+KODI_VFS_SFTP_VERSION = 21.0.2-Omega
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
