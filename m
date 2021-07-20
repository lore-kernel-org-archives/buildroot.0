Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0343C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:57:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725D060F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 725D060F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E68B4234E;
	Tue,  3 Aug 2021 23:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4g-rRIJaNwRQ; Tue,  3 Aug 2021 23:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B68A4237E;
	Tue,  3 Aug 2021 23:57:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97B011BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4CBE40F7D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcEyQg3nIiSv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDF6540EF4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2CE418553E; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 21:41:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5e590ede9447507aa99ba233ff71ae55f7c59f59
X-Git-Newrev: cf1247895a58aa80e505fac8117f0ae577e45f45
X-Patchwork-Hint: ignore
Message-Id: <20210803211011.2CE418553E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-examples: bump
 to version 3.13.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=cf1247895a58aa80e505fac8117f0ae577e45f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump OP-TEE Examples package version to OP-TEE release 3.13.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index d43534832a..5e1839f43f 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.12.0/optee-examples-3.12.0.tar.gz
-sha256 d3ae2cc4c51900a887f4c93e58571305bd37d60718a281953c3d775b3113f1f8  optee-examples-3.12.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.13.0/optee-examples-3.13.0.tar.gz
+sha256 2e97252a57a5d84fa5f33adec976cea2dbfb0e17f60b1ee912041be74f6b14f8  optee-examples-3.13.0.tar.gz
 # Locally computed
 sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index ca7956e5bc..484245c951 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.12.0
+OPTEE_EXAMPLES_VERSION = 3.13.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
