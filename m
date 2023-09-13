Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BF5CA5501
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 07:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63EB7418E2;
	Wed, 13 Sep 2023 07:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63EB7418E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0JkJrrE9RRX; Wed, 13 Sep 2023 07:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B95741B31;
	Wed, 13 Sep 2023 07:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B95741B31
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5124B1BF980
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 276726060A
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 276726060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CvGhcrK7VPN for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 07:43:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5713B60743
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 07:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5713B60743
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4583686DA0; Wed, 13 Sep 2023 07:43:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 09:40:46 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5893b73787bacdc755a62490915c5ca2ddf5e89d
X-Git-Newrev: ab25c08fd936d32ba0cd4a584f55c029fdda82de
X-Patchwork-Hint: ignore
Message-Id: <20230913074305.4583686DA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libks: bump
 version to 2.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab25c08fd936d32ba0cd4a584f55c029fdda82de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Updated license hash due to copyright year bump:
https://github.com/signalwire/libks/commit/52a3f2a54663d7bb50a498153975d4dfe1f8fe63

Needed for freeswitch bump to 1.10.10:
https://github.com/signalwire/freeswitch/commit/7c1faeff48aef815b4cc5f22eb9ead52726dbd95

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 171977f4bf63a9a11da8c1b9b24269c6d73dd8c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libks/libks.hash | 4 ++--
 package/libks/libks.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libks/libks.hash b/package/libks/libks.hash
index 998811bc90..f66798699f 100644
--- a/package/libks/libks.hash
+++ b/package/libks/libks.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c677c36a0d8ceca2e53e07d1de66b87045ac2784df458d012557e2432692528b  libks-1.8.3.tar.gz
-sha256  1d1327f37b58a4c9ce520fcf9dd3f348c7c639229ee7aed41c47164a8f7836cd  copyright
+sha256  af94f9fcdb2022b8f09187309ac2d372a5a4cc639af77cd4375f2d5c88b4fd63  libks-2.0.2.tar.gz
+sha256  3aba376a08bf91c95518532e627157f0ee3ab2712d1198463e2b1ac9186dd142  copyright
diff --git a/package/libks/libks.mk b/package/libks/libks.mk
index b17812619d..c8bcb30961 100644
--- a/package/libks/libks.mk
+++ b/package/libks/libks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKS_VERSION = 1.8.3
+LIBKS_VERSION = 2.0.2
 LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
 LIBKS_LICENSE = MIT
 LIBKS_LICENSE_FILES = copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
