Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8594BC636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 22:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DEA981E8B;
	Sat, 11 Feb 2023 22:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DEA981E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QVrv36mmNDhD; Sat, 11 Feb 2023 22:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86EA681E2E;
	Sat, 11 Feb 2023 22:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86EA681E2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3C91BF588
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 22:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64BAD60B9C
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 22:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64BAD60B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7U-pRiIR6wJ for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 22:21:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 816A860608
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 22:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 816A860608
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D4F8854A9; Sat, 11 Feb 2023 22:21:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 23:18:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 451672e890b5f605aa9ad7a386491a31397c737f
X-Git-Newrev: a54bb2a2d99b835f672ae194dc4934757881e08b
X-Patchwork-Hint: ignore
Message-Id: <20230211222114.6D4F8854A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: bump version to 8.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a54bb2a2d99b835f672ae194dc4934757881e08b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://news-web.php.net/php.announce/345

Changelog: https://www.php.net/ChangeLog-8.php#8.2.2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index a9c3b7640b..869cb9b94f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  650d3bd7a056cabf07f6a0f6f1dd8ba45cd369574bbeaa36de7d1ece212c17af  php-8.2.1.tar.xz
+sha256  bdc4aa38e652bac86039601840bae01c0c3653972eaa6f9f93d5f71953a7ee33  php-8.2.2.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 372d55f68a..9ce153f4fa 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.1
+PHP_VERSION = 8.2.2
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
