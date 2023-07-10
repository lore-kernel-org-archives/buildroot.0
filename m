Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854BDEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 378E260FCD;
	Mon, 10 Jul 2023 16:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 378E260FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZ779u6v0mOA; Mon, 10 Jul 2023 16:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5961660FC6;
	Mon, 10 Jul 2023 16:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5961660FC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16F1F1BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F06F941761
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F06F941761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0b28Ft1GtsI7 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:09:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB5284175B
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB5284175B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D83F686A63; Mon, 10 Jul 2023 16:09:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 18:07:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38efcd326205baa0d2dfaf021836f5ac870edf45
X-Git-Newrev: ccdeeb03c3312347fcf7ad8d153dedd9ff32ba2e
X-Patchwork-Hint: ignore
Message-Id: <20230710160931.D83F686A63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-http: bump version to 6.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccdeeb03c3312347fcf7ad8d153dedd9ff32ba2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed md5 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-http/perl-net-http.hash | 3 +--
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index f02fd90808..094b9e5da0 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,6 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  1d46019fb8559070a5ec1d838b690657  Net-HTTP-6.22.tar.gz
-sha256  62faf9a5b84235443fe18f780e69cecf057dea3de271d7d8a0ba72724458a1a2  Net-HTTP-6.22.tar.gz
+sha256  0d65c09dd6c8589b2ae1118174d3c1a61703b6ecfc14a3442a8c74af65e0c94e  Net-HTTP-6.23.tar.gz
 
 # computed by scancpan
 sha256  0ed700a4bfc022e999d83407f71ab62ead96662d8f7bbebfd857376bf3ed6528  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index b4cef6188b..08e81f95a1 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.22
+PERL_NET_HTTP_VERSION = 6.23
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
