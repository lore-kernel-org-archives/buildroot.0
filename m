Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A129EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C4460FD4;
	Mon, 10 Jul 2023 16:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2C4460FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rkQPar_o5ynq; Mon, 10 Jul 2023 16:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D889960FCE;
	Mon, 10 Jul 2023 16:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D889960FCE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E00FD1BF955
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9F0381F42
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F0381F42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYI_44Lw0Diy for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:09:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D731581F2C
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D731581F2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5D2686A5F; Mon, 10 Jul 2023 16:09:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 18:07:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8caa83002edb57e4b8817ad204cd3e8022aff39a
X-Git-Newrev: 737dc627324dec90b007c2ddf96a10402c43b56f
X-Patchwork-Hint: ignore
Message-Id: <20230710160931.C5D2686A5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mail-dkim: bump version to
 1.20230630
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

commit: https://git.buildroot.net/buildroot/commit/?id=737dc627324dec90b007c2ddf96a10402c43b56f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed md5 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 3 +--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index 6edeaa9d8b..5b0e77294d 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,6 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  5a0dec58f0c2526521b2952a3c126906  Mail-DKIM-1.20220520.tar.gz
-sha256  8ac4b8c84bbfad00a3d24bf676493d207dd3cd4a735efabb9e17181534f23646  Mail-DKIM-1.20220520.tar.gz
+sha256  0fa09a93a00f43ac91017a91628265ae7d47deb507e2770532bbb2597550d3d4  Mail-DKIM-1.20230630.tar.gz
 
 # computed by scancpan
 sha256  ffaa40feb768566e52d93879fedd2c5483828b6de483874f30a0a4425351555f  LICENSE
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index f3383a02bf..4f4d86ee10 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 1.20220520
+PERL_MAIL_DKIM_VERSION = 1.20230630
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
