Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261FCECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDA6B60AB7;
	Sun, 30 Oct 2022 21:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA6B60AB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUdbfuYNIWPM; Sun, 30 Oct 2022 21:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEDEF60A70;
	Sun, 30 Oct 2022 21:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEDEF60A70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C61D61BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A28E1400DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A28E1400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAZ5Eya2yWu7 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:29:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA34F400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA34F400CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C74558769E; Sun, 30 Oct 2022 21:29:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:28:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dce3617ada3ed2a1eabab2d1dc2ed0b83bdbe536
X-Git-Newrev: 09779d0f6918377e77f108f27695b16c48cfd1a8
X-Patchwork-Hint: ignore
Message-Id: <20221030212911.C74558769E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: bump version to v2.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=09779d0f6918377e77f108f27695b16c48cfd1a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolftpm/wolftpm.hash | 3 +--
 package/wolftpm/wolftpm.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index d24df58eaa..735c731a53 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,4 +1,3 @@
-# Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.4.0.tar.gz
-sha256  31d1a5f5d60af14c4d07e14a9b0667404d4801fed32afd3fc0649749020ad17b  wolftpm-2.4.0.tar.gz
 # Locally calculated
+sha256  78331cc2d98339247857f5ceb3e7cd3c4f5773e3d81bf1d73e8df9446e37472b  wolftpm-2.6.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index 7e8a108585..f217322545 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFTPM_VERSION = 2.4.0
+WOLFTPM_VERSION = 2.6.0
 WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
