Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DEBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E4F61AB3;
	Sat, 23 Jul 2022 08:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E4F61AB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pXLOVYsFa6UL; Sat, 23 Jul 2022 08:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D77E5617B7;
	Sat, 23 Jul 2022 08:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D77E5617B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 348C31BF2C7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F2E6422FE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2E6422FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pkP3B57ZJyuD for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:49:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 384B142331
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 384B142331
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C60A4842C0; Sat, 23 Jul 2022 08:36:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 10:34:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a073216b80313e2266836b070bc5647328caa5bf
X-Git-Newrev: be14bab505cc154e2414fe1059fbae21313fef4f
X-Patchwork-Hint: ignore
Message-Id: <20220723083612.C60A4842C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-benchmark: bump to version
 3.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=be14bab505cc154e2414fe1059fbae21313fef4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps OP-TEE benchmark package version to OP-TEE release 3.18.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/optee-benchmark/optee-benchmark.hash | 4 ++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 54981c9d2c..27c91e0fb0 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.17.0/optee-benchmark-3.17.0.tar.gz
-sha256  50a4623a4c34909e722d403381e4077c84d7189ab3a7ed57a402a3461bee13e3  optee-benchmark-3.17.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.18.0/optee-benchmark-3.18.0.tar.gz
+sha256  2151aa5da062402518f35823d9c9dffa2e012f924625d2f7123e0d21d350a86b  optee-benchmark-3.18.0.tar.gz
 # Locally computed
 sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 1f5e01b868..1071c4bb5c 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.17.0
+OPTEE_BENCHMARK_VERSION = 3.18.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
