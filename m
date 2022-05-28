Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1097EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 11:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7C0C8490E;
	Sat, 28 May 2022 11:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8nbhFAyISyQ; Sat, 28 May 2022 11:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC94845B4;
	Sat, 28 May 2022 11:07:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5BDE1BF95F
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56EE884790
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0MC5XXaysad for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9684884796
 for <buildroot@buildroot.org>; Sat, 28 May 2022 11:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2CD5F85EB2; Sat, 28 May 2022 10:53:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:38:09 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a914a4dedf3e4ea5c2c25ae78163091b9bae63e7
X-Git-Newrev: 2d0412e9f137d931a70fa4bd74ca83888e4549da
X-Patchwork-Hint: ignore
Message-Id: <20220528105354.2CD5F85EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/php: bump version
 to 8.0.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d0412e9f137d931a70fa4bd74ca83888e4549da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Changelog: https://www.php.net/ChangeLog-8.php#8.0.19

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 15999f3b5c31d4a41318f61b2f63b25efe4a7011)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 76501c0fdd..e0aca101b4 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  db161652cacae4b31c347fbf2e17b80656473cb365f2bb3460c4552f5647e2e7  php-8.0.18.tar.xz
+sha256  ba62219c4b0486cbb2a04f0796749a46b0ee1f5a142ed454212b4e2460cb0fab  php-8.0.19.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index adfbf3cad2..5053f34b85 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.18
+PHP_VERSION = 8.0.19
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
