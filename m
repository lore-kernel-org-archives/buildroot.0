Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABF4C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DCB2610CC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DCB2610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FF35423C5;
	Wed,  4 Aug 2021 00:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWya_Yh24Y6z; Wed,  4 Aug 2021 00:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84413423C8;
	Wed,  4 Aug 2021 00:03:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53E9E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ACF74046D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwDgwHvoizBs for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2647340665
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6A9ED860D3; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 21:56:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0a62c68e080faba83b2a07803957d6cbcbdf0d80
X-Git-Newrev: d2ab6c4b366417ed5cd72b701e5a538ed1cf8130
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.6A9ED860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/php-yaml: bump version
 to 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2ab6c4b366417ed5cd72b701e5a538ed1cf8130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-yaml/php-yaml.hash | 4 ++--
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index c29c3e66ad..e4f31cdad9 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9786b0386e648f12cc18a038358bd57bee4906e350a2e9ab776d6a5f18fc6680  yaml-2.0.4.tgz
-sha256 68d9700294396c72089bfc7bf38a5b3654a53ae415f3bd37768848c14e86f338  LICENSE
+sha256  e17ad04e752e25fd099bddd2df9d26dfef183c8d00c4179bc9d7a2e1c97d7819  yaml-2.2.1.tgz
+sha256  68d9700294396c72089bfc7bf38a5b3654a53ae415f3bd37768848c14e86f338  LICENSE
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index e23d897978..ba16c9ac62 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 2.0.4
+PHP_YAML_VERSION = 2.2.1
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
