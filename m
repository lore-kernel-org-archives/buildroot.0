Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A657C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9CCB419D6;
	Fri, 18 Mar 2022 22:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dcS2xHFWBF1; Fri, 18 Mar 2022 22:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EFED4190F;
	Fri, 18 Mar 2022 22:46:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EECF1BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1CB184808
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-iF5k0uCORo for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C5D98480A
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7C0E183D37; Fri, 18 Mar 2022 22:36:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 23:45:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91f8e51217d295d6249d8a3945406ea5546129e7
X-Git-Newrev: 00c51867756180883e197b676723feb14c7934a2
X-Patchwork-Hint: ignore
Message-Id: <20220318223653.7C0E183D37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-benchmark: bump to version
 3.16.0
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
Content-Type: multipart/mixed; boundary="===============8173241806064116361=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8173241806064116361==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=00c51867756180883e197b676723feb14c7934a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Benchmark package version to OP-TEE release 3.16.0.

Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/optee-benchmark/optee-benchmark.hash | 6 +++---
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 3797920c35..2e75b4ff8e 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.15.0/optee-benchmark-3.15.0.tar.gz
-sha256 f1ddac5e9f58333194eb302e6d9840fa334300bc103abb3d9f783bf009a78c50 optee-benchmark-3.15.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.16.0/optee-benchmark-3.16.0.tar.gz
+sha256  55b24525f08ffda6799f90ab7bab2125f1c3f17d5cbd1b34480cd28b5f46fca9  optee-benchmark-3.16.0.tar.gz
 # Locally computed
-sha256 0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
+sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 1357f9f270..493f407a44 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.15.0
+OPTEE_BENCHMARK_VERSION = 3.16.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE

--===============8173241806064116361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8173241806064116361==--
