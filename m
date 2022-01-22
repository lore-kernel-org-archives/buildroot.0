Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED13C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 13:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC5260AA3;
	Sat, 22 Jan 2022 13:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2EfKhFGlG5Rm; Sat, 22 Jan 2022 13:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2F8760615;
	Sat, 22 Jan 2022 13:39:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6B0A1BF3D5
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3B788277E
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWSATaWhJhkp for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 13:39:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 183D581368
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 13:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3BF6082914; Sat, 22 Jan 2022 13:32:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 14:38:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5e36f80a6629ef5701d4751d7fc6f7dd6a98476
X-Git-Newrev: 61ef0ff827754d07cd006f3107d4772ba1d2d1fc
X-Patchwork-Hint: ignore
Message-Id: <20220122133233.3BF6082914@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxcrypt: bump to version 4.4.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=61ef0ff827754d07cd006f3107d4772ba1d2d1fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the LICENSING file is modified due to changes in file
paths listed in that file. No impact on the licensing terms.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index b47f470020..99ddf62be0 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  e8a544dd19171c1e6191a6044c96cc31496d781ba08b5a00f53310d001d58114  libxcrypt-4.4.26.tar.gz
-sha256  cead8b3d94a143f64ccb571ada1cea47a70a0b847c8d95306e8d78ed68951f3d  LICENSING
+sha256  e4ff47b7fa5370fa08e27258f8a0de5cb7e9b09c297ec7ab56a8a82e229a1c84  libxcrypt-4.4.27.tar.gz
+sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 3c98b30dd5..65efa2bab9 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.26
+LIBXCRYPT_VERSION = 4.4.27
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
