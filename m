Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50478EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4BC660ABD;
	Sat,  1 Jul 2023 20:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4BC660ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-JxasKiXS0h; Sat,  1 Jul 2023 20:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C4660AF8;
	Sat,  1 Jul 2023 20:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C4660AF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE341BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0314041748
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0314041748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdZOrbEG35ax for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:07:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B04C041744
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B04C041744
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C2B786281; Sat,  1 Jul 2023 20:07:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 22:01:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61f5ecc56e2cbd129dcfb1f94fef8e57180a5d45
X-Git-Newrev: 391900aae0f1783a2f2305b18356ae3323a8124c
X-Patchwork-Hint: ignore
Message-Id: <20230701200722.9C2B786281@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crucible: bump to version
 2023.04.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=391900aae0f1783a2f2305b18356ae3323a8124c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2023.04.12.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index d0a2a63fab..256513da6b 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
-sha256  1229c7d1587a97e9f3d456392e06c7be288bacf6ffb68c940d497bf55edab20b  crucible-2022.05.25.tar.gz
+sha256  bfeaa9b1c8bb95f02d33bd915892e748eb8939fd8b901e1d31d2efa7f7aefcb3  crucible-2023.04.12.tar.gz
 sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index fdad709dde..dad89b2149 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUCIBLE_VERSION = 2022.05.25
+CRUCIBLE_VERSION = 2023.04.12
 CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
 CRUCIBLE_LICENSE = GPL-3.0
 CRUCIBLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
