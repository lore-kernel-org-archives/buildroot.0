Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E4BE728F3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CEA283D2A;
	Fri, 29 Sep 2023 20:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CEA283D2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFSVABecKfGv; Fri, 29 Sep 2023 20:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A0483C12;
	Fri, 29 Sep 2023 20:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A0483C12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EAF51BF99A
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED64761611
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED64761611
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cSc8ga2QYpN for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26C9660AD6
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26C9660AD6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16FF383708; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:23:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7eb9f13cf24a0795c9bdc1e92ccf17e75d933c0
X-Git-Newrev: 6c5eaa14e3031db776d94ca128db94739c3cf565
X-Patchwork-Hint: ignore
Message-Id: <20230929202828.16FF383708@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-moo: bump to version 2.005005
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c5eaa14e3031db776d94ca128db94739c3cf565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/HAARG/Moo-2.005005/diff/HAARG/Moo-2.005004#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-moo/perl-moo.hash | 8 ++++----
 package/perl-moo/perl-moo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-moo/perl-moo.hash b/package/perl-moo/perl-moo.hash
index 9b67e7a65c..f70646deca 100644
--- a/package/perl-moo/perl-moo.hash
+++ b/package/perl-moo/perl-moo.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  49ecf491b49b9b200e8a5dfd1a42b480  Moo-2.005004.tar.gz
-sha256  e3030b80bd554a66f6b3c27fd53b1b5909d12af05c4c11ece9a58f8d1e478928  Moo-2.005004.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  259530e5ea37a1bf968f6cf18a25db86  Moo-2.005005.tar.gz
+sha256  fb5a2952649faed07373f220b78004a9c6aba387739133740c1770e9b1f4b108  Moo-2.005005.tar.gz
 
 # computed by scancpan
-sha256  a8a1595c2347f7d10e896809d4f3dea85ccc10ac5644b8073111233cd120b14a  LICENSE
+sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
index 6c484ba9e3..18e32688e1 100644
--- a/package/perl-moo/perl-moo.mk
+++ b/package/perl-moo/perl-moo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOO_VERSION = 2.005004
+PERL_MOO_VERSION = 2.005005
 PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
 PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOO_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
