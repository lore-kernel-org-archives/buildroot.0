Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFEBC6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 964A883F11;
	Sat, 17 Sep 2022 08:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 964A883F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cguCX65-52i1; Sat, 17 Sep 2022 08:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A5083EE7;
	Sat, 17 Sep 2022 08:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3A5083EE7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F005F1BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D950283EEA
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D950283EEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eu3NtkO8KoxY for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FDD983EE4
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FDD983EE4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0E2E684094; Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:39:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebe96e90c2e673089d3bca177bef9e858aebf452
X-Git-Newrev: aa7ac182f9bf3fdc71f3a851be3507b38264e366
X-Patchwork-Hint: ignore
Message-Id: <20220917084511.0E2E684094@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-io-socket-ssl: bump to
 version 2.075
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa7ac182f9bf3fdc71f3a851be3507b38264e366
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index 4a1d71e349..8c6bb30523 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  53201b8e4dfaf25d4d661a54fdfda602  IO-Socket-SSL-2.074.tar.gz
-sha256  36486b6be49da4d029819cf7069a7b41ed48af0c87e23be0f8e6aba23d08a832  IO-Socket-SSL-2.074.tar.gz
+md5  8f0f6bff4db5e4be6e848aa49fd29380  IO-Socket-SSL-2.075.tar.gz
+sha256  c30ee2220b1e181a968ebbc81861d0cadf334b001377a44105ae5a8637ddae8c  IO-Socket-SSL-2.075.tar.gz
 
 # computed by scancpan
 sha256  090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032  README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 1ab70509bd..daa46acf95 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.074
+PERL_IO_SOCKET_SSL_VERSION = 2.075
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
