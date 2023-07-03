Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250E8C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C760460A7E;
	Mon,  3 Jul 2023 18:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C760460A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDxaev5IFqR2; Mon,  3 Jul 2023 18:46:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0088D60EB3;
	Mon,  3 Jul 2023 18:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0088D60EB3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FF191BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 454CE60A9B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454CE60A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tgK5okUoBHF for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:45:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36F5560A9D
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36F5560A9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25C4E86442; Mon,  3 Jul 2023 18:45:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 20:44:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d9c384ac180f04fa546a268d99cd74f88972083
X-Git-Newrev: 0e258b6190a5b335fececc4fbdc7ed448b37a9a0
X-Patchwork-Hint: ignore
Message-Id: <20230703184521.25C4E86442@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnatpmp: bump version to 20230423
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e258b6190a5b335fececc4fbdc7ed448b37a9a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to reformat of license file:
https://github.com/miniupnp/libnatpmp/commit/d89c1db679c09dbe71ba58b012e4afae2de06376

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnatpmp/libnatpmp.hash | 4 ++--
 package/libnatpmp/libnatpmp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnatpmp/libnatpmp.hash b/package/libnatpmp/libnatpmp.hash
index 38bc3f4444..7bdd784bf7 100644
--- a/package/libnatpmp/libnatpmp.hash
+++ b/package/libnatpmp/libnatpmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1aa9c4c4219bc06943d6b2130f664daee213fb262fcb94dd355815b8f4536b0  libnatpmp-20150609.tar.gz
-sha256  e8d8277e1a101fcfedb0cd5a1cc76646522c0da69f3490dd5a4055fc87ea96a2  LICENSE
+sha256  0684ed2c8406437e7519a1bd20ea83780db871b3a3a5d752311ba3e889dbfc70  libnatpmp-20230423.tar.gz
+sha256  7184f1e2114b518440962e7de67f0b9d5faa3789ba1f1a7ff33159bd26834b06  LICENSE
diff --git a/package/libnatpmp/libnatpmp.mk b/package/libnatpmp/libnatpmp.mk
index 3623027713..3a625ea0fe 100644
--- a/package/libnatpmp/libnatpmp.mk
+++ b/package/libnatpmp/libnatpmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNATPMP_VERSION = 20150609
+LIBNATPMP_VERSION = 20230423
 LIBNATPMP_SITE = http://miniupnp.free.fr/files
 LIBNATPMP_INSTALL_STAGING = YES
 LIBNATPMP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
