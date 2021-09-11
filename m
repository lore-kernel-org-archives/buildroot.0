Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07494C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:55:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 606E76103D
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 606E76103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C420404FD;
	Sat, 11 Sep 2021 18:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuPOmrSTOnSr; Sat, 11 Sep 2021 18:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A33940520;
	Sat, 11 Sep 2021 18:55:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59B851BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47C6440520
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AklqZavB4M5 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 18:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8806404FD
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 18:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3A0F6890FE; Sat, 11 Sep 2021 18:54:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 20:42:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f53e59b8e2e04534e0b78a064a8ac1c46fb18ec9
X-Git-Newrev: d14bb539644838897de636639c3979ce6a160203
X-Patchwork-Hint: ignore
Message-Id: <20210911185400.3A0F6890FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] pru-software-support: bump to latest
 version 5.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d14bb539644838897de636639c3979ce6a160203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the latest version of the PRU software support [1]. The
license file remains the same.

[1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index cd81488e1b..8345c2724e 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,3 +1,3 @@
 # Locally-calculated hash
-sha256  57e47128dc5437c5a64d4ef94f419d9ea38e894c0c31ab10cad99c0da614b296  pru-software-support-package-v5.7.0.tar.gz
+sha256  e9256533a6901d31cd12b4ca1c1638b795d316a966967783a8d573e75a6f9d77 pru-software-support-package-v5.8.0.tar.gz
 sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 91f41bcb91..7c1b520290 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = 5.7.0
+PRU_SOFTWARE_SUPPORT_VERSION = 5.8.0
 PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
 PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
 PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, Public Domain
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
