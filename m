Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA98C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:51:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E7B60E95
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79E7B60E95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C8A940629;
	Sat, 24 Jul 2021 07:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ezfn8DMet9lk; Sat, 24 Jul 2021 07:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B2F54061F;
	Sat, 24 Jul 2021 07:51:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84F901BF4D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8195940171
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4PrJwNU5jTh for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C04EF400D8
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:51:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 82A0C888E6; Sat, 24 Jul 2021 07:17:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:50:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a87d99af2f88eb2755959163727584f673483748
X-Git-Newrev: 4fdc88d5a6bab95082f84f2e346b61a1f6975562
X-Patchwork-Hint: ignore
Message-Id: <20210724071725.82A0C888E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-data-dump: bump to version
 1.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fdc88d5a6bab95082f84f2e346b61a1f6975562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

README rewritten in README.md, but same copyright holders:
    Copyright 1998-2010 Gisle Aas.
    Copyright 1996-1998 Gurusamy Sarathy.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-data-dump/perl-data-dump.hash | 6 +++---
 package/perl-data-dump/perl-data-dump.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-data-dump/perl-data-dump.hash b/package/perl-data-dump/perl-data-dump.hash
index 87850326de..cc1986e744 100644
--- a/package/perl-data-dump/perl-data-dump.hash
+++ b/package/perl-data-dump/perl-data-dump.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    762c111e525c82ff23d62c90821b26e9 Data-Dump-1.23.tar.gz
-sha256 af53b05ef1387b4cab4427e6789179283e4f0da8cf036e8db516ddb344512b65 Data-Dump-1.23.tar.gz
+md5  9bd7131ef0441e1e0e001bf85e9fae31  Data-Dump-1.25.tar.gz
+sha256  a4aa6e0ddbf39d5ad49bddfe0f89d9da864e3bc00f627125d1bc580472f53fbd  Data-Dump-1.25.tar.gz
 
 # computed by scancpan
-sha256 31d1b6482bcc3db87a38ad02065554f9d3bc13321d4ef8e96042464045e2abcf README
+sha256  8bdd655ceab54bbeb1105a101f0412ec764098abf09b4e92bc430d56befa10cb  README.md
diff --git a/package/perl-data-dump/perl-data-dump.mk b/package/perl-data-dump/perl-data-dump.mk
index 54d3a925fe..e70de2a211 100644
--- a/package/perl-data-dump/perl-data-dump.mk
+++ b/package/perl-data-dump/perl-data-dump.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_DATA_DUMP_VERSION = 1.23
+PERL_DATA_DUMP_VERSION = 1.25
 PERL_DATA_DUMP_SOURCE = Data-Dump-$(PERL_DATA_DUMP_VERSION).tar.gz
-PERL_DATA_DUMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_DATA_DUMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GARU
 PERL_DATA_DUMP_LICENSE = Artistic or GPL-1.0+
-PERL_DATA_DUMP_LICENSE_FILES = README
+PERL_DATA_DUMP_LICENSE_FILES = README.md
 PERL_DATA_DUMP_DISTNAME = Data-Dump
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
