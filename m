Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD48E728F3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5539383B9C;
	Fri, 29 Sep 2023 20:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5539383B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Bf3uwQ6Jrsj; Fri, 29 Sep 2023 20:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3073834BB;
	Fri, 29 Sep 2023 20:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3073834BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFFBF1BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D78BE611C6
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D78BE611C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfnS9sFC-GFA for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D96560A91
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D96560A91
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DC8383707; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:21:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03bdb1e1b2e25ee979a97f6ca3f918f107a03615
X-Git-Newrev: d7eb9f13cf24a0795c9bdc1e92ccf17e75d933c0
X-Patchwork-Hint: ignore
Message-Id: <20230929202828.0DC8383707@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/perl-mojolicious-plugin-authentication: bump to version 1.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7eb9f13cf24a0795c9bdc1e92ccf17e75d933c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: remove trailing spaces
see https://metacpan.org/release/JJATRIA/Mojolicious-Plugin-Authentication-1.39/diff/JJATRIA/Mojolicious-Plugin-Authentication-1.37#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../perl-mojolicious-plugin-authentication.hash                   | 8 ++++----
 .../perl-mojolicious-plugin-authentication.mk                     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
index 34362f5d8d..fe39b093c7 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  c475f2d3962441698b178ad1bd7d2e29  Mojolicious-Plugin-Authentication-1.37.tar.gz
-sha256  a7ed206725b7b395d4fca12e3f1d923da644d913333ff48ea231e064ecb1abb6  Mojolicious-Plugin-Authentication-1.37.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  141dd090f6d8470a0d3483dc1f7aaa20  Mojolicious-Plugin-Authentication-1.39.tar.gz
+sha256  9f99cbdf5cacaa3fa3f961bee94de97226d177a36a15e7ba303ae79d132874d1  Mojolicious-Plugin-Authentication-1.39.tar.gz
 
 # computed by scancpan
-sha256  37d219684a6c5f8754435fb0dd36a779121e416553fd6a75e22a7545039d1021  LICENSE
+sha256  a2b15d79eaf2f13f756816abfe4d3d3fb4c4c206e7fb1a36abb3e741583aac26  LICENSE
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
index 57c356eee5..1d5e2511f6 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.37
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.39
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SOURCE = Mojolicious-Plugin-Authentication-$(PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JJ/JJATRIA
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
