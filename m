Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7295DC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AD5C4EDC0;
	Mon, 20 Feb 2023 22:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AD5C4EDC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N2jRBJyD-Jfu; Mon, 20 Feb 2023 22:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE584E95A;
	Mon, 20 Feb 2023 22:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE584E95A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 818B31BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9C55611F7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C55611F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7dRpC-xgxCD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06B92611DF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06B92611DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED5498648F; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:22:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2d94e7a6214c3bbf9add65e7ab29b530d2d57b70
X-Git-Newrev: ef13132fd390cc25643e78afc692640c86d7aaf2
X-Patchwork-Hint: ignore
Message-Id: <20230220205205.ED5498648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dehydrated: bump to
 version 0.7.1
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
