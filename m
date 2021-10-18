Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72595C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:11:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBFAC6128E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBFAC6128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 790EB82DDE;
	Mon, 18 Oct 2021 19:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0QZrn766GMx; Mon, 18 Oct 2021 19:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FB5A80F2F;
	Mon, 18 Oct 2021 19:10:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63C1E1BF989
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60641606FA
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U52tR0QEwg6H for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:04:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B067C606D3
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:04:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 88BBA873B2; Mon, 18 Oct 2021 19:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:03:27 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: cb9685e49755de3406078e66113b530ac4263563
X-Git-Newrev: 1ea733770d10dff87e68bb564a6cddce13734e1e
X-Patchwork-Hint: ignore
Message-Id: <20211018190118.88BBA873B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/rng-tools: bump
 to version 6.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ea733770d10dff87e68bb564a6cddce13734e1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

https://github.com/nhorman/rng-tools/releases/tag/v6.14
https://github.com/nhorman/rng-tools/releases/tag/v6.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5292d1cf9ad0605cc264fedc75c1b9a169aa183b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rng-tools/rng-tools.hash | 2 +-
 package/rng-tools/rng-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index 0ba2dc8329..6806a99fc6 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6fd5b52a700edec85eb1043970e22e8e2ad06a4b43851f35d33d90e09570e9d3  rng-tools-6.12.tar.gz
+sha256  4dd86f6ae37d917a8489f44070d39d7feddcc622429b95efd7aa85a1f3cfdf81  rng-tools-6.14.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index e7fb998df6..8db97569d4 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.12
+RNG_TOOLS_VERSION = 6.14
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
