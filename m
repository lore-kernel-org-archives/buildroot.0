Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CE4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CE2140B7E;
	Tue, 14 Jun 2022 18:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjnSzAHdP18l; Tue, 14 Jun 2022 18:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84D6A40B6A;
	Tue, 14 Jun 2022 18:48:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 978351BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95FEF817FF
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6NRL9q4oKsq for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D178A817B0
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C386F870E4; Tue, 14 Jun 2022 18:36:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:10:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f939cf7c8cb1f08f0fa43aa20c8d98b01f32ac7e
X-Git-Newrev: 434375849c014557e5e500f8025b9ffec0cbe811
X-Patchwork-Hint: ignore
Message-Id: <20220614183634.C386F870E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-yaml: bump version to 2.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=434375849c014557e5e500f8025b9ffec0cbe811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
http://pecl.php.net/package-changelog.php?package=yaml&release=2.2.2

Needed to bump php to 8.1.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
