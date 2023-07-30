Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4286C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61EFA60ACF;
	Sun, 30 Jul 2023 10:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61EFA60ACF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id binVwho7IS0t; Sun, 30 Jul 2023 10:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F06E60ACA;
	Sun, 30 Jul 2023 10:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F06E60ACA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46DB91BF8C7
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EC2F60A9B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EC2F60A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlvq1taEfP65 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:11:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 026B560A5D
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 026B560A5D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E470A83878; Sun, 30 Jul 2023 10:11:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:11:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b8aa2a21e0d84e10b261844d9304f93ce49ce8c
X-Git-Newrev: eb99c88a151aa95d1ecdbf93b9cf0ce3f753bca2
X-Patchwork-Hint: ignore
Message-Id: <20230730101157.E470A83878@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbpoll: bump version to 1.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb99c88a151aa95d1ecdbf93b9cf0ce3f753bca2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/epsilonrt/mbpoll/releases/tag/v1.5.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mbpoll/mbpoll.hash | 2 +-
 package/mbpoll/mbpoll.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mbpoll/mbpoll.hash b/package/mbpoll/mbpoll.hash
index d72ebee7b8..ad96d5ef48 100644
--- a/package/mbpoll/mbpoll.hash
+++ b/package/mbpoll/mbpoll.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  046fdac2d88eddb71a1091a87d0a4bb23fee39595a929cde50c546dae0fbcd6d  mbpoll-1.5.tar.gz
+sha256  7d960cd4459b5f7c2412abc51aba93a20b6114fd75d1de412b1e540cfb63bfec  mbpoll-1.5.2.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/mbpoll/mbpoll.mk b/package/mbpoll/mbpoll.mk
index 4289264e0d..e35fbbe5f1 100644
--- a/package/mbpoll/mbpoll.mk
+++ b/package/mbpoll/mbpoll.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBPOLL_VERSION = 1.5
+MBPOLL_VERSION = 1.5.2
 MBPOLL_SITE = $(call github,epsilonrt,mbpoll,v$(MBPOLL_VERSION))
 MBPOLL_DEPENDENCIES = host-pkgconf libmodbus
 MBPOLL_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
