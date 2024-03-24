Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6617C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74C44061F;
	Sun, 24 Mar 2024 14:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3N8IhJ1rp6U; Sun, 24 Mar 2024 14:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60EF740674
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60EF740674;
	Sun, 24 Mar 2024 14:59:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 178E01BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5355440425
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mo1KtATim0EM for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A30A840341
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A30A840341
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9370083AEA; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:48:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3646c48c64cd87cbbe9c20f25a6db9e5054628a5
X-Git-Newrev: 00f7bd06d66b05ec694f8a3e90d56e5c4f532e6b
X-Patchwork-Hint: ignore
Message-Id: <20240324145836.9370083AEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neon: bump to version 0.33.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=00f7bd06d66b05ec694f8a3e90d56e5c4f532e6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of README, changes not related to license:
https://github.com/notroj/neon/commit/7d39a09945830c664205dd307723c2ff51ae13e3
https://github.com/notroj/neon/commit/9c3a4cb82db956357f120556efb7d8e706b5d46c

https://github.com/notroj/neon/blob/0.33.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/neon/neon.hash | 4 ++--
 package/neon/neon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index 9bd6195e39..d773b0f316 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  b1e2120e4ae07df952c4a858731619733115c5f438965de4fab41d6bf7e7a508  neon-0.32.4.tar.gz
+sha256  659a5cc9cea05e6e7864094f1e13a77abbbdbab452f04d751a8c16a9447cf4b8  neon-0.33.0.tar.gz
 # Hash for license files
-sha256  ce2421ee38d6c0e02c85ac076478a0f92da6ef92b92b7a174877cabf01b2e531  README.md
+sha256  6c4f5d59a60a66cc970642c0f3799cf03b40a81c9dccbc4a254f20487d143f74  README.md
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 96ee608780..a801eae28f 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.32.4
+NEON_VERSION = 0.33.0
 NEON_SITE = https://notroj.github.io/neon
 NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
