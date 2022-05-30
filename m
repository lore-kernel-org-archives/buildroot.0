Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EC9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 15:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F39484024;
	Mon, 30 May 2022 15:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHc4mOz2x5GM; Mon, 30 May 2022 15:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 171C484074;
	Mon, 30 May 2022 15:47:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17EB31BF97C
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 15:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 073F683EBB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 15:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LDZFbxZwoTxr for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 15:47:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4163983E09
 for <buildroot@buildroot.org>; Mon, 30 May 2022 15:47:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CC5B886718; Mon, 30 May 2022 15:36:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 17:46:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 228a92f6bd90552424a3b7cf6b105e0ffdd1af3b
X-Git-Newrev: 4d87667efe8fc57471496f11e74be15de2aeb12c
X-Patchwork-Hint: ignore
Message-Id: <20220530153605.CC5B886718@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntfs-3g: security bump to version
 2022.5.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d87667efe8fc57471496f11e74be15de2aeb12c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-46790, CVE-2022-30784, CVE-2022-30786, CVE-2022-30788 and
CVE-2022-30789:
https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-xchm-ph5h-hw4x

https://github.com/tuxera/ntfs-3g/releases/tag/2022.5.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntfs-3g/ntfs-3g.hash | 2 +-
 package/ntfs-3g/ntfs-3g.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index 668e11a800..89bce73559 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb  ntfs-3g_ntfsprogs-2021.8.22.tgz
+sha256  0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93  ntfs-3g_ntfsprogs-2022.5.17.tgz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 21f7cfc46d..64800c5eeb 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2021.8.22
+NTFS_3G_VERSION = 2022.5.17
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
