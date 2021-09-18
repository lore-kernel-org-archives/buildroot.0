Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F68C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:14:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5F9610A3
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F5F9610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB7F341593;
	Sat, 18 Sep 2021 20:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8g8qs41_H67; Sat, 18 Sep 2021 20:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3332F40825;
	Sat, 18 Sep 2021 20:14:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91BF71BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C58540555
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wod43oyCLfY7 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:13:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D18114045C
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:13:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E524D8B6B6; Sat, 18 Sep 2021 20:11:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 22:09:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f3fa7db2ada1808f89e855251167e9e9497be09
X-Git-Newrev: c6ecda7615675061c96eca2268aa462e0e2c5b4c
X-Patchwork-Hint: ignore
Message-Id: <20210918201128.E524D8B6B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openresolv: bump version to 3.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6ecda7615675061c96eca2268aa462e0e2c5b4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openresolv/openresolv.hash | 2 +-
 package/openresolv/openresolv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openresolv/openresolv.hash b/package/openresolv/openresolv.hash
index f2a101df39..7a5fb0e140 100644
--- a/package/openresolv/openresolv.hash
+++ b/package/openresolv/openresolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d74c669849183ecefdfcec30d25664b1ca24ba1ca8c2ad5de50fcaeef3b4810  openresolv-3.10.0.tar.gz
+sha256  96b573e26d145f208d3758c2cd6fbf824b01005fc4cb7cedbdae29b3a3c8cb02  openresolv-3.12.0.tar.gz
 sha256  384740bf5e19e7628d20f4dcc22925062fdc6020e9a6f074e567d4d797be57a0  LICENSE
diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
index 55ec7fd8f9..3857ab833d 100644
--- a/package/openresolv/openresolv.mk
+++ b/package/openresolv/openresolv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENRESOLV_VERSION = 3.10.0
+OPENRESOLV_VERSION = 3.12.0
 OPENRESOLV_SITE = $(call github,rsmarples,openresolv,openresolv-$(OPENRESOLV_VERSION))
 OPENRESOLV_LICENSE = BSD-2-Clause
 OPENRESOLV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
