Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5308C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:53:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6913E60E95
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6913E60E95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 361B283B49;
	Sat, 24 Jul 2021 07:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axAJ7Jm8R-lT; Sat, 24 Jul 2021 07:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D49483B30;
	Sat, 24 Jul 2021 07:53:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E272E1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25426070D
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYWwOE7oziHo for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:51:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 218EC606D5
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:51:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E79E485C90; Sat, 24 Jul 2021 07:17:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:50:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7673e0d28ff3ddf3f1b8f2f858fb301740441719
X-Git-Newrev: 81fa54fe740a4114ebff01347c6c487ddf75f217
X-Patchwork-Hint: ignore
Message-Id: <20210724071725.E79E485C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/perl-mojolicious-plugin-authentication: bump to version 1.37
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

commit: https://git.buildroot.net/buildroot/commit/?id=81fa54fe740a4114ebff01347c6c487ddf75f217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mojolicious-plugin-authentication/Config.in              | 2 +-
 .../perl-mojolicious-plugin-authentication.hash                       | 4 ++--
 .../perl-mojolicious-plugin-authentication.mk                         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious-plugin-authentication/Config.in b/package/perl-mojolicious-plugin-authentication/Config.in
index 4fa01806fd..2f51989f2f 100644
--- a/package/perl-mojolicious-plugin-authentication/Config.in
+++ b/package/perl-mojolicious-plugin-authentication/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION
 	help
 	  A plugin to make authentication a bit easier.
 
-	  https://metacpan.org/release/Mojolicious-Plugin-Authentication
+	  https://github.com/benvanstaveren/Mojolicious-Plugin-Authentication
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
index dc14b7e682..34362f5d8d 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  7eda1fadc272de097aa8d58abb9197ad  Mojolicious-Plugin-Authentication-1.36.tar.gz
-sha256  8bc48363925261b253e3e10eacf60d71d9930de772936b7f3e5221691841f9bb  Mojolicious-Plugin-Authentication-1.36.tar.gz
+md5  c475f2d3962441698b178ad1bd7d2e29  Mojolicious-Plugin-Authentication-1.37.tar.gz
+sha256  a7ed206725b7b395d4fca12e3f1d923da644d913333ff48ea231e064ecb1abb6  Mojolicious-Plugin-Authentication-1.37.tar.gz
 
 # computed by scancpan
 sha256  37d219684a6c5f8754435fb0dd36a779121e416553fd6a75e22a7545039d1021  LICENSE
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
index 63500864d9..57c356eee5 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.36
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.37
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SOURCE = Mojolicious-Plugin-Authentication-$(PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JJ/JJATRIA
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
