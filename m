Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87C1CA100F
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 20:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E592605AF;
	Mon, 22 Sep 2025 20:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kV9xn6HGZNPm; Mon, 22 Sep 2025 20:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC3B2605BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC3B2605BE;
	Mon, 22 Sep 2025 20:17:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 532BE498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50A5340050
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6g0LHs5aQQH2 for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 20:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A12724002D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A12724002D
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:17:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90458861EC; Mon, 22 Sep 2025 20:17:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 22:10:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8845586fc6b33937d996e3300bdbfa558d053af2
X-Git-Newrev: b9071ded32b9a46546d870a3cfe3ce8403a1b24b
X-Patchwork-Hint: ignore
Message-Id: <20250922201709.90458861EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bats-assert: update to 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9071ded32b9a46546d870a3cfe3ce8403a1b24b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/bats-core/bats-assert/releases/tag/v2.2.0

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bats-assert/bats-assert.hash | 2 +-
 package/bats-assert/bats-assert.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-assert/bats-assert.hash b/package/bats-assert/bats-assert.hash
index 94c3908ab3..449bd14a26 100644
--- a/package/bats-assert/bats-assert.hash
+++ b/package/bats-assert/bats-assert.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  98ca3b685f8b8993e48ec057565e6e2abcc541034ed5b0e81f191505682037fd  bats-assert-2.1.0.tar.gz
+sha256  7ea3b60f495a3c4fbaeb933f81050749917d7dcff00ffdd821779ed211b87cc2  bats-assert-2.2.0.tar.gz
 
 # License files
 sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
diff --git a/package/bats-assert/bats-assert.mk b/package/bats-assert/bats-assert.mk
index c0e37e0048..dd48f2d59b 100644
--- a/package/bats-assert/bats-assert.mk
+++ b/package/bats-assert/bats-assert.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_ASSERT_VERSION = 2.1.0
+BATS_ASSERT_VERSION = 2.2.0
 BATS_ASSERT_SITE = $(call github,bats-core,bats-assert,v$(BATS_ASSERT_VERSION))
 BATS_ASSERT_LICENSE = CC0-1.0
 BATS_ASSERT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
