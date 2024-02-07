Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187C2C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6FE880F5D;
	Wed,  7 Feb 2024 09:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXvAPc0QEVLo; Wed,  7 Feb 2024 09:39:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB36680F89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB36680F89;
	Wed,  7 Feb 2024 09:39:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD881BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08CA3613A5
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4k-u9wqFvKU for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53ED561325
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53ED561325
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:39:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C0F687535; Wed,  7 Feb 2024 09:39:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 10:39:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 678cf889ec2551a0a523dbf67cf08d8880cc0aa7
X-Git-Newrev: 0f8035296fe603c2457821c022d5c0f14b46d819
X-Patchwork-Hint: ignore
Message-Id: <20240207093924.4C0F687535@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-bootcount: bump to version
 3.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f8035296fe603c2457821c022d5c0f14b46d819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Support for i.MX 8M chipsets
- README: updated documentation and source comments

Release notes:
https://github.com/VoltServer/uboot-bootcount/releases/tag/v3.0.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-bootcount/uboot-bootcount.hash | 2 +-
 package/uboot-bootcount/uboot-bootcount.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-bootcount/uboot-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
index e1ebc44235..7f46da22eb 100644
--- a/package/uboot-bootcount/uboot-bootcount.hash
+++ b/package/uboot-bootcount/uboot-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  uboot-bootcount-2.0.0.tar.gz
+sha256  b26b9135716afb2ea967edc2327d1d307cdd15a643bd105dc223d062e18f2dda  uboot-bootcount-3.0.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
index 07b52ab89e..48a45b91aa 100644
--- a/package/uboot-bootcount/uboot-bootcount.mk
+++ b/package/uboot-bootcount/uboot-bootcount.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_BOOTCOUNT_VERSION = 2.0.0
+UBOOT_BOOTCOUNT_VERSION = 3.0.0
 UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
 UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
 UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
