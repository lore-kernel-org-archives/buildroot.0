Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E3AEE49B0
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C61740E04;
	Wed, 11 Sep 2024 13:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukyJrhaScJng; Wed, 11 Sep 2024 13:59:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0701740E34
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0701740E34;
	Wed, 11 Sep 2024 13:59:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD7D51BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C86004029F
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6rdCLcCmbke for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6C6B400FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6C6B400FC
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DDAD86E9D; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82678ddb2acf5f149d1456011343ad73787db8de
X-Git-Newrev: f2284d30c2f59a693057375178a87e2849a40b09
X-Patchwork-Hint: ignore
Message-Id: <20240911135919.9DDAD86E9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-data-uuid: bump to version
 1.227
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2284d30c2f59a693057375178a87e2849a40b09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-data-uuid/perl-data-uuid.hash | 6 +++---
 package/perl-data-uuid/perl-data-uuid.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-data-uuid/perl-data-uuid.hash b/package/perl-data-uuid/perl-data-uuid.hash
index b2c8629605..1405f1d0b0 100644
--- a/package/perl-data-uuid/perl-data-uuid.hash
+++ b/package/perl-data-uuid/perl-data-uuid.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  13468e0fb65a0b5ce27b8628cb2f0109  Data-UUID-1.226.tar.gz
-sha256  093d57ffa0d411a94bafafae495697db26f5c9d0277198fe3f7cf2be22996453  Data-UUID-1.226.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  6463f46996e5f00beb57317e49e238b5  Data-UUID-1.227.tar.gz
+sha256  95bda7276265f57bc48ffdeddec5ef28cd6f765e3a183757fa5f09f0ce6b98ac  Data-UUID-1.227.tar.gz
 
 # computed by scancpan
 sha256  0560c8eea8e1fb8173faa6c2e9b7e9f8728b8ae8250a814709a53c30b778d5fb  LICENSE
diff --git a/package/perl-data-uuid/perl-data-uuid.mk b/package/perl-data-uuid/perl-data-uuid.mk
index 93060964bb..fc272fb484 100644
--- a/package/perl-data-uuid/perl-data-uuid.mk
+++ b/package/perl-data-uuid/perl-data-uuid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_DATA_UUID_VERSION = 1.226
+PERL_DATA_UUID_VERSION = 1.227
 PERL_DATA_UUID_SOURCE = Data-UUID-$(PERL_DATA_UUID_VERSION).tar.gz
-PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
+PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GT/GTERMARS
 # The license is documented at
 # https://fedoraproject.org/wiki/Licensing:MIT#HP_Variant as the "HP
 # Variant" of the MIT license. There is no official SPDX tag for this
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
