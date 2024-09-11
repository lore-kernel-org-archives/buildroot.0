Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D6FEE49AB
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 14:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBB4441009;
	Wed, 11 Sep 2024 14:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c501ka0Wopqy; Wed, 11 Sep 2024 14:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89ADE41002
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89ADE41002;
	Wed, 11 Sep 2024 14:00:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7219D1BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D503460B34
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0EKiA41AB91v for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87754605EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87754605EB
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8516F86F45; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c83a6fe7186af17e20397d025b6c986b77d75ae
X-Git-Newrev: b3dc4b00b12cd6963d1b43bef7eb55fad3f63404
X-Patchwork-Hint: ignore
Message-Id: <20240911135920.8516F86F45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-gdgraph: bump to version 1.56
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3dc4b00b12cd6963d1b43bef7eb55fad3f63404
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff README: update AUTHOR section
    see https://metacpan.org/release/BPS/GDGraph-1.56/diff/RUZ/GDGraph-1.54#README

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-gdgraph/perl-gdgraph.hash | 8 ++++----
 package/perl-gdgraph/perl-gdgraph.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-gdgraph/perl-gdgraph.hash b/package/perl-gdgraph/perl-gdgraph.hash
index b2ad4ecc30..1f23762a69 100644
--- a/package/perl-gdgraph/perl-gdgraph.hash
+++ b/package/perl-gdgraph/perl-gdgraph.hash
@@ -1,7 +1,7 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  38c6a188519e6272e9b2b722b315c3d8  GDGraph-1.54.tar.gz
-sha256  b96f5c10b656c17d16ab65a1777c908297b028d3b6815f6d54b2337f006bfa4f  GDGraph-1.54.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  4ed2187e4f59c2bfb0392fb407a59d13  GDGraph-1.56.tar.gz
+sha256  6f49cc4e59015480db9c9b6b18afd8c50be30886687b69411513d06f38971113  GDGraph-1.56.tar.gz
 
 # Hash for license files
 sha256  710484e3a1196664bbe8a5ad5d53c528e01226eb20e2885a4e1131eb6c6565cd  Dustismo.LICENSE
-sha256  f44630ad9101e40a101d906a07908c975a9b0742273cfb0c00a51d73afb53e7d  README
+sha256  a343db34e71a251a14209957c89add8fd1bc62c34aa3c3818d1b474635c11754  README
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index 286902a66e..80e1eab35e 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_GDGRAPH_VERSION = 1.54
+PERL_GDGRAPH_VERSION = 1.56
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
-PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
+PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BP/BPS
 PERL_GDGRAPH_LICENSE = Artistic or GPL-1.0+ (perl module), GPL-2.0+ (font)
 PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE README
 PERL_GDGRAPH_DISTNAME = GDGraph
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
