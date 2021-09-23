Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5E7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:06:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C3660EFF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44C3660EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECAF18413E;
	Thu, 23 Sep 2021 21:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xavs2OpBqDT9; Thu, 23 Sep 2021 21:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0C284283;
	Thu, 23 Sep 2021 21:06:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9091D1BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8099A8408B
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hrEDBetoTP0B for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC07840CE
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 29D448D210; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 22:16:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0132f4748c8ab9596057b3fa217ae3621800dd79
X-Git-Newrev: 3252ac7b639db48e15bb72e356a9caca6150d3a4
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.29D448D210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rt-tests: bump version to 2.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3252ac7b639db48e15bb72e356a9caca6150d3a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rt-tests/rt-tests.hash | 2 +-
 package/rt-tests/rt-tests.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index f56500c26e..c731feaf21 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,4 +1,4 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
-sha256 3740ad97b164a1cd77d9ee32bba23a4a0b2495a76468bcf40ff60b55c2a3a709  rt-tests-1.10.tar.xz
+sha256 48346ab2b5bf2ffbdb1ed0d4540e9e8e22f6665e6bb3d59c22614f9722b13a91  rt-tests-2.2.tar.xz
 # locally computed hash
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 0d959bda31..a0d7f76e8e 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -6,7 +6,7 @@
 
 RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
-RT_TESTS_VERSION = 1.10
+RT_TESTS_VERSION = 2.2
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
