Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89CAC4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47CE3410AE;
	Thu,  1 Dec 2022 21:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47CE3410AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2BBMfc05c1U; Thu,  1 Dec 2022 21:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D1E441085;
	Thu,  1 Dec 2022 21:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D1E441085
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7571BF2C5
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33E844102E
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 21:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33E844102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNg671gYac3h for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 21:11:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A52D40B76
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 21:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A52D40B76
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56EE3847EF; Thu,  1 Dec 2022 21:11:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Dec 2022 22:11:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 18d5d738fd971a431e033c16aef53c43f8fd19fe
X-Git-Newrev: 9943c86392f05ceec8807b6755772b91754b9f99
X-Patchwork-Hint: ignore
Message-Id: <20221201211151.56EE3847EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cryptsetup: bump
 version to 2.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9943c86392f05ceec8807b6755772b91754b9f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash | 4 ++--
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 5f59b30560..149d1e71f1 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.5/sha256sums.asc
-sha256  9184a6ebbd9ce7eb211152e7f741a6c82f2d1cc0e24a84ec9c52939eee0f0542  cryptsetup-2.5.0.tar.xz
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.6/sha256sums.asc
+sha256  44397ba76e75a9cde5b02177bc63cd7af428a785788e3a7067733e7761842735  cryptsetup-2.6.0.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 4a52bb62dd..659fdfa2a4 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 2.5
+CRYPTSETUP_VERSION_MAJOR = 2.6
 CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
