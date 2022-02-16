Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22F4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97CFA61C56;
	Wed, 16 Feb 2022 20:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYrtuCXQ8ynn; Wed, 16 Feb 2022 20:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D2C61C53;
	Wed, 16 Feb 2022 20:49:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70D631BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD7E60B6A
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrEtcIvYIxES for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF2A660BEA
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:48:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1E803835E8; Wed, 16 Feb 2022 20:40:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 21:42:14 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 0139ab83d612b125a4eeeb68b08a9e32e1865837
X-Git-Newrev: 0d32c53ee75c2f53f4e50522bf229d1a399a4090
X-Patchwork-Hint: ignore
Message-Id: <20220216204044.1E803835E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/php: bump version
 to 8.0.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d32c53ee75c2f53f4e50522bf229d1a399a4090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Changelog: https://www.php.net/ChangeLog-8.php#8.0.15

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b784733f9cfd661f013dde1b0aa5347e825a4187)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 329410b54f..e78385cbe7 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  fbde8247ac200e4de73449d9fefc8b495d323b5be9c10cdb645fb431c91156e3  php-8.0.14.tar.xz
+sha256  5f33544061d37d805a2a9ce791f081ef08a7155bd7ba2362e69bba2d06b0f8b2  php-8.0.15.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ca59334104..c9de8c2c76 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.14
+PHP_VERSION = 8.0.15
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
