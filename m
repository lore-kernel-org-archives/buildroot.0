Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CDCCFA460
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E50D96065D;
	Wed, 23 Oct 2024 19:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqOhSR1yl3N0; Wed, 23 Oct 2024 19:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE0D460829
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE0D460829;
	Wed, 23 Oct 2024 19:22:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B744127F2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 989F160829
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0t2MC0XL5N5O for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A822E6065D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A822E6065D
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:22:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DB4086362; Wed, 23 Oct 2024 19:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 21:21:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72757d111a5d3fbe3ac53ff0772c9a912757b749
X-Git-Newrev: 8dffe7d49dc8250068a9bdf4a9051817f6553e10
X-Patchwork-Hint: ignore
Message-Id: <20241023192206.9DB4086362@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-digest-hmac: bump to version
 1.05
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dffe7d49dc8250068a9bdf4a9051817f6553e10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE: use "The Perl Artistic License 1.0" and update millesime
    see https://metacpan.org/release/ARODLAND/Digest-HMAC-1.05/diff/ARODLAND/Digest-HMAC-1.04#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-digest-hmac/perl-digest-hmac.hash | 8 ++++----
 package/perl-digest-hmac/perl-digest-hmac.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-digest-hmac/perl-digest-hmac.hash b/package/perl-digest-hmac/perl-digest-hmac.hash
index 5e7da14f3f..4a4b8e5f05 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.hash
+++ b/package/perl-digest-hmac/perl-digest-hmac.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  746a5edffd1485d7500e005730c271c8  Digest-HMAC-1.04.tar.gz
-sha256  d6bc8156aa275c44d794b7c18f44cdac4a58140245c959e6b19b2c3838b08ed4  Digest-HMAC-1.04.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  cbeca4ad4c21c241080cd6ee47bdca6e  Digest-HMAC-1.05.tar.gz
+sha256  215cb59cba610745cfb2d4b3f8ef756d590e57e3ad7986a992e87c4969fcdc7a  Digest-HMAC-1.05.tar.gz
 
 # computed by scancpan
-sha256  cb9ff694d1769f450dd5c400204aa921d2fb3db90fcb21674a39f3725c4255c1  LICENSE
+sha256  c10e8c1b7e9e524e361cc87244c74e3abeae5652f246bcc050327f53ba85cba1  LICENSE
diff --git a/package/perl-digest-hmac/perl-digest-hmac.mk b/package/perl-digest-hmac/perl-digest-hmac.mk
index bc080703de..0fa4adf778 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.mk
+++ b/package/perl-digest-hmac/perl-digest-hmac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DIGEST_HMAC_VERSION = 1.04
+PERL_DIGEST_HMAC_VERSION = 1.05
 PERL_DIGEST_HMAC_SOURCE = Digest-HMAC-$(PERL_DIGEST_HMAC_VERSION).tar.gz
 PERL_DIGEST_HMAC_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AR/ARODLAND
 PERL_DIGEST_HMAC_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
