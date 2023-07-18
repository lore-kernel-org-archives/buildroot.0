Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242AAEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3918402E4;
	Tue, 18 Jul 2023 21:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3918402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bqsqt9iPEfEH; Tue, 18 Jul 2023 21:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFD4402CD;
	Tue, 18 Jul 2023 21:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAFD4402CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5731BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58D4A81F92
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58D4A81F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u7hIpQU9XJ_E for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:28:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88B3B81F7F
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B3B81F7F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 788EB87470; Tue, 18 Jul 2023 21:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:27:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a7c9332402d019181ef1b6b02a9e5d84c6463c7
X-Git-Newrev: d4fa5c83dbce3454c5a1a6408071bb3c0069858e
X-Patchwork-Hint: ignore
Message-Id: <20230718212817.788EB87470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vulkan-headers: bump version to
 1.3.257
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4fa5c83dbce3454c5a1a6408071bb3c0069858e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vulkan-headers/vulkan-headers.hash | 2 +-
 package/vulkan-headers/vulkan-headers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vulkan-headers/vulkan-headers.hash b/package/vulkan-headers/vulkan-headers.hash
index c43736405c..cf213d8b52 100644
--- a/package/vulkan-headers/vulkan-headers.hash
+++ b/package/vulkan-headers/vulkan-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7239108c372f1fbe365bd8d1610ca2bb4e72b73b2151f2551bf9df54dd539639  vulkan-headers-1.2.203.tar.gz
+sha256  e3ee02eff07ebcdb0ddfd06366d986c889f3392b6c4d79615bb06aefc1fda900  vulkan-headers-1.3.257.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
index 13cae1e685..c42b005abe 100644
--- a/package/vulkan-headers/vulkan-headers.mk
+++ b/package/vulkan-headers/vulkan-headers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VULKAN_HEADERS_VERSION = 1.2.203
+VULKAN_HEADERS_VERSION = 1.3.257
 VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
 VULKAN_HEADERS_LICENSE = Apache-2.0
 VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
