Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5EDC4167B
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 10:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F07481417;
	Wed,  1 Nov 2023 10:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F07481417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6GRmgJlr1iZ; Wed,  1 Nov 2023 10:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF8381AD7;
	Wed,  1 Nov 2023 10:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF8381AD7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95D921BF296
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 502A04ECE0
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 502A04ECE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xuSE4HFlqLPz for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 10:36:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B023941499
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 10:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B023941499
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CF9C862E9; Wed,  1 Nov 2023 10:36:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 11:34:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d03195c90e5590c107bc1dd6be6fdc94d5d6cd25
X-Git-Newrev: 8a8fa2006846cd3480741f03372e17fedb811898
X-Patchwork-Hint: ignore
Message-Id: <20231101103600.9CF9C862E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: bump to version 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a8fa2006846cd3480741f03372e17fedb811898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps OP-TEE client package version to OP-TEE release 4.0.0.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-client/optee-client.hash | 4 ++--
 package/optee-client/optee-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 69016eae11..bb97820ab1 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.21.0/optee-client-3.21.0.tar.gz
-sha256  368164a539b85557d2079fa6cd839ec444869109f96de65d6569e58b0615d026  optee-client-3.21.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/4.0.0/optee-client-4.0.0.tar.gz
+sha256  bcdac9c3a9f2e93c64d114667cc6d1feddf9f978992cdc2d59745885f9bd8fbe  optee-client-4.0.0.tar.gz
 # Locally computed
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 4b95842efa..99c922a171 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.21.0
+OPTEE_CLIENT_VERSION = 4.0.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
