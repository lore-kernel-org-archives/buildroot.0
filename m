Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0954CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 19:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE18415DD;
	Wed, 22 Dec 2021 19:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JxkFD0MG2JgD; Wed, 22 Dec 2021 19:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3F4415EF;
	Wed, 22 Dec 2021 19:25:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 649AC1BF57C
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 19:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52F6C82C7D
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 19:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUOmIr4uGA14 for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 19:25:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 725348196A
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 19:25:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 23AD182926; Wed, 22 Dec 2021 19:19:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 20:12:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84b29ef40baf408b8b22085b336967aca83212db
X-Git-Newrev: a5cb0ff4c90a9fcb068d41262946ef6a9aef9f7d
X-Patchwork-Hint: ignore
Message-Id: <20211222191947.23AD182926@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zstd: bump to version 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5cb0ff4c90a9fcb068d41262946ef6a9aef9f7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zstd/zstd.hash | 4 ++--
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 2d7bf37b2a..d7d8a448ff 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz.sha256
-sha256  5194fbfa781fcf45b98c5e849651aa7b3b0a008c6b72d4a0db760f3002291e94  zstd-1.5.0.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.5.1/zstd-1.5.1.tar.gz.sha256
+sha256  e28b2f2ed5710ea0d3a1ecac3f6a947a016b972b9dd30242369010e5f53d7002  zstd-1.5.1.tar.gz
 
 # License files (locally computed)
 sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e970d87cbf..476190e9ae 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.5.0
+ZSTD_VERSION = 1.5.1
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
