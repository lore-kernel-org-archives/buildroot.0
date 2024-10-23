Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A77CFA461
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8055C40528;
	Wed, 23 Oct 2024 19:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbg80uD-xQh4; Wed, 23 Oct 2024 19:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29B9A40520
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B9A40520;
	Wed, 23 Oct 2024 19:22:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 010D727ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF95E40A5E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fdsykr9a2CH for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B398D40A60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B398D40A60
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:22:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB5AD8632D; Wed, 23 Oct 2024 19:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 21:21:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dffe7d49dc8250068a9bdf4a9051817f6553e10
X-Git-Newrev: f48f103126bf3e5e55ceb936b828f5d916967fc8
X-Patchwork-Hint: ignore
Message-Id: <20241023192206.AB5AD8632D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-extutils-installpaths: bump
 to version 0.014
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=f48f103126bf3e5e55ceb936b828f5d916967fc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-extutils-installpaths/perl-extutils-installpaths.hash | 4 ++--
 package/perl-extutils-installpaths/perl-extutils-installpaths.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
index 4ad0a8e7db..9838345b65 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  84d9af4ab9c2d5211681122bcc6e67a3  ExtUtils-InstallPaths-0.013.tar.gz
-sha256  65969d3ad8a3a2ea8ef5b4213ed5c2c83961bb5bd12f7ad35128f6bd5b684aa0  ExtUtils-InstallPaths-0.013.tar.gz
+md5  34fb12d1b245e44142846c72905beffc  ExtUtils-InstallPaths-0.014.tar.gz
+sha256  ae65d20cc3c7e14b3cd790915c84510f82dfb37a4c9b88aa74b2e843af417d01  ExtUtils-InstallPaths-0.014.tar.gz
 
 # computed by scancpan
 sha256  bddd4809100e5b59fa3b029b2cd303d6384cff751c3898d53827777181a9aabd  LICENSE
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
index face0ed14c..31727194df 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.013
+PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.014
 PERL_EXTUTILS_INSTALLPATHS_SOURCE = ExtUtils-InstallPaths-$(PERL_EXTUTILS_INSTALLPATHS_VERSION).tar.gz
 PERL_EXTUTILS_INSTALLPATHS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_EXTUTILS_INSTALLPATHS_DEPENDENCIES = host-perl-extutils-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
