Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28601C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:24:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B5B60EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3B5B60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC5A415ED;
	Wed,  4 Aug 2021 00:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFGsDLlaRvPF; Wed,  4 Aug 2021 00:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA1440660;
	Wed,  4 Aug 2021 00:24:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABA1A1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB718414B7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBzuigzObXqQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C557B40EC6
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 25CAB81484; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:50:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 81fa54fe740a4114ebff01347c6c487ddf75f217
X-Git-Newrev: 26c647f031e1dc7fd3a59c6905d0dc98f6506c73
X-Patchwork-Hint: ignore
Message-Id: <20210803211015.25CAB81484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/perl-mojolicious-plugin-authorization: bump to version 1.06
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

commit: https://git.buildroot.net/buildroot/commit/?id=26c647f031e1dc7fd3a59c6905d0dc98f6506c73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

LICENSE was reformated, the copyright holder is unchanged:
This software is copyright (c) 2012 by John Scoles.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../perl-mojolicious-plugin-authorization.hash                      | 6 +++---
 .../perl-mojolicious-plugin-authorization.mk                        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash
index c55eefe2ff..30bf87bad0 100644
--- a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash
+++ b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9c009599cf397e3eacf5d7cd0dec45b8 Mojolicious-Plugin-Authorization-1.05.tar.gz
-sha256 87f84092d5698595ad0d01e745eca1d6affd1f3d662786f39f3583c54ffed0e3 Mojolicious-Plugin-Authorization-1.05.tar.gz
+md5  7906886e2a66b84bb3c0edd7ea85c485  Mojolicious-Plugin-Authorization-1.06.tar.gz
+sha256  d21ee5ab5fd8c630bc28ce001f9c91bba500370baf7cc8f6f60c9a4e051f9a6c  Mojolicious-Plugin-Authorization-1.06.tar.gz
 
 # computed by scancpan
-sha256 fd9632faca5a3d6af4cb9cf776514de87d2b34bff3a6cf06c23eea0f9cc3ab06 LICENSE
+sha256  dfab85cd06e80a3493217a1dc741cf9065417d2e803d50756f013c0b6cb0cb3e  LICENSE
diff --git a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
index 3fcee08a46..f136be3ba9 100644
--- a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
+++ b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION = 1.05
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION = 1.06
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_SOURCE = Mojolicious-Plugin-Authorization-$(PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BY/BYTEROCK
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_DEPENDENCIES = host-perl-module-build
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
