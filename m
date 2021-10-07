Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6602C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:13:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B089A61139
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B089A61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88416406CE;
	Thu,  7 Oct 2021 20:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3ZpBcM-eIBZ; Thu,  7 Oct 2021 20:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E44405E9;
	Thu,  7 Oct 2021 20:13:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 331091BF9C2
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C5E0402B1
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F12uA3aTDGx0 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:13:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D160401AD
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:13:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 59EBF934E1; Thu,  7 Oct 2021 20:11:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 22:11:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c74aef4455e132a00e46aa47a1df1b58d289871
X-Git-Newrev: e6b2f96d510082d7b4235c22ab5a0e7365c9b6a3
X-Patchwork-Hint: ignore
Message-Id: <20211007201100.59EBF934E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pngquant: bump version to 2.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6b2f96d510082d7b4235c22ab5a0e7365c9b6a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/kornelski/pngquant/blob/master/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pngquant/pngquant.hash | 2 +-
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index 9fa51c93d2..3a0dcfd457 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,4 +1,4 @@
 # From https://pngquant.org/releases.html
-sha256  718aabbc346b82ed93564d8e757b346988d86de268ee03d2904207cd5d64c829  pngquant-2.15.1-src.tar.gz
+sha256  06c6fdded675753fbdbeacc2b63507fb30f42fae813e48a1684b240bb5b63522  pngquant-2.16.0-src.tar.gz
 # Locally computed
 sha256  e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index bc6c6129e4..72efafe64e 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.15.1
+PNGQUANT_VERSION = 2.16.0
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
