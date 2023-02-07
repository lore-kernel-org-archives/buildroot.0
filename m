Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE009C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53FD281ED7;
	Tue,  7 Feb 2023 22:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53FD281ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mj2lYv69wXxf; Tue,  7 Feb 2023 22:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9361F81ED3;
	Tue,  7 Feb 2023 22:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9361F81ED3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 885451BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C3AA4094D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C3AA4094D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kud0vqkXoNxS for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:15:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64A7941548
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A7941548
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EF638442A; Tue,  7 Feb 2023 22:15:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 23:13:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfad9bef35e984f00ae70f1cd51cc75b89ff5efc
X-Git-Newrev: 57a64a702a1c162a33097db7ee7e069fb64b39df
X-Patchwork-Hint: ignore
Message-Id: <20230207221510.4EF638442A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mail-dkim: bump version to
 1.20220520
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

commit: https://git.buildroot.net/buildroot/commit/?id=57a64a702a1c162a33097db7ee7e069fb64b39df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index e94adfc6ed..6edeaa9d8b 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  9de35f8aa77a85dc17423cbcce2bf46d  Mail-DKIM-1.20200824.tar.gz
-sha256  871d329830acb4840423aa59036622fb2ee394efc1d09316dcc32ae94454e916  Mail-DKIM-1.20200824.tar.gz
+md5  5a0dec58f0c2526521b2952a3c126906  Mail-DKIM-1.20220520.tar.gz
+sha256  8ac4b8c84bbfad00a3d24bf676493d207dd3cd4a735efabb9e17181534f23646  Mail-DKIM-1.20220520.tar.gz
 
 # computed by scancpan
 sha256  ffaa40feb768566e52d93879fedd2c5483828b6de483874f30a0a4425351555f  LICENSE
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index e67bf5ee18..f3383a02bf 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 1.20200824
+PERL_MAIL_DKIM_VERSION = 1.20220520
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
