Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B91DC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:52:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7BA60E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB7BA60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0B3D414B9;
	Sat, 24 Jul 2021 07:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5cMWA13R8Yx; Sat, 24 Jul 2021 07:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 864684148C;
	Sat, 24 Jul 2021 07:52:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9054E1BF958
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F64483AA3
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTIRJ49Cw4ik for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF83A83A98
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:51:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9828B85C90; Sat, 24 Jul 2021 07:17:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:50:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fdc88d5a6bab95082f84f2e346b61a1f6975562
X-Git-Newrev: e31ea78a356eb7685b50c5eb00d73e8ae0f3799f
X-Patchwork-Hint: ignore
Message-Id: <20210724071725.9828B85C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-data-optlist: bump to version
 0.112
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

commit: https://git.buildroot.net/buildroot/commit/?id=e31ea78a356eb7685b50c5eb00d73e8ae0f3799f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE was reformated.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-data-optlist/perl-data-optlist.hash | 6 +++---
 package/perl-data-optlist/perl-data-optlist.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-data-optlist/perl-data-optlist.hash b/package/perl-data-optlist/perl-data-optlist.hash
index 93df006486..1c805acef7 100644
--- a/package/perl-data-optlist/perl-data-optlist.hash
+++ b/package/perl-data-optlist/perl-data-optlist.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    f9236c9ea5607134ad8a2b3dc901c4c5 Data-OptList-0.110.tar.gz
-sha256 366117cb2966473f2559f2f4575ff6ae69e84c69a0f30a0773e1b51a457ef5c3 Data-OptList-0.110.tar.gz
+md5  3b2cdb7846391f9acaf4e948a9a6b21b  Data-OptList-0.112.tar.gz
+sha256  62c60ccaae88d5339ae36bcc8940b03388cf84adbf27828b1f8b300307103bab  Data-OptList-0.112.tar.gz
 
 # computed by scancpan
-sha256 73c7bd4c8e4adc474f9dae32b9aa08f6ce27327940751dd6e8373404beabdffa LICENSE
+sha256  712f3e40537810ba3046533fd71d877f69ab446d5e8e8a1135771804494b8b42  LICENSE
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
index 49aeb820e2..8e089245f6 100644
--- a/package/perl-data-optlist/perl-data-optlist.mk
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATA_OPTLIST_VERSION = 0.110
+PERL_DATA_OPTLIST_VERSION = 0.112
 PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
 PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
