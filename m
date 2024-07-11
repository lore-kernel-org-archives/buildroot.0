Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C82C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 17:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCBCA410F9;
	Thu, 11 Jul 2024 17:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtPD0-gbS9DD; Thu, 11 Jul 2024 17:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B7741030
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2B7741030;
	Thu, 11 Jul 2024 17:57:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 373FC1BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FC5983FEE
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0ih2HTqAesq for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 17:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F7B83F98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F7B83F98
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 17:57:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55AD084E01; Thu, 11 Jul 2024 17:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 19:36:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5777bfc0f72db4de0315b753b2a064f017b3d652
X-Git-Newrev: b4008cf9a61a953c0b7c13d5bbb7931f251f7295
X-Patchwork-Hint: ignore
Message-Id: <20240711175731.55AD084E01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pahole: bump to version 1.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4008cf9a61a953c0b7c13d5bbb7931f251f7295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.27

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pahole/pahole.hash | 2 +-
 package/pahole/pahole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index 9dc676d9f4..a2d3d044da 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  db31d13c3dad8d9f4e38296bd35c4586e98b9c950e07dabba212985e6d051631  pahole-1.25.tar.gz
+sha256  87223298d4f8f9ada9b3cc5cef1bedd7aeb447cd8295abc466e009a26accff13  pahole-1.27.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index 1a3e156ebb..ffbe4ff925 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = 1.25
+PAHOLE_VERSION = 1.27
 PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
 HOST_PAHOLE_DEPENDENCIES = \
 	host-elfutils \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
