Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FA2C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:00:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8E9560F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8E9560F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F8C983C88;
	Wed,  4 Aug 2021 14:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SF1kj-l9yc77; Wed,  4 Aug 2021 14:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB59883BE3;
	Wed,  4 Aug 2021 14:00:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE7961BF20B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB4FF60650
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhKQR08j1LQb for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 13:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F71F6061A
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 13:59:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ADF698B52B; Wed,  4 Aug 2021 13:59:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 15:59:11 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1847e17688c8341503c1a59576349fb5625ebb61
X-Git-Newrev: 39666e06269654342ab2d1a11a8b1117e43157d7
X-Patchwork-Hint: ignore
Message-Id: <20210804135939.ADF698B52B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gptfdisk: bump
 version to 1.0.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=39666e06269654342ab2d1a11a8b1117e43157d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes:
https://sourceforge.net/p/gptfdisk/code/ci/master/tree/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e8085cc813a395b319fc723b10f39db0077f7d77)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gptfdisk/gptfdisk.hash | 6 +++---
 package/gptfdisk/gptfdisk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index 7894f2187d..caded358ec 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.7/
-sha1  406ab2596e1911c916dce677ce7e903076d94c6d  gptfdisk-1.0.7.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.8/
+sha1  c8824e779056158fa32887e415f5399a8646c3c5  gptfdisk-1.0.8.tar.gz
 # Locally computed
-sha256  754004b7f85b279287c7ac3c0469b1d7e0eae043a97a2e587b0560ca5f3828c0  gptfdisk-1.0.7.tar.gz
+sha256  95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df  gptfdisk-1.0.8.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index d92a527105..9869975f51 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.7
+GPTFDISK_VERSION = 1.0.8
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
