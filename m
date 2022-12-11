Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197C5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2FB0813AC;
	Sun, 11 Dec 2022 13:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2FB0813AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubGFAcUe44tp; Sun, 11 Dec 2022 13:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 056868136D;
	Sun, 11 Dec 2022 13:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 056868136D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D24911BF5F5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B862F8136D
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B862F8136D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLl1jiAb-cts for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:31:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E069081354
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E069081354
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB93986326; Sun, 11 Dec 2022 13:31:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:22:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d94e7a6214c3bbf9add65e7ab29b530d2d57b70
X-Git-Newrev: ef13132fd390cc25643e78afc692640c86d7aaf2
X-Patchwork-Hint: ignore
Message-Id: <20221211133121.CB93986326@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dehydrated: bump to version 0.7.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef13132fd390cc25643e78afc692640c86d7aaf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE (update in year:
https://github.com/dehydrated-io/dehydrated/commit/dd0bbd2405ecea4820ad2442120d8dc4a37137b6)

https://github.com/dehydrated-io/dehydrated/releases/tag/v0.7.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dehydrated/dehydrated.hash | 6 +++---
 package/dehydrated/dehydrated.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dehydrated/dehydrated.hash b/package/dehydrated/dehydrated.hash
index 0452645256..711e5a6cea 100644
--- a/package/dehydrated/dehydrated.hash
+++ b/package/dehydrated/dehydrated.hash
@@ -1,6 +1,6 @@
 # Locally computed after verifying
-# https://github.com/dehydrated-io/dehydrated/releases/download/v0.7.0/dehydrated-0.7.0.tar.gz.asc
+# https://github.com/dehydrated-io/dehydrated/releases/download/v0.7.1/dehydrated-0.7.1.tar.gz.asc
 # with key 3C2F2605E078A1E18F4793909C4DBE6CF438F333 from https://keybase.io/lukas2511
-sha256  1c5f12c2e57e64b1762803f82f0f7e767a72e65a6ce68e4d1ec197e61b9dc4f9  dehydrated-0.7.0.tar.gz
+sha256  4d28a0598230b276b316070ce16be7d9ab984f3bdef482acf0bc24fcdcc0d0b0  dehydrated-0.7.1.tar.gz
 # License, locally computed
-sha256  b4583b7dd07e3e2a08906de38e7e329d41f921ed9dcb6310b3886e013a6b8723  LICENSE
+sha256  f25ab9c5f13abf15ab097180423ef6b82a89c552e92d49ae627762ee9c04a3a8  LICENSE
diff --git a/package/dehydrated/dehydrated.mk b/package/dehydrated/dehydrated.mk
index 28fb5a4912..f8909d8abe 100644
--- a/package/dehydrated/dehydrated.mk
+++ b/package/dehydrated/dehydrated.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEHYDRATED_VERSION = 0.7.0
+DEHYDRATED_VERSION = 0.7.1
 DEHYDRATED_SITE = https://github.com/dehydrated-io/dehydrated/releases/download/v$(DEHYDRATED_VERSION)
 
 DEHYDRATED_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
