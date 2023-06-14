Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E77FEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3067541B66;
	Wed, 14 Jun 2023 11:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3067541B66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ywk7vQ-4XKaE; Wed, 14 Jun 2023 11:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0634B41D94;
	Wed, 14 Jun 2023 11:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0634B41D94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D09831BF2CA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 310454195F
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 310454195F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFK4Rf12WON0 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F5A141BF0
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F5A141BF0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DB598363F; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 13:44:03 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cc8e88480aae2096271d22c98d23342057b1d527
X-Git-Newrev: 1ffa895fb0d72fd723acb668306f361c3a6058b7
X-Patchwork-Hint: ignore
Message-Id: <20230614115310.0DB598363F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/containerd: bump
 version to v1.6.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ffa895fb0d72fd723acb668306f361c3a6058b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

https://github.com/containerd/containerd/releases/tag/v1.6.21

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bab89b35f018a332c7d42ed6e6cb8d72fdeac4b2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 65a87f25fa..345a7b16ff 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  819086ccdca44cfc5f108e226c7a9294d8fad3eb32031a621623da80dedbfb11  containerd-1.6.20.tar.gz
+sha256  9452e95455d03a00d78ae0587595d0c18555bae7912068269efa25a724efe713  containerd-1.6.21.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index bc1dd58611..83489a3abf 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.20
+CONTAINERD_VERSION = 1.6.21
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
