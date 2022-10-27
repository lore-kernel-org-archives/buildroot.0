Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38098FA3742
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 10:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B04B4813BB;
	Thu, 27 Oct 2022 10:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B04B4813BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rib4SPOrd1sK; Thu, 27 Oct 2022 10:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBB1E813B9;
	Thu, 27 Oct 2022 10:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBB1E813B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B11C81BF990
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 10:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AAD8402D7
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 10:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AAD8402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hWDSGYUbVOnn for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 10:49:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC5814013E
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 10:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC5814013E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAAB78732D; Thu, 27 Oct 2022 10:49:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 12:49:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e75c1d888bca57076807c74b48cd01f940832e85
X-Git-Newrev: 559a46ff348c73567d357e23b5458c42b8364603
X-Patchwork-Hint: ignore
Message-Id: <20221027104941.AAAB78732D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ksmbd-tools: bump to version 3.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=559a46ff348c73567d357e23b5458c42b8364603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index 589128c189..b31c66bbe7 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c1b9096f37eddaced055dfc90a9ed06ceb9e8ceb608ed46c51ed5a2c901ddc81  ksmbd-tools-3.4.5.tar.gz
+sha256  09ab343e9bf10ddfdd3216f400b19740a391645bf3645fa6f136b8da36306559  ksmbd-tools-3.4.6.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index e7f2bf91bc..c4f9c503e6 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.5
+KSMBD_TOOLS_VERSION = 3.4.6
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
