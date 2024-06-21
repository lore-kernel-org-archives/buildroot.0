Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D6DC2BB85
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 21:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7899284326;
	Fri, 21 Jun 2024 21:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shDfBhTdJkpb; Fri, 21 Jun 2024 21:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69F848432E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69F848432E;
	Fri, 21 Jun 2024 21:12:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41F3C1BF834
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E19284337
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uX8tEGO9zD8Z for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 21:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70AD184326
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70AD184326
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 21:12:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 589867F9A3; Fri, 21 Jun 2024 21:12:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 23:10:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a
X-Git-Newrev: fa7607026f3fab04836a2e0deb6de9f467a9cd5a
X-Patchwork-Hint: ignore
Message-Id: <20240621211230.589867F9A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rt-tests: bump version to 2.7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3276290254536612051=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3276290254536612051==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fa7607026f3fab04836a2e0deb6de9f467a9cd5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/rt-tests/rt-tests.hash | 2 +-
 package/rt-tests/rt-tests.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index 017447bce6..9682fde406 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,4 +1,4 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
-sha256  761d10c4b7f5b28400f0c301fe0171eaa74f347df64cb359210254b8e6aff19f  rt-tests-2.6.tar.xz
+sha256  0e5b2fbc98ceb786bd113c9a30f0388d884b2d8c4bd6c569d94ae8b00a702bbb  rt-tests-2.7.tar.xz
 # locally computed hash
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 4b1aa31796..419260db3c 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -6,7 +6,7 @@
 
 RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
-RT_TESTS_VERSION = 2.6
+RT_TESTS_VERSION = 2.7
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 

--===============3276290254536612051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3276290254536612051==--
