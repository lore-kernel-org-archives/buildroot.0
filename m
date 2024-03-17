Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB51EC54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 19:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97CFE60717;
	Sun, 17 Mar 2024 19:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YfDWH-lxozqm; Sun, 17 Mar 2024 19:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F6436078C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F6436078C;
	Sun, 17 Mar 2024 19:45:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9A591BF869
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E49BA40190
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqLOkmtIwm77 for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CD9240109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CD9240109
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08EC982828; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 20:40:04 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 11811dc5007f5407ca37ec6f7b1fb9e1d78b5bc0
X-Git-Newrev: e4b5ead4d21171d2cdb1fc79090b40d492848f6a
X-Patchwork-Hint: ignore
Message-Id: <20240317194549.08EC982828@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/php: bump version
 to 8.2.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4b5ead4d21171d2cdb1fc79090b40d492848f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Changelog: https://www.php.net/ChangeLog-8.php#8.2.16
Release notes: https://www.php.net/releases/8_2_16.php

Updated license hash due to copyright year bump:
https://github.com/php/php-src/commit/2575e6b88c3d3bbd53383fb65057c9b7b029e264

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d8982b02b6e875d39ffb78a3200b266650e3addc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 4 ++--
 package/php/php.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 7c8736e41c..4ce3616de3 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  eca5deac02d77d806838275f8a3024b38b35ac0a5d9853dcc71c6cbe3f1f8765  php-8.2.15.tar.xz
+sha256  28cdc995b7d5421711c7044294885fcde4390c9f67504a994b4cf9bc1b5cc593  php-8.2.16.tar.xz
 
 # License file
-sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
+sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index c69abd5f31..4daf7f633d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.15
+PHP_VERSION = 8.2.16
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
