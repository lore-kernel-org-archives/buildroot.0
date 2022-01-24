Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66337C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14CC8400FE;
	Mon, 24 Jan 2022 17:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mqb8drjrwBYk; Mon, 24 Jan 2022 17:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF902405F2;
	Mon, 24 Jan 2022 17:37:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7BE1BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED6B660A79
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osbLOrFipFAr for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:36:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5131E6009C
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:36:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AB89182BCC; Mon, 24 Jan 2022 17:29:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:22:26 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 0031fc0f1825de7207a7c0777a4402750b6d3583
X-Git-Newrev: 2b769aaa1fcb8e425b17879a229d633a7d5da1f4
X-Patchwork-Hint: ignore
Message-Id: <20220124172947.AB89182BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/php: bump version
 to 8.0.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b769aaa1fcb8e425b17879a229d633a7d5da1f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Changelog: https://www.php.net/ChangeLog-8.php#8.0.14

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7a351e9fbe0b652a3b7472573916d791ba00fa1b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 254484e72f..329410b54f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  cd976805ec2e9198417651027dfe16854ba2c2c388151ab9d4d268513d52ed52  php-8.0.13.tar.xz
+sha256  fbde8247ac200e4de73449d9fefc8b495d323b5be9c10cdb645fb431c91156e3  php-8.0.14.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 8c45da77a2..ca59334104 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.13
+PHP_VERSION = 8.0.14
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
