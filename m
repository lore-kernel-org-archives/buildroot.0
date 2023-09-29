Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54011E728DE
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E62183DA7;
	Fri, 29 Sep 2023 20:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E62183DA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QxAEmQXlPZf7; Fri, 29 Sep 2023 20:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C7783DC6;
	Fri, 29 Sep 2023 20:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C7783DC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7151BF357
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27F3460F26
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27F3460F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFpzc4DQE7Te for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:02:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75B8360BB5
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75B8360BB5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 535E783604; Fri, 29 Sep 2023 20:02:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:01:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3fd120a7906cac51dc9e423c8b0e1cdbd976730
X-Git-Newrev: 4c15f19d78a78aabc26042a3f325345350ef1827
X-Patchwork-Hint: ignore
Message-Id: <20230929200224.535E783604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/onevpl-intel-gpu: bump version to
 23.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c15f19d78a78aabc26042a3f325345350ef1827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
index fab7ca0eae..fa25c507eb 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4f31a10d51fb09c87fa62afb6da51778f0d946de900f3367816864dc0e096b29  onevpl-intel-gpu-23.3.3.tar.gz
+sha256  9de6bfd17259b7434f2bb4fb6d2874decf9b1d4587ec9b90d91188049921e32f  onevpl-intel-gpu-23.3.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index 311ab88b4e..c7c557e9e2 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONEVPL_INTEL_GPU_VERSION = 23.3.3
+ONEVPL_INTEL_GPU_VERSION = 23.3.4
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
