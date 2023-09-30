Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEC7E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FF341F32;
	Sat, 30 Sep 2023 07:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16FF341F32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cg797_UoMora; Sat, 30 Sep 2023 07:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAA9B42EB6;
	Sat, 30 Sep 2023 07:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAA9B42EB6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB891BF417
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7AA340191
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7AA340191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJF63M8Azc4K for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D0A040136
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D0A040136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAC7B828DE; Sat, 30 Sep 2023 07:13:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 09:11:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7cae57af0da81492ac11c062c1cab1693b3bbed
X-Git-Newrev: d86485b26929f2e7e1106ed5249ddfe577b3dd3e
X-Patchwork-Hint: ignore
Message-Id: <20230930071347.EAC7B828DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mozilla-ca: bump to version
 20230821
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

commit: https://git.buildroot.net/buildroot/commit/?id=d86485b26929f2e7e1106ed5249ddfe577b3dd3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 6 +++---
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 799a531fe6..33465ca316 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2f136d096352a418e546e4afb70e7aa9  Mozilla-CA-20221114.tar.gz
-sha256  701bea67be670add5a102f9f8c879402b4983096b1cb0e20dd47d52d7a10666b  Mozilla-CA-20221114.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  a9b7b700e651cd74130edf7432f8657f  Mozilla-CA-20230821.tar.gz
+sha256  32e1d0045299004045b9c4d16c2daae453a216208873deea2440f71260a7cda1  Mozilla-CA-20230821.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index a124860b7a..b122798a29 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20221114
+PERL_MOZILLA_CA_VERSION = 20230821
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
-PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
 PERL_MOZILLA_CA_LICENSE_FILES = README
 PERL_MOZILLA_CA_DISTNAME = Mozilla-CA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
