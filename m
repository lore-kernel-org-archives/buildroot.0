Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D88C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED23460A91;
	Sun, 11 Dec 2022 10:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED23460A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2_QnWBSWG2x; Sun, 11 Dec 2022 10:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DADD607F6;
	Sun, 11 Dec 2022 10:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DADD607F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93B0D1BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FE8D605D8
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FE8D605D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G62ex4KdU8AU for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:41:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB915605A1
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB915605A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B94886030; Sun, 11 Dec 2022 10:41:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:39:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 271ad374ced4bfe325bf0d8ba21adb92793d2ae7
X-Git-Newrev: 717cf468c4be8669785027f298f077f903214fc7
X-Patchwork-Hint: ignore
Message-Id: <20221211104101.9B94886030@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nerdctl: bump to version 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=717cf468c4be8669785027f298f077f903214fc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nerdctl has reached version 1.0.0.

https://github.com/containerd/nerdctl/releases/tag/v1.0.0

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nerdctl/nerdctl.hash | 2 +-
 package/nerdctl/nerdctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
index 22cc97c362..e253fb74b2 100644
--- a/package/nerdctl/nerdctl.hash
+++ b/package/nerdctl/nerdctl.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  be41804ef139a3f92b774edc8439678e56b44033d7ab3fcf4389f0865c1fe069  nerdctl-0.17.1.tar.gz
+sha256  ae468c65480e9c6679e0dd23d466b723e7f19bff779d4e2e0fa4629be343af2a  nerdctl-1.0.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
index 3f3c04aa11..fdf60cb189 100644
--- a/package/nerdctl/nerdctl.mk
+++ b/package/nerdctl/nerdctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NERDCTL_VERSION = 0.17.1
+NERDCTL_VERSION = 1.0.0
 NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
 
 NERDCTL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
