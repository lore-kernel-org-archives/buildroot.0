Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45CFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B88941917;
	Fri, 18 Mar 2022 22:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtYMRfRWlBXR; Fri, 18 Mar 2022 22:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89901418EB;
	Fri, 18 Mar 2022 22:46:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32AB01C1162
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F83C40275
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HltzFEzqBA44 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A6DE40131
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:45:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 55CAC83D37; Fri, 18 Mar 2022 22:36:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 23:43:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5d441b7f2ee822112bd73643370b902ee22f9de
X-Git-Newrev: bc6cbab1d3f050df66945711a8c5d22c473defa8
X-Patchwork-Hint: ignore
Message-Id: <20220318223653.55CAC83D37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-test: bump to version 3.16.0
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
Content-Type: multipart/mixed; boundary="===============6315832071749022951=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6315832071749022951==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bc6cbab1d3f050df66945711a8c5d22c473defa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE test package version to OP-TEE release 3.16.0.

Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/optee-test/optee-test.hash | 6 +++---
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 5d68f94fbd..c42e922d90 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.15.0/optee-test-3.15.0.tar.gz
-sha256 9c2b6b80055cbef0f9bccce17dde494725bc71d9013dacaeb3e46d0926191098  optee-test-3.15.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.16.0/optee-test-3.16.0.tar.gz
+sha256  b24a3871605a341fa87e6d4e111f97001f11a72c025e75d6739ed78841b6acba  optee-test-3.16.0.tar.gz
 # Locally computed
-sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
+sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index f2117c0d00..7b27558b36 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.15.0
+OPTEE_TEST_VERSION = 3.16.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md

--===============6315832071749022951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6315832071749022951==--
