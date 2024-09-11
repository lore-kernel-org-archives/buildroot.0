Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6855AEE49B0
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 14:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EBBD41011;
	Wed, 11 Sep 2024 14:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_WUKb1F6jIX; Wed, 11 Sep 2024 14:00:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1ADD4104C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1ADD4104C;
	Wed, 11 Sep 2024 14:00:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D725D1BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB7C260AB9
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVvw-j63zH3v for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6485B60B36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6485B60B36
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6233886F45; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8e21d1c415b69e0fc5543b5340e4fba4b5f83c1
X-Git-Newrev: 9ae8da424b8e8efb4022d2a8c48abb428a542385
X-Patchwork-Hint: ignore
Message-Id: <20240911135920.6233886F45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-extutils-installpaths: bump
 to version 0.013
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ae8da424b8e8efb4022d2a8c48abb428a542385
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/LEONT/ExtUtils-InstallPaths-0.013/diff/LEONT/ExtUtils-InstallPaths-0.012#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../perl-extutils-installpaths/perl-extutils-installpaths.hash    | 8 ++++----
 package/perl-extutils-installpaths/perl-extutils-installpaths.mk  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
index 199706044c..4ad0a8e7db 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  9a8d66aab1ffec98ea260faf03ac612b  ExtUtils-InstallPaths-0.012.tar.gz
-sha256  84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed  ExtUtils-InstallPaths-0.012.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  84d9af4ab9c2d5211681122bcc6e67a3  ExtUtils-InstallPaths-0.013.tar.gz
+sha256  65969d3ad8a3a2ea8ef5b4213ed5c2c83961bb5bd12f7ad35128f6bd5b684aa0  ExtUtils-InstallPaths-0.013.tar.gz
 
 # computed by scancpan
-sha256  b95d38ac031587625625d92fbd2ee1d5df0d02606057d680e7dcf3598fe629f9  LICENSE
+sha256  bddd4809100e5b59fa3b029b2cd303d6384cff751c3898d53827777181a9aabd  LICENSE
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
index e90e130c36..face0ed14c 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.012
+PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.013
 PERL_EXTUTILS_INSTALLPATHS_SOURCE = ExtUtils-InstallPaths-$(PERL_EXTUTILS_INSTALLPATHS_VERSION).tar.gz
 PERL_EXTUTILS_INSTALLPATHS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_EXTUTILS_INSTALLPATHS_DEPENDENCIES = host-perl-extutils-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
