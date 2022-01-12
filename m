Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D94C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBED0415D1;
	Wed, 12 Jan 2022 19:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rv81SHVcBlfQ; Wed, 12 Jan 2022 19:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51BD6415CF;
	Wed, 12 Jan 2022 19:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97FD91BF2CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7DD2415CE
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Qx3NfvQJI8r for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:46:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36009415D1
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:46:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3C6488353B; Wed, 12 Jan 2022 19:39:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 20:43:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b5e90c3203f944cb7f7ccad766f38580b9b2b6f
X-Git-Newrev: 60e27aee9b089de451c0dc3fe9e3fa3afb329447
X-Patchwork-Hint: ignore
Message-Id: <20220112193954.3C6488353B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: bump to version 2.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=60e27aee9b089de451c0dc3fe9e3fa3afb329447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/FreeRDP/FreeRDP/releases/tag/2.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 637e57e8b0..e31b8d5b96 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.4.1.tar.gz.sha256
-sha256  ef75c87926643a0d0041f6556e343ac037380d4260c64885e7cdd20da0147edf  freerdp-2.4.1.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.5.0.tar.gz.sha256
+sha256  0fd9396068cda8e6d884d063a4993001f140f46c36464ccae261b9475050cd2b  freerdp-2.5.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 40a3904024..c536f6cb1c 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.4.1
+FREERDP_VERSION = 2.5.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
