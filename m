Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E88E728F3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E169680F62;
	Fri, 29 Sep 2023 20:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E169680F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bd5KbUgqC5oL; Fri, 29 Sep 2023 20:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF65081E5A;
	Fri, 29 Sep 2023 20:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF65081E5A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 686F11BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B5DC60AD6
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5DC60AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbnGT65lALld for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 519A860F26
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 519A860F26
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F3B383708; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:26:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2e739991c529a3c11d0da4d8af01b0c03ad6a01
X-Git-Newrev: afbef42170f997e2b5caea441116662f8d8578c4
X-Patchwork-Hint: ignore
Message-Id: <20230929202828.4F3B383708@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-tiny-type: bump to version
 2.004000
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

commit: https://git.buildroot.net/buildroot/commit/?id=afbef42170f997e2b5caea441116662f8d8578c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: update copyright dates & remove trailing spaces
see  https://metacpan.org/release/TOBYINK/Type-Tiny-2.004000/diff/TOBYINK/Type-Tiny-1.012004#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-type-tiny/perl-type-tiny.hash | 8 ++++----
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 9e5924abb8..bca5153a03 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  7a1688c4de07a0ed481a1811e5e82e63  Type-Tiny-1.012004.tar.gz
-sha256  75cd06b612d1830ae9f4b22298b506b3ff04518fa7453f487c248cd62a906a2b  Type-Tiny-1.012004.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  08bb43feabaab97dac7a3e59b5c77ff3  Type-Tiny-2.004000.tar.gz
+sha256  697e7f775edfc85f4cf07792d04fd19b09c25285f98f5938e8efc4f74507a128  Type-Tiny-2.004000.tar.gz
 
 # computed by scancpan
-sha256  34427749499bd6d6e5d206089bc03d76c647a1350f8b5f95ea628d2b6ff56e4c  LICENSE
+sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 5efa78f161..31c84a2637 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.012004
+PERL_TYPE_TINY_VERSION = 2.004000
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
