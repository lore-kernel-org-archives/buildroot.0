Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D7C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B55F410AF;
	Thu,  9 May 2024 14:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBH83gMcRVse; Thu,  9 May 2024 14:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDBF403A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBDBF403A7;
	Thu,  9 May 2024 14:10:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4D301BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91CDD402E4
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6abL5hHDOmCf for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8D41400F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8D41400F5
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:10:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C255E86B83; Thu,  9 May 2024 14:10:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 16:08:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00773beaafc4b490656fdb0b2b5073b4d929a05b
X-Git-Newrev: 4bb20622e32423e5e15c414306c8026a19bc46a7
X-Patchwork-Hint: ignore
Message-Id: <20240509141042.C255E86B83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-examples: bump to version
 4.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4bb20622e32423e5e15c414306c8026a19bc46a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps OP-TEE examples package version to OP-TEE release 4.2.0.

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 71cd95605d..a60b6619f1 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/4.0.0/optee-examples-4.0.0.tar.gz
-sha256  4e21455c889ffb93085eb76f76ce191e24f394b3fa8f1d2429cad38a36e4f6e5  optee-examples-4.0.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/4.2.0/optee-examples-4.2.0.tar.gz
+sha256  fcc032f84c0c7c90fbc3936c6d4d10e502797da7a7c23780ce2a5a88a720887d  optee-examples-4.2.0.tar.gz
 # Locally computed
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index d620f0e36a..7d52a277d2 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 4.0.0
+OPTEE_EXAMPLES_VERSION = 4.2.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
