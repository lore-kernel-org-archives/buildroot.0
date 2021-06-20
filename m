Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42CAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:10:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F0660F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85F0660F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 578C6405A6;
	Tue,  3 Aug 2021 23:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqiS-cVIX3y3; Tue,  3 Aug 2021 23:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4947B4060E;
	Tue,  3 Aug 2021 23:10:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB1811BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56ED940672
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SnxKg72qqAf for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1DA44062A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 060D3876CF; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 14:36:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: de41a7040c6eb6e795269ed183d9aaa565745ef2
X-Git-Newrev: 05eb8e396f59c455f48fc80b12bf49c05a49e85b
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.060D3876CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fuse-overlayfs: bump
 to version 1.5.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=05eb8e396f59c455f48fc80b12bf49c05a49e85b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
 package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index 9770ee0d3f..f9473c154a 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7e5666aef4f2047e6a5202d6438b08c2d314dba5b40e431014e7dbb8168d9018  fuse-overlayfs-1.4.0.tar.gz
+sha256  6c81b65b71067b303aaa9871f512c2cabc23e2b793f19c6c854d01a492b5a923  fuse-overlayfs-1.5.0.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 707cacce03..0ad7dbc51d 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.4.0
+FUSE_OVERLAYFS_VERSION = 1.5.0
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
 FUSE_OVERLAYFS_LICENSE = GPL-3.0
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
