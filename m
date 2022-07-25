Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A3CC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 20:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A184E826C2;
	Mon, 25 Jul 2022 20:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A184E826C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qukZNUo9xsOD; Mon, 25 Jul 2022 20:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F4682BC8;
	Mon, 25 Jul 2022 20:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F4682BC8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 522F11BF32A
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A840410C8
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 20:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A840410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GAZdW_-KILiq for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 20:53:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32D36410B9
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 20:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32D36410B9
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F2D3885DAB; Mon, 25 Jul 2022 20:39:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 22:52:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d3d2d2741a27d5caed09906eba1402afe906f35
X-Git-Newrev: fdd0260d4b5802f1d57832b29b8621cb9ecaf1cf
X-Patchwork-Hint: ignore
Message-Id: <20220725203942.F2D3885DAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/beaglev-ddrinit: update to latest
 8d6318
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdd0260d4b5802f1d57832b29b8621cb9ecaf1cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to latest "master" version:

8d6318acfe71e790c983b34448c9abfcfcec3ed8

Signed-off-by: Christian Stewart <christian@paral.in>
---
 boot/beaglev-ddrinit/beaglev-ddrinit.hash | 2 +-
 boot/beaglev-ddrinit/beaglev-ddrinit.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
index 2aaab53a3b..d4235904d1 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.hash
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d491f64bd77de9dfd4b8ae6c00e83670e80c205cc20917fefa6194b1dc1fe4e  beaglev-ddrinit-c0839f25246d9e308c23498d344ca13d8a7ad6ed.tar.gz
+sha256  08a49355f89fc2cb4f5101183339c9c6f86b722545d0abbc319aab26a511dad7  beaglev-ddrinit-8d6318acfe71e790c983b34448c9abfcfcec3ed8.tar.gz
 sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
index 76406ed4c5..d9707de610 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.mk
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_DDRINIT_VERSION = c0839f25246d9e308c23498d344ca13d8a7ad6ed
+BEAGLEV_DDRINIT_VERSION = 8d6318acfe71e790c983b34448c9abfcfcec3ed8
 BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
 BEAGLEV_DDRINIT_INSTALL_TARGET = NO
 BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
@@ -15,7 +15,7 @@ BEAGLEV_DDRINIT_LICENSE_FILES = LICENSE
 
 define BEAGLEV_DDRINIT_BUILD_CMDS
 	$(MAKE) -C $(@D)/build \
-		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
+		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
 		SUFFIX=buildroot \
 		GIT_VERSION=$(BEAGLEV_DDRINIT_VERSION)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
