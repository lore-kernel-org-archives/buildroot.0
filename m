Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C722CC83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF64844A0;
	Sat, 19 Jul 2025 10:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96Mn5g_NSGgE; Sat, 19 Jul 2025 10:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5373844B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5373844B4;
	Sat, 19 Jul 2025 10:43:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E437943
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BC0D844A0
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9h7c0zeRK3EQ for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:43:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C584844B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C584844B4
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:43:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A9DB8677E; Sat, 19 Jul 2025 10:43:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 12:42:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae5647d8228d740d7f9a8d9d3dd82c878219876d
X-Git-Newrev: 32e71aab7679fc7794a063790ba40ce63541a9eb
X-Patchwork-Hint: ignore
Message-Id: <20250719104320.2A9DB8677E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rdma-core: bump to version v58.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32e71aab7679fc7794a063790ba40ce63541a9eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v56.0, see:
https://github.com/linux-rdma/rdma-core/releases/tag/v57.0
https://github.com/linux-rdma/rdma-core/releases/tag/v58.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rdma-core/rdma-core.hash | 2 +-
 package/rdma-core/rdma-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index 6037a2409a..8ae78046f1 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f09c73f89e0bdcd6b794ebd888021755835eba0c1e1e6b8c66a68d2f8952c468  rdma-core-56.0.tar.gz
+sha256  08a554e0f95bb6869f9fbc2b1eb5521a85104dda9bf730db42b1a10d0b009e28  rdma-core-58.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 5b688df423..938a6398fa 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 56.0
+RDMA_CORE_VERSION = 58.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
