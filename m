Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1DAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:45:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 949D861040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 949D861040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC0F605E0;
	Tue,  3 Aug 2021 21:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4fZkEptzPDD; Tue,  3 Aug 2021 21:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B57CB605C9;
	Tue,  3 Aug 2021 21:45:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4563A1BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC79283AA7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7B76efttLUkp for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1499483A9F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5F50087B09; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 21:56:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dcefb778ec04a97d5e34185db52866d467fb317d
X-Git-Newrev: 0a62c68e080faba83b2a07803957d6cbcbdf0d80
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.5F50087B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/php-xdebug: bump
 version to 3.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a62c68e080faba83b2a07803957d6cbcbdf0d80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-xdebug/php-xdebug.hash | 4 ++--
 package/php-xdebug/php-xdebug.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 8b90352ebf..72bfac67ce 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
-sha256 e330c5ccb77890b06dd7bf093567051450b2438b79fed8e7e6c4834278d46092  php-xdebug-2.9.6.tar.gz
+sha256  7e4f28fc65c8b535de43b6d2ec57429476a6de1d53c4d440a9108ae8d28e01f4  php-xdebug-3.0.4.tar.gz
+sha256  ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index ab6ade4cb1..18ebc32592 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 2.9.6
+PHP_XDEBUG_VERSION = 3.0.4
 PHP_XDEBUG_SITE = $(call github,xdebug,xdebug,$(PHP_XDEBUG_VERSION))
 PHP_XDEBUG_INSTALL_STAGING = YES
 PHP_XDEBUG_LICENSE = Xdebug License (PHP-3.0-like)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
