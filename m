Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBA5C54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 20:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B744407BB;
	Sun,  3 Mar 2024 20:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDJXkiSS1d-c; Sun,  3 Mar 2024 20:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FD82407C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD82407C2;
	Sun,  3 Mar 2024 20:35:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3A291BF340
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B15F160626
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kd51q_Rw-bce for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 20:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADD076061C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADD076061C
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 20:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B38388022; Sun,  3 Mar 2024 20:35:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 21:32:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e8545ee43923242c74a5ebbb7ef1b8857ae90550
X-Git-Newrev: bd172e52e7f4d1a0fab860478bd8aba47cf1befd
X-Patchwork-Hint: ignore
Message-Id: <20240303203530.9B38388022@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xz: bump version to
 5.4.6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd172e52e7f4d1a0fab860478bd8aba47cf1befd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Change Log - https://github.com/tukaani-project/xz/commit/0ef8192e8d5af4e6200d5d4aee22d1f177f7a2df

COPYING is updated with the new URL (tukaani.org -> github).

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/xz/xz.hash | 6 +++---
 package/xz/xz.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 3d93ad6b5e..e8025a8065 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,9 +1,9 @@
 # Locally calculated after checking pgp signature
-# https://tukaani.org/xz/xz-5.4.5.tar.bz2.sig
-sha256  8ccf5fff868c006f29522e386fb4c6a1b66463fbca65a4cfc3c4bd596e895e79  xz-5.4.5.tar.bz2
+# https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.bz2.sig
+sha256  913851b274e8e1d31781ec949f1c23e8dbcf0ecf6e73a2436dc21769dd3e6f49  xz-5.4.6.tar.bz2
 
 # Hash for license files
-sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
+sha256  29a1e305b2e34eefe5d4602d00cde1d528b71c5d9f2eec5106972cf6ddb6f73f  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 547959c743..40fa59ca7c 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.5
+XZ_VERSION = 5.4.6
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
-XZ_SITE = https://tukaani.org/xz
+XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
