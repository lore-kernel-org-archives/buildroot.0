Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16876C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 13:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5A17842DD;
	Sat, 11 Jun 2022 13:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7EgiS6Iu3iuW; Sat, 11 Jun 2022 13:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4A6C842DB;
	Sat, 11 Jun 2022 13:19:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F04C31BF2A5
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E001D4258E
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSGZh902lehu for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 13:18:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF86042588
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 13:18:57 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout07.t-online.de (Postfix) with SMTP id 8ACDA33A
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 15:18:55 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o010n-0co5wH0; Sat, 11 Jun 2022 15:18:45 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:54090)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o010n-00061G-5c
 for buildroot@buildroot.org; Sat, 11 Jun 2022 15:18:45 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 15:18:44 +0200
Message-Id: <20220611131845.2605483-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220611131845.2605483-1-bernd.kuhls@t-online.de>
References: <20220611131845.2605483-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654953525-014331F7-5A702EDD/0/0 CLEAN NORMAL
X-TOI-MSGID: c796603e-58e3-468a-9ad1-f3e3795af6bc
Subject: [Buildroot] [PATCH 3/4] package/php-yaml: bump version to 2.2.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
http://pecl.php.net/package-changelog.php?package=yaml&release=2.2.2

Needed to bump php to 8.1.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php-yaml/php-yaml.hash | 2 +-
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index e4f31cdad9..b4d14c5a30 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e17ad04e752e25fd099bddd2df9d26dfef183c8d00c4179bc9d7a2e1c97d7819  yaml-2.2.1.tgz
+sha256  119052f0461d57d86f44c252f9c9b2dd743486c701c1a0aba0aebecdd0d8b82a  yaml-2.2.2.tgz
 sha256  68d9700294396c72089bfc7bf38a5b3654a53ae415f3bd37768848c14e86f338  LICENSE
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index ba16c9ac62..39a422e25d 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 2.2.1
+PHP_YAML_VERSION = 2.2.2
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
