Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ABBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:03:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 255D16108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 255D16108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F20F74046F;
	Mon, 18 Oct 2021 20:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EsU4OjNjVOSs; Mon, 18 Oct 2021 20:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18C0B40164;
	Mon, 18 Oct 2021 20:03:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 213881BF97A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1127040630
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfvFpZFqYpPe for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:03:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6802A4051B
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:03:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1B12187943; Mon, 18 Oct 2021 19:59:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 22:02:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e37e93c7d56da76f722b43a075ccf2b0bb54dba7
X-Git-Newrev: 04bd3edf3472a5abfe456b2fc7fab54f07b1907c
X-Patchwork-Hint: ignore
Message-Id: <20211018195958.1B12187943@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/knock: bump to version 0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=04bd3edf3472a5abfe456b2fc7fab54f07b1907c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/jvinet/knock/blob/v0.8/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/knock/knock.hash | 2 +-
 package/knock/knock.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/knock/knock.hash b/package/knock/knock.hash
index 0b9a0918fc..fb8d9aef78 100644
--- a/package/knock/knock.hash
+++ b/package/knock/knock.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  940a8de61b4b3530560805c3b9310a077c28c99173c2ccb07ff96720b0e93c58  knock-258a27e5a47809f97c2b9f2751a88c2f94aae891.tar.gz
+sha256  7a82c276ca1540faa7f5bb25010f4a59d45323a31c44a30fbe4a6e484dd18b1a  knock-0.8.tar.gz
 sha256  d747e19206e41702e40822dd91d37cbf40edd86f364ea416d667a0e3013f7189  COPYING
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 55f5bfdf36..2cfa738074 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KNOCK_VERSION = 258a27e5a47809f97c2b9f2751a88c2f94aae891
-KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
+KNOCK_VERSION = 0.8
+KNOCK_SITE = $(call github,jvinet,knock,v$(KNOCK_VERSION))
 KNOCK_AUTORECONF = YES
 KNOCK_LICENSE = GPL-2.0+
 KNOCK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
