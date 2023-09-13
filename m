Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C924CA5501
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 07:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD50D41953;
	Wed, 13 Sep 2023 07:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD50D41953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WF4kIf6AUFHS; Wed, 13 Sep 2023 07:45:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B345841A60;
	Wed, 13 Sep 2023 07:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B345841A60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 141561BF3B9
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DB9040065
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DB9040065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eO3IMBZha57F for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 07:44:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A82594057C
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 07:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A82594057C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 984DF86DB6; Wed, 13 Sep 2023 07:44:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 09:40:16 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: c39c2c7bf252cd4af3d017a58ba9654e630e3a6a
X-Git-Newrev: 4e02baaf5141ec647a257d8d2b923b4a2ccc8915
X-Patchwork-Hint: ignore
Message-Id: <20230913074434.984DF86DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/libks: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e02baaf5141ec647a257d8d2b923b4a2ccc8915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
