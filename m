Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B027BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E9FC6FAD4;
	Tue, 21 Feb 2023 01:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E9FC6FAD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Nv1P2DwbWhT; Tue, 21 Feb 2023 01:16:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9656E6FB76;
	Tue, 21 Feb 2023 01:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9656E6FB76
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A27EE1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 054076FBB3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 054076FBB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id soyv2Z3TFAcZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 150226FB8C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 150226FB8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11D1D81979; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:41:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2fb59f913d0e21a51491e64ea781702400cfcd5e
X-Git-Newrev: 57ee214f608ca862bed6ccfec044b3d46d85e800
X-Patchwork-Hint: ignore
Message-Id: <20230220205242.11D1D81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-mozilla-ca: bump
 to version 20221114
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

commit: https://git.buildroot.net/buildroot/commit/?id=57ee214f608ca862bed6ccfec044b3d46d85e800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 07966f9906..799a531fe6 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  843e42f367ea3c7abc5de5b6225791dc  Mozilla-CA-20211001.tar.gz
-sha256  122c8900000a9d388aa8e44f911cab6c118fe8497417917a84a8ec183971b449  Mozilla-CA-20211001.tar.gz
+md5  2f136d096352a418e546e4afb70e7aa9  Mozilla-CA-20221114.tar.gz
+sha256  701bea67be670add5a102f9f8c879402b4983096b1cb0e20dd47d52d7a10666b  Mozilla-CA-20221114.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 6b970c0f94..a124860b7a 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20211001
+PERL_MOZILLA_CA_VERSION = 20221114
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
-PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABH
+PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
 PERL_MOZILLA_CA_LICENSE_FILES = README
 PERL_MOZILLA_CA_DISTNAME = Mozilla-CA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
