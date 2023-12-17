Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0574DC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 22:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2DD980F79;
	Sun, 17 Dec 2023 22:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2DD980F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGPIk3qi9cIA; Sun, 17 Dec 2023 22:15:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD99D80F03;
	Sun, 17 Dec 2023 22:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD99D80F03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8F71BF425
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 393C180F03
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 393C180F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nf2G5VbEi2OP for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 22:15:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF27080EBE
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 22:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF27080EBE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BB5187B4D; Sun, 17 Dec 2023 22:15:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 23:15:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ef6884e6d59744d83649170822a4829eed146fc
X-Git-Newrev: 41e2828c4163c7480dd31d6c8c3955c123a0f2e7
X-Patchwork-Hint: ignore
Message-Id: <20231217221542.9BB5187B4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: bump to version 5.38.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41e2828c4163c7480dd31d6c8c3955c123a0f2e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The README file has seen some cosmetic changes that do not affect the
licensing terms.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl/perl.hash | 10 +++++-----
 package/perl/perl.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 983b921e27..91abcdeb92 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.3.tar.xz.{md5,sha1,sha256}.txt
-md5  17946060e6279cf32d08edc92c40efc3  perl-5.36.3.tar.xz
-sha1  9949e79c92171b39f4fb2b19ffd4ea293b8dd589  perl-5.36.3.tar.xz
-sha256  45a228daef66d02fdccc820e71f87e40d8e3df1fc4431f8d4580ec08033866bd  perl-5.36.3.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.38.2.tar.xz.{md5,sha1,sha256}.txt
+md5  d3957d75042918a23ec0abac4a2b7e0a  perl-5.38.2.tar.xz
+sha1  af1d5f9e0499f3cfa4736433631aebf7624714da  perl-5.38.2.tar.xz
+sha256  d91115e90b896520e83d4de6b52f8254ef2b70a8d545ffab33200ea9f1cf29e8  perl-5.38.2.tar.xz
 
 # Hash from: https://github.com/arsv/perl-cross/releases/download/1.5.2/perl-cross-1.5.2.hash
 sha256  584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90  perl-cross-1.5.2.tar.gz
@@ -9,4 +9,4 @@ sha256  584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90  perl-c
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  810c97bea10842d2e47bc79e51acdfa1628cfee34fa0d89330f4eb3a44e3def9  README
+sha256  9519aaeeac509b3fa8778155a63545b6086f8313546b93fe9958d1c434d476a8  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 71aef9997b..9de0425e87 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 36
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
+PERL_VERSION_MAJOR = 38
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
