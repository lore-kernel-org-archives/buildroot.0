Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94054C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:47:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587D460F38
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 587D460F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F4DD80E6E;
	Sun, 14 Nov 2021 14:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTxlDonfJsIe; Sun, 14 Nov 2021 14:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 757A580E65;
	Sun, 14 Nov 2021 14:47:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0991B1BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8A25400F3
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAUt4gv9etRe for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:45:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B662D4011C
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:45:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 497AE8D31D; Sun, 14 Nov 2021 14:41:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:45:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6350bd24e53ab2a3038c1e30f1b40465c80f0344
X-Git-Newrev: 682c7e7bcbc24bb0993fe954356953448c2ba52a
X-Patchwork-Hint: ignore
Message-Id: <20211114144149.497AE8D31D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-mozilla-ca: bump
 to version 20211001
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

commit: https://git.buildroot.net/buildroot/commit/?id=682c7e7bcbc24bb0993fe954356953448c2ba52a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index c577d4887e..07966f9906 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  8ac3fe1a83c45da3f468f78ab8133ea6  Mozilla-CA-20200520.tar.gz
-sha256  b3ca0002310bf24a16c0d5920bdea97a2f46e77e7be3e7377e850d033387c726  Mozilla-CA-20200520.tar.gz
+md5  843e42f367ea3c7abc5de5b6225791dc  Mozilla-CA-20211001.tar.gz
+sha256  122c8900000a9d388aa8e44f911cab6c118fe8497417917a84a8ec183971b449  Mozilla-CA-20211001.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 3bcb947f72..6b970c0f94 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20200520
+PERL_MOZILLA_CA_VERSION = 20211001
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABH
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
