Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A14DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B60A5417C4;
	Sun,  5 Jun 2022 20:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mI_Pi3BEvqMp; Sun,  5 Jun 2022 20:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8111E41796;
	Sun,  5 Jun 2022 20:57:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E46791BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D27AB40D76
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZVCdQYd85LX for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:57:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EDE340104
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:57:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 818BA86BF7; Sun,  5 Jun 2022 20:45:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 22:56:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 811e3d852380b6b5bf67f3349a4e5ef78ae103ea
X-Git-Newrev: 53cf107505f5f831e4ebc1b70af172520af0ebfc
X-Patchwork-Hint: ignore
Message-Id: <20220605204538.818BA86BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcnano-binaries: bump
 version to 969d115185
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

commit: https://git.buildroot.net/buildroot/commit/?id=53cf107505f5f831e4ebc1b70af172520af0ebfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to last version of gcnano-binaries compatible with kernel
from StMicroelectronics version 5.10

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.hash | 4 ++--
 package/gcnano-binaries/gcnano-binaries.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index e3efc82fc5..d4ad96672a 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 afec2ba2f524821452d561b56afd2fc241293ea4a6e8598d1663f58e5d16800f  gcnano-binaries-1534c3eaabb5ae545a8f97e95f853531365a13fc.tar.gz
-sha256 7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
+sha256  32d91d6ce6e6551cb7ad0eee4698041fdeb10a4f216e6564adb06408476edc38  gcnano-binaries-969d11518529bb70a132909b02ddcc5736c92d91.tar.gz
+sha256  7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index f6adc36dbd..affe0a6063 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -8,8 +8,8 @@ GCNANO_BINARIES_LIB_VERSION = 6.4
 GCNANO_BINARIES_LIB_REVISION = 3
 GCNANO_BINARIES_LIB_FULL_VERSION = $(GCNANO_BINARIES_LIB_VERSION).$(GCNANO_BINARIES_LIB_REVISION)
 GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)-20200902
-GCNANO_BINARIES_VERSION = 1534c3eaabb5ae545a8f97e95f853531365a13fc
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)-20210726
+GCNANO_BINARIES_VERSION = 969d11518529bb70a132909b02ddcc5736c92d91
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
 
 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
