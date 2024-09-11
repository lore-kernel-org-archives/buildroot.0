Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0E4EE49B2
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D357F40F8D;
	Wed, 11 Sep 2024 13:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_O9vs9yKFri; Wed, 11 Sep 2024 13:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75A7C40F84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75A7C40F84;
	Wed, 11 Sep 2024 13:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 123CD1BF20B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 016B0400FC
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maHvXJirP78D for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBBA240162
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBBA240162
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E10A386F6A; Wed, 11 Sep 2024 13:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:26:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef07108bb840d9b51a3cd174aae605b914b7ab67
X-Git-Newrev: 82f5b98f9ca774338aed20849964212a06a2afae
X-Patchwork-Hint: ignore
Message-Id: <20240911135919.E10A386F6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mime-tools: bump to version
 5.515
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

commit: https://git.buildroot.net/buildroot/commit/?id=82f5b98f9ca774338aed20849964212a06a2afae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mime-tools/perl-mime-tools.hash | 6 +++---
 package/perl-mime-tools/perl-mime-tools.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mime-tools/perl-mime-tools.hash b/package/perl-mime-tools/perl-mime-tools.hash
index f67fe61549..0b3ce379f4 100644
--- a/package/perl-mime-tools/perl-mime-tools.hash
+++ b/package/perl-mime-tools/perl-mime-tools.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  a2f0e07da2ff4b0478908544cc4b40fa  MIME-tools-5.509.tar.gz
-sha256  64579f0c923d81d9a2194586e47c3475519e2646e4b5c102a8920759facf6973  MIME-tools-5.509.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  dbc3c9f982498c35d8a103af17c5b5c9  MIME-tools-5.515.tar.gz
+sha256  c1ba1dd9f0b2cd82a0e75caedec51e48233f9f01dc29a0971bdff1cb53be9013  MIME-tools-5.515.tar.gz
 
 # computed by scancpan
 sha256  151cd94e37eb05239c5a678c7d1c4d9d5241a7c9c138760b85152bc1947e2b93  COPYING
diff --git a/package/perl-mime-tools/perl-mime-tools.mk b/package/perl-mime-tools/perl-mime-tools.mk
index 10279d7308..1b526be91d 100644
--- a/package/perl-mime-tools/perl-mime-tools.mk
+++ b/package/perl-mime-tools/perl-mime-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MIME_TOOLS_VERSION = 5.509
+PERL_MIME_TOOLS_VERSION = 5.515
 PERL_MIME_TOOLS_SOURCE = MIME-tools-$(PERL_MIME_TOOLS_VERSION).tar.gz
 PERL_MIME_TOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DS/DSKOLL
 PERL_MIME_TOOLS_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
