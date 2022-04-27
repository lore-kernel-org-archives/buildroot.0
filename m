Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A36C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B290283089;
	Wed, 27 Apr 2022 19:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sD78_He5qNBY; Wed, 27 Apr 2022 19:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C4E8301D;
	Wed, 27 Apr 2022 19:44:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B30A1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 026FC813FC
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzBI4BLRZiCA for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E93A8137C
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 99A6084606; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:27:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffd45b8726d42bb299199d9f1e10ee3d3469c85a
X-Git-Newrev: 97f09504aac0c558b2a3a3575f35b4ddf6ea1bb4
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.99A6084606@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-test: bump to version 3.17.0
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
Content-Type: multipart/mixed; boundary="===============4203160044484507703=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4203160044484507703==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=97f09504aac0c558b2a3a3575f35b4ddf6ea1bb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE test package version to OP-TEE release 3.17.0.

Cc: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index c42e922d90..7f2c4110db 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.16.0/optee-test-3.16.0.tar.gz
-sha256  b24a3871605a341fa87e6d4e111f97001f11a72c025e75d6739ed78841b6acba  optee-test-3.16.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.17.0/optee-test-3.17.0.tar.gz
+sha256  5b0555b6fef926f8a0a471285cb4c264407c9be32461836240b3c412bf7933bb  optee-test-3.17.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 7b27558b36..3a5670d26b 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.16.0
+OPTEE_TEST_VERSION = 3.17.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md

--===============4203160044484507703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4203160044484507703==--
