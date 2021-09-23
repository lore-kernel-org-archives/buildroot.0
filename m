Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC00C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:08:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DAE561029
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DAE561029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E1C40506;
	Thu, 23 Sep 2021 21:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEWpcAcsP7i2; Thu, 23 Sep 2021 21:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB33540353;
	Thu, 23 Sep 2021 21:08:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 633CF1BF9C8
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E985F606B8
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEotWy5xZxwH for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 350DA60AFE
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8BC0C8D210; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 22:56:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63847a4b2e4e3ace65e6a2d6a4c7e62b62b29a29
X-Git-Newrev: c2728b3410c2c3d4cb1ef43e3e395a3104d44007
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.8BC0C8D210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sigrok-cli: bump to version 0.7.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2728b3410c2c3d4cb1ef43e3e395a3104d44007
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sigrok.org/gitweb/?p=sigrok-cli.git;a=blob;f=NEWS;h=e80dad6392501dd16e4fdc87836d443474e2eed9;hb=b584f959edb788f1731d5a304badf241ac21bf65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sigrok-cli/sigrok-cli.hash | 2 +-
 package/sigrok-cli/sigrok-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sigrok-cli/sigrok-cli.hash b/package/sigrok-cli/sigrok-cli.hash
index 3231bf82cf..cdf004fa09 100644
--- a/package/sigrok-cli/sigrok-cli.hash
+++ b/package/sigrok-cli/sigrok-cli.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f52413429f47d457c333db0fd068416ab7a3f9e35ca76de8624dc5ac6fb07797  sigrok-cli-0.7.1.tar.gz
+sha256  71d0443f36897bf565732dec206830dbea0f2789b6601cf10536b286d1140ab8  sigrok-cli-0.7.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 2c960fdf4f..af3c0a032b 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGROK_CLI_VERSION = 0.7.1
+SIGROK_CLI_VERSION = 0.7.2
 SIGROK_CLI_SITE = http://sigrok.org/download/source/sigrok-cli
 SIGROK_CLI_LICENSE = GPL-3.0+
 SIGROK_CLI_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
