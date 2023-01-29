Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E494AC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C8AA83E09;
	Mon, 20 Feb 2023 23:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C8AA83E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1z4eusLrQxEL; Mon, 20 Feb 2023 23:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D373183EE1;
	Mon, 20 Feb 2023 23:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D373183EE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9741BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF4DB4176D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF4DB4176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhrtOId4RJKH for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DE8B41774
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DE8B41774
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1964586495; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 16:32:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a97ab5d2faf4c0498e1c7b4eb68f98fc2eb78060
X-Git-Newrev: b535fd2a093eca5e8967a5c8004da55f7295d101
X-Patchwork-Hint: ignore
Message-Id: <20230220205243.1964586495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/multipath-tools: bump
 to version 0.9.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b535fd2a093eca5e8967a5c8004da55f7295d101
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/multipath-tools/multipath-tools.hash | 2 +-
 package/multipath-tools/multipath-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 6f893d37ce..3f01408c76 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7d5af5d86e43b757e253d1ba244aa8a9c09bfbb1677a72accb799b1bfcc0a9ac  multipath-tools-0.9.3.tar.gz
+sha256  6ed3cf6e786da20a451d9747cbd4c5817815388b8fc8022d1074b3018479031d  multipath-tools-0.9.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index d6abf68ca0..90394fae9f 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.9.3
+MULTIPATH_TOOLS_VERSION = 0.9.4
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
