Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25399C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B23154119D;
	Fri, 12 Jul 2024 07:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIfDgVJPPS6e; Fri, 12 Jul 2024 07:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F7F411C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91F7F411C3;
	Fri, 12 Jul 2024 07:03:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD4661BF591
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9ED9411C3
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0h1jonT4jQh for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:03:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 910C54119D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 910C54119D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:03:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 875E08539E; Fri, 12 Jul 2024 07:03:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 09:02:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8efe3df48b2e7d3216162128fe67c58cbf02324
X-Git-Newrev: 99e1b07c4e840ab5b727c48cad107d3e605aad00
X-Patchwork-Hint: ignore
Message-Id: <20240712070346.875E08539E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pciutils: bump version to 3.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=99e1b07c4e840ab5b727c48cad107d3e605aad00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 3.10.0, see:
https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/ChangeLog?h=v3.13.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 2ac28d327b..f6a3f9eef6 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256  238a2e27166730e53a17fe07bfad229e07fa39b618117e5944b6d7eda9fbb0e9  pciutils-3.10.0.tar.xz
+sha256  77f11f78298502634d1af50308f15a5788629f6cf45cba376f5009aea4cb4926  pciutils-3.13.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index a6708ce94b..ea3c21db6a 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.10.0
+PCIUTILS_VERSION = 3.13.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
