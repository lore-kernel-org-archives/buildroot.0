Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9DFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6731B41977;
	Wed, 27 Apr 2022 19:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBRfo5e8pkvG; Wed, 27 Apr 2022 19:44:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E56404181E;
	Wed, 27 Apr 2022 19:44:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C59561BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46996400BA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yxyk7c-46R03 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FF9F40A0D
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A9FC584607; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:27:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffa62a6c81b26b9769a339ed0f9022cf39029601
X-Git-Newrev: 48f839511980b2519542619c150b588221fea821
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.A9FC584607@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-benchmark: bump to version
 3.17.0
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
Content-Type: multipart/mixed; boundary="===============7224283425097671089=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7224283425097671089==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=48f839511980b2519542619c150b588221fea821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Benchmark package version to OP-TEE release 3.17.0.

Cc: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/optee-benchmark/optee-benchmark.hash | 4 ++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 2e75b4ff8e..54981c9d2c 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.16.0/optee-benchmark-3.16.0.tar.gz
-sha256  55b24525f08ffda6799f90ab7bab2125f1c3f17d5cbd1b34480cd28b5f46fca9  optee-benchmark-3.16.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.17.0/optee-benchmark-3.17.0.tar.gz
+sha256  50a4623a4c34909e722d403381e4077c84d7189ab3a7ed57a402a3461bee13e3  optee-benchmark-3.17.0.tar.gz
 # Locally computed
 sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 493f407a44..1f5e01b868 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.16.0
+OPTEE_BENCHMARK_VERSION = 3.17.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE

--===============7224283425097671089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7224283425097671089==--
