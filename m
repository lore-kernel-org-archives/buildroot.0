Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94E9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93A398486A;
	Fri, 18 Mar 2022 22:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hkd7qsI14Bqv; Fri, 18 Mar 2022 22:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEEA784853;
	Fri, 18 Mar 2022 22:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00B8B1C1148
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E249C84853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RRL3O3I_hBT for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EF5284808
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 60A2D83E3B; Fri, 18 Mar 2022 22:36:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 23:44:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc6cbab1d3f050df66945711a8c5d22c473defa8
X-Git-Newrev: 6631e1f70897c4e83feeeb33396034f0daadba86
X-Patchwork-Hint: ignore
Message-Id: <20220318223653.60A2D83E3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-examples: bump to version
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
Content-Type: multipart/mixed; boundary="===============4329181465897231851=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4329181465897231851==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6631e1f70897c4e83feeeb33396034f0daadba86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Examples package version to OP-TEE release 3.16.0.

Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/optee-examples/optee-examples.hash | 6 +++---
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index f88904c795..9228fb39d2 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.15.0/optee-examples-3.15.0.tar.gz
-sha256 9770827292eea85068913077d3406070f6182389779c5d4a5c0876bffd962353  optee-examples-3.15.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.16.0/optee-examples-3.16.0.tar.gz
+sha256  45e06dc5520f3097cc124434acafc26b8db28db87df62f3ad2ddff06cacce969  optee-examples-3.16.0.tar.gz
 # Locally computed
-sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
+sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 2b46dcc1eb..31e5f260df 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.15.0
+OPTEE_EXAMPLES_VERSION = 3.16.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE

--===============4329181465897231851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4329181465897231851==--
