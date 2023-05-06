Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1FCC77B75
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E5E6427D5;
	Sat,  6 May 2023 16:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5E6427D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWPRIP7whC1A; Sat,  6 May 2023 16:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238B5427AD;
	Sat,  6 May 2023 16:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238B5427AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06CC11BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 923024177A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 923024177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CSZvDBOnI4C for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:09:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F0C7418CA
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F0C7418CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CF1185EC5; Sat,  6 May 2023 16:09:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 18:02:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b18a93cd5cdb56dd2a0e85ea9d04e16f1513fa4
X-Git-Newrev: 5d65570fac4d577bd3661ad892df80bc9601f4ae
X-Patchwork-Hint: ignore
Message-Id: <20230506160924.7CF1185EC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nerdctl: bump version to 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d65570fac4d577bd3661ad892df80bc9601f4ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfixes and features.

https://github.com/containerd/nerdctl/releases/tag/v1.3.1

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nerdctl/nerdctl.hash | 2 +-
 package/nerdctl/nerdctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
index 8f2c678198..1fb0649fb2 100644
--- a/package/nerdctl/nerdctl.hash
+++ b/package/nerdctl/nerdctl.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  08a84b9481b37dbd8cc6f955dbec0c18a1934bcffeb135fd5d2dc23987152b7c  nerdctl-1.2.0.tar.gz
+sha256  574438dd7c88e6a607c6f82932f8ada174b1133a66ee0fa0f7510e7c3bebacb4  nerdctl-1.3.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
index 7556bcc391..43e862f7f9 100644
--- a/package/nerdctl/nerdctl.mk
+++ b/package/nerdctl/nerdctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NERDCTL_VERSION = 1.2.0
+NERDCTL_VERSION = 1.3.1
 NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
 
 NERDCTL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
