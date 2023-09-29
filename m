Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E88CE7AF3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A37D180FAA;
	Fri, 29 Sep 2023 20:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A37D180FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edJc6EJh8IGR; Fri, 29 Sep 2023 20:29:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CE6F80EB2;
	Fri, 29 Sep 2023 20:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE6F80EB2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 581161BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B68360A91
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B68360A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DVFuksnzk-2 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A0660E96
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48A0660E96
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4392383707; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:26:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd3288ed00be73f6cbc47b50fd2963889cfbbd7c
X-Git-Newrev: c2e739991c529a3c11d0da4d8af01b0c03ad6a01
X-Patchwork-Hint: ignore
Message-Id: <20230929202828.4392383707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-sub-quote: bump to version
 2.006008
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2e739991c529a3c11d0da4d8af01b0c03ad6a01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/HAARG/Sub-Quote-2.006008/diff/HAARG/Sub-Quote-2.006006#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-sub-quote/perl-sub-quote.hash | 8 ++++----
 package/perl-sub-quote/perl-sub-quote.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-sub-quote/perl-sub-quote.hash b/package/perl-sub-quote/perl-sub-quote.hash
index 602ff92cec..8db560fd44 100644
--- a/package/perl-sub-quote/perl-sub-quote.hash
+++ b/package/perl-sub-quote/perl-sub-quote.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  1bb9caee697bcfa738f419d40505e506  Sub-Quote-2.006006.tar.gz
-sha256  6e4e2af42388fa6d2609e0e82417de7cc6be47223f576592c656c73c7524d89d  Sub-Quote-2.006006.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  f19c60039ba87f69f7f9357fc0a03e07  Sub-Quote-2.006008.tar.gz
+sha256  94bebd500af55762e83ea2f2bc594d87af828072370c7110c60c238a800d15b2  Sub-Quote-2.006008.tar.gz
 
 # computed by scancpan
-sha256  88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c  LICENSE
+sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
index a22da16922..3c2a25be51 100644
--- a/package/perl-sub-quote/perl-sub-quote.mk
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SUB_QUOTE_VERSION = 2.006006
+PERL_SUB_QUOTE_VERSION = 2.006008
 PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
 PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
