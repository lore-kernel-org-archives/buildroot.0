Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F04C77B75
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 15:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD2C42B89;
	Fri, 12 May 2023 15:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBD2C42B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrLxehTbcYhD; Fri, 12 May 2023 15:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A747E42AA6;
	Fri, 12 May 2023 15:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A747E42AA6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23D221BF2CB
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 15:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09433429A3
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 15:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09433429A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifzkjSstIWqa for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 15:23:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0431442988
 for <buildroot@buildroot.org>; Fri, 12 May 2023 15:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0431442988
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E609C86407; Fri, 12 May 2023 15:23:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 17:19:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c6206b2179eee98795a7a3a01d9432dd06f4e85
X-Git-Newrev: 7b52d2817c935314136170645a90a9e8cb47dd03
X-Patchwork-Hint: ignore
Message-Id: <20230512152353.E609C86407@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: bump version to 8.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b52d2817c935314136170645a90a9e8cb47dd03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.php.net/ChangeLog-8.php#8.2.6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6b1549958f..96e8803cb2 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  800738c359b7f1e67e40c22713d2d90276bc85ba1c21b43d99edd43c254c5f76  php-8.2.5.tar.xz
+sha256  10b796f0ed45574229851212b30a596a76e70ae365322bcaaaf9c00fa7d58cca  php-8.2.6.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 7cebc178fe..981da5b15d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.5
+PHP_VERSION = 8.2.6
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
