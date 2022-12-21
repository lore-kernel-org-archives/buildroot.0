Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D1EC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 14:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 949A1404ED;
	Wed, 21 Dec 2022 14:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 949A1404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SlmxcfXKEfIr; Wed, 21 Dec 2022 14:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E29FE40B85;
	Wed, 21 Dec 2022 14:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E29FE40B85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4BD81BF5D7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD4D040393
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD4D040393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o37wfnNYmoHE for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 14:16:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C655D40150
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 14:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C655D40150
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B267F86BBF; Wed, 21 Dec 2022 14:16:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 15:15:31 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9b0eb58758ac284669d9f55c15a18a2168bf5b79
X-Git-Newrev: c1ab42087c9f9f6225db4ef613b8496f638a9a14
X-Patchwork-Hint: ignore
Message-Id: <20221221141604.B267F86BBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/containerd:
 security bump to version 1.5.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1ab42087c9f9f6225db4ef613b8496f638a9a14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

CVE-2022-23471: https://github.com/advisories/GHSA-2qjp-425j-52j9

and other bugfixes, see:

https://github.com/containerd/containerd/releases/tag/v1.5.16

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 39d040016c..ced95f2aff 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ac75e2a5552163c203f836f5e9feac349f78f7956e8da228c372a12554b1ee40  containerd-1.5.13.tar.gz
+sha256  d14c703ea6d60a45ef2db8f2275ddae6a3538305117c7813fa24dcf12f4b7d85  containerd-1.5.16.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 5f91d089b8..aa5e89df03 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.5.13
+CONTAINERD_VERSION = 1.5.16
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
