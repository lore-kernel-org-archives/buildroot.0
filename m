Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBA3C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 14:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6173416CA;
	Sat,  4 Mar 2023 14:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6173416CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGVYOSVIxmOc; Sat,  4 Mar 2023 14:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39F3416C2;
	Sat,  4 Mar 2023 14:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C39F3416C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFB001BF357
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 14:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9D4081E27
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 14:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D4081E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUUssL4v4FlW for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 14:22:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AEB181E18
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 14:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AEB181E18
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF25C860FD; Sat,  4 Mar 2023 14:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 15:12:57 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 811a67f7f1411ded045232561084c2b59ac76c64
X-Git-Newrev: 4ffddc2fd8920f9076baf6cf015c8a0192fd8ef8
X-Patchwork-Hint: ignore
Message-Id: <20230304142222.EF25C860FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/php: security
 bump to version 8.1.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ffddc2fd8920f9076baf6cf015c8a0192fd8ef8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Changelog: https://www.php.net/ChangeLog-8.php#8.1.16

Fixes CVE-2023-0567, CVE-2023-0568 & CVE-2023-0662.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 23ec84f19f..646892d6ce 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  e16e47a872d58685913ac848ce92ec49f42c1828110c98c65fb6265a08724a1a  php-8.1.14.tar.xz
+sha256  d61f13d96a58b93c39672b58f25e1ee4ce88500f4acb1430cb01a514875c1258  php-8.1.16.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 23dd4ba96f..89a35b7dd6 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.1.14
+PHP_VERSION = 8.1.16
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
