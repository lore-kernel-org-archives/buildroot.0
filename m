Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0575EC3DA78
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 21:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F7724025A;
	Fri, 13 Jan 2023 21:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F7724025A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qlcefgoXcNVj; Fri, 13 Jan 2023 21:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5225A4196C;
	Fri, 13 Jan 2023 21:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5225A4196C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F18501BF41F
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 21:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBFF540147
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 21:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBFF540147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDVYkdk0FGNX for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 21:08:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5280540143
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5280540143
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 21:08:12 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout08.t-online.de (Postfix) with SMTP id 0FC9914F59;
 Fri, 13 Jan 2023 22:08:01 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd74.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pGRHF-2Ouo770; Fri, 13 Jan 2023 22:07:53 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:52540)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pGRHF-0000Yg-1F;
 Fri, 13 Jan 2023 22:07:53 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 13 Jan 2023 22:07:53 +0100
Message-Id: <20230113210753.23966-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673644073-CACB7B6F-8EB81441/0/0 CLEAN NORMAL
X-TOI-MSGID: 0111c6b1-2f13-4956-b99f-9d73c1f92ddf
Subject: [Buildroot] [PATCH v2 1/1] package/perl-mail-dkim: bump version to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed hash file (Peter)

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
