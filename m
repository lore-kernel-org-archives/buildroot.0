Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB52C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:15:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E82760F93
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E82760F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAC5B82A87;
	Mon, 26 Jul 2021 21:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhmHJYcfYolA; Mon, 26 Jul 2021 21:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ABBF8299D;
	Mon, 26 Jul 2021 21:15:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DFEB1BF995
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE5356086F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYUEK2mPp9yB for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:12:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 159246088D
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5BAAA88EF5; Mon, 26 Jul 2021 20:37:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:11:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eba736309b2fabff695b52b9aaab211e9c463982
X-Git-Newrev: ff8aff52f7444ed4f00c596f5f5ff769957f6f38
X-Patchwork-Hint: ignore
Message-Id: <20210726203750.5BAAA88EF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pngquant: bump version to 2.15.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff8aff52f7444ed4f00c596f5f5ff769957f6f38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/kornelski/pngquant/blob/master/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pngquant/pngquant.hash | 2 +-
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index c73321670c..9fa51c93d2 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,4 +1,4 @@
 # From https://pngquant.org/releases.html
-sha256  4b911a11aa0c35d364b608c917d13002126185c8c314ba4aa706b62fd6a95a7a  pngquant-2.13.1-src.tar.gz
+sha256  718aabbc346b82ed93564d8e757b346988d86de268ee03d2904207cd5d64c829  pngquant-2.15.1-src.tar.gz
 # Locally computed
 sha256  e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 1729ff1927..bc6c6129e4 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.13.1
+PNGQUANT_VERSION = 2.15.1
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
