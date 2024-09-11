Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C8CEE49AB
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0192400FC;
	Wed, 11 Sep 2024 13:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBLxXtGeui36; Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F9940162
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63F9940162;
	Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DDCE1BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C5CA60B46
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3E9b8i6az5A for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9045605EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9045605EB
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 934BA86F45; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffc872d5f87a565a766ac21cd9d4b2a54c9b4f48
X-Git-Newrev: 82678ddb2acf5f149d1456011343ad73787db8de
X-Patchwork-Hint: ignore
Message-Id: <20240911135919.934BA86F45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-clone: bump to version 0.47
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

commit: https://git.buildroot.net/buildroot/commit/?id=82678ddb2acf5f149d1456011343ad73787db8de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-clone/perl-clone.hash | 4 ++--
 package/perl-clone/perl-clone.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-clone/perl-clone.hash b/package/perl-clone/perl-clone.hash
index 7b69b97d06..2cd62648a8 100644
--- a/package/perl-clone/perl-clone.hash
+++ b/package/perl-clone/perl-clone.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  cafa8984a2c2e005e54b27dd1e3f0afe  Clone-0.46.tar.gz
-sha256  aadeed5e4c8bd6bbdf68c0dd0066cb513e16ab9e5b4382dc4a0aafd55890697b  Clone-0.46.tar.gz
+md5  62ff032a4df0c4abb74f76adf519361e  Clone-0.47.tar.gz
+sha256  4c2c0cb9a483efbf970cb1a75b2ca75b0e18cb84bcb5c09624f86e26b09c211d  Clone-0.47.tar.gz
 
 # computed by scancpan
 sha256  40aa7eb133e97b075024380640528760a54aefc344781741ed02539a375db5ac  README.md
diff --git a/package/perl-clone/perl-clone.mk b/package/perl-clone/perl-clone.mk
index 9e04329eab..a5d18558bc 100644
--- a/package/perl-clone/perl-clone.mk
+++ b/package/perl-clone/perl-clone.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_CLONE_VERSION = 0.46
+PERL_CLONE_VERSION = 0.47
 PERL_CLONE_SOURCE = Clone-$(PERL_CLONE_VERSION).tar.gz
-PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GARU
+PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
 PERL_CLONE_LICENSE = Artistic or GPL-1.0+
 PERL_CLONE_LICENSE_FILES = README.md
 PERL_CLONE_DISTNAME = Clone
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
