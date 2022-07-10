Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC40C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 07:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7480405E3;
	Sun, 10 Jul 2022 07:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7480405E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCPst4kUTMHT; Sun, 10 Jul 2022 07:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2A0F405F5;
	Sun, 10 Jul 2022 07:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2A0F405F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4312B1BF372
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 07:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1663160AA7
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 07:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1663160AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLvy-azuhDCH for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 07:58:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCEC460A92
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCEC460A92
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 07:58:51 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout07.t-online.de (Postfix) with SMTP id A31D2645A;
 Sun, 10 Jul 2022 09:58:48 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.11.100]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oARq1-04ZmTJ0; Sun, 10 Jul 2022 09:58:45 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:35780)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oARq1-0006IT-3J;
 Sun, 10 Jul 2022 09:58:45 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 09:58:45 +0200
Message-Id: <20220710075845.610239-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657439925-0143AB67-AE9CB25F/0/0 CLEAN NORMAL
X-TOI-MSGID: 2c7fab2e-296b-4b3f-84da-693c2304d0c1
Subject: [Buildroot] [PATCH 1/1] package/perl-crypt-openssl-rsa: bump
 version to 0.33
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

Removed md5 hash, reformatted license hash.

Changelog:
https://github.com/toddr/Crypt-OpenSSL-RSA/blob/master/Changes

This bump fixes a build error with LibreSSL 3.5.

Fixes:
http://autobuild.buildroot.net/results/6625daef1a9d44b9925aecd6e98e3a59bc2ce8f4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash | 7 +++----
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
index fe2a578583..946f879c21 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
@@ -1,6 +1,5 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    d33681e19d2094df7c26bc7a4509265e Crypt-OpenSSL-RSA-0.31.tar.gz
-sha256 4173403ad4cf76732192099f833fbfbf3cd8104e0246b3844187ae384d2c5436 Crypt-OpenSSL-RSA-0.31.tar.gz
+# From https://cpan.metacpan.org/authors/id/T/TO/TODDR/CHECKSUMS
+sha256  bdbe630f6d6f540325746ad99977272ac8664ff81bd19f0adaba6d6f45efd864  Crypt-OpenSSL-RSA-0.33.tar.gz
 
 # computed by scancpan
-sha256 8a693ad3f52daeeb5ac5deceb1e1109c9c87095ed5ba6506d6d5c106e4066f5a LICENSE
+sha256  8a693ad3f52daeeb5ac5deceb1e1109c9c87095ed5ba6506d6d5c106e4066f5a  LICENSE
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index 23fd1ac381..e1bfd6a76d 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_RSA_VERSION = 0.31
+PERL_CRYPT_OPENSSL_RSA_VERSION = 0.33
 PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
