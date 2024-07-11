Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C11C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 17:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E523141030;
	Thu, 11 Jul 2024 17:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NflwPCd5PLd6; Thu, 11 Jul 2024 17:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52F2841100
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52F2841100;
	Thu, 11 Jul 2024 17:57:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB4791BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C892341030
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DHQRjcz87pE for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 17:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F126840543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F126840543
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 17:57:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6820D84E15; Thu, 11 Jul 2024 17:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 19:36:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4008cf9a61a953c0b7c13d5bbb7931f251f7295
X-Git-Newrev: 77c62cfc75f0fe2779ecb108bbc2b3e41639b042
X-Patchwork-Hint: ignore
Message-Id: <20240711175731.6820D84E15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbb: bump to version 2021.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=77c62cfc75f0fe2779ecb108bbc2b3e41639b042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tbb/tbb.hash | 2 +-
 package/tbb/tbb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
index 4d2cb10da8..14c86068ee 100644
--- a/package/tbb/tbb.hash
+++ b/package/tbb/tbb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  782ce0cab62df9ea125cdea253a50534862b563f1d85d4cda7ad4e77550ac363  tbb-2021.11.0.tar.gz
+sha256  c7bb7aa69c254d91b8f0041a71c5bcc3936acb64408a1719aec0b2b7639dd84f  tbb-2021.12.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index 1b0afbb889..40fcb66d38 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBB_VERSION = 2021.11.0
+TBB_VERSION = 2021.12.0
 TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
 TBB_INSTALL_STAGING = YES
 TBB_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
