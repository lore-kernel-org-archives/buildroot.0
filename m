Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C7AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:05:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F2F560EC0
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F2F560EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36ACB40178;
	Sun,  5 Sep 2021 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g6IcXnSIlllw; Sun,  5 Sep 2021 14:05:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FB234026C;
	Sun,  5 Sep 2021 14:05:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF3FC1BF968
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE89402BF
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lBmmYD4QGIBF for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 14:05:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAA9B40178
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 14:05:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C82BF8860C; Sun,  5 Sep 2021 14:04:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Sep 2021 16:05:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b5d097d840775f23370ada11f6568f8a6a3c3c2
X-Git-Newrev: 7515f62017fb8cc82c432ac126e703ac79847d76
X-Patchwork-Hint: ignore
Message-Id: <20210905140413.C82BF8860C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udisks: bump to version 2.9.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7515f62017fb8cc82c432ac126e703ac79847d76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2.9.3:
This is a small bugfix release focusing on exfat and dosfstools upstream
changes, along with a couple of test fixes.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 303a0aae01..c2d69ae799 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bda6f9d7edc632c57e55862731a8ffeff2413fa4346708a22bf31ed72b0fe058  udisks-2.9.2.tar.bz2
+sha256  6c398f5fc453e687d8633aeda4477d6a82f3d4bf54cd00c8b09b1e9a6fe56c11  udisks-2.9.3.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index aa1a73aff5..e73cfcf1d3 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.9.2
+UDISKS_VERSION = 2.9.3
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
