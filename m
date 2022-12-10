Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F5AC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38468404CA;
	Mon, 20 Feb 2023 22:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38468404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JLYlYYHrACK; Mon, 20 Feb 2023 22:08:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B76E74EE8B;
	Mon, 20 Feb 2023 22:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76E74EE8B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66AA81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BBE761153
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BBE761153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXOuorbi-371 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D9AF6101C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D9AF6101C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D8E28648F; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:56:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 917a961d9c77d5f1aaa47206add9b9ff80e74a82
X-Git-Newrev: 4e86fdfa4d047a2f7f6d8f56b9ea056e65d35ea4
X-Patchwork-Hint: ignore
Message-Id: <20230220205200.1D8E28648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-examples: bump
 to version 3.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e86fdfa4d047a2f7f6d8f56b9ea056e65d35ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bumps OP-TEE examples package version to OP-TEE release 3.19.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 876584c5e9..937dd44c8c 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.18.0/optee-examples-3.18.0.tar.gz
-sha256  6c64fbc6c5d1282b6311b4076351abbbfab10ac918c6cfc60e45ec705bb5a9ec  optee-examples-3.18.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.19.0/optee-examples-3.19.0.tar.gz
+sha256  545f9438885220e890a4f785249a586a957b22dacc31a3cbafa4656f8e9db349  optee-examples-3.19.0.tar.gz
 # Locally computed
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 17adce0fe0..bb2b208583 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.18.0
+OPTEE_EXAMPLES_VERSION = 3.19.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
