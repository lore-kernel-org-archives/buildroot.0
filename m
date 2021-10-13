Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6A5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A2AB61056
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A2AB61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FE2B40838;
	Wed, 13 Oct 2021 18:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSGoi5cWQS4I; Wed, 13 Oct 2021 18:28:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92EA240834;
	Wed, 13 Oct 2021 18:28:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 220191BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FEE34083B
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBYjA2O_6ZXz for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5955240834
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B62FB958EA; Wed, 13 Oct 2021 18:24:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:14:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb6b1c99ce4650f728c91371a61835bf8d534644
X-Git-Newrev: c22790448d2558698d0ef38e26d011d767ce9f09
X-Patchwork-Hint: ignore
Message-Id: <20211013182444.B62FB958EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cplus: bump version to 2.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=c22790448d2558698d0ef38e26d011d767ce9f09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://github.com/log4cplus/log4cplus/releases/tag/REL_2_0_7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/log4cplus/log4cplus.hash | 2 +-
 package/log4cplus/log4cplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
index 28e5b204c7..a668eca37a 100644
--- a/package/log4cplus/log4cplus.hash
+++ b/package/log4cplus/log4cplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  73519a5e47c40cf375aa6cd28a703b01908b5dcd3f4cb4290db2fef237c8180c  log4cplus-2.0.6.tar.xz
+sha256  8f74a0a5920ba044b24e2ebeb0f1e5e36d85d5c23ed48d9fe328882b16130db8  log4cplus-2.0.7.tar.xz
 sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 8b62fb8f92..56a85025cb 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CPLUS_VERSION = 2.0.6
+LOG4CPLUS_VERSION = 2.0.7
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
 LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
