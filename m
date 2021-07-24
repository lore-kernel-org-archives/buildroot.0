Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0008CC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:53:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02BB60E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C02BB60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96BDE4061E;
	Sat, 24 Jul 2021 07:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZePMYokC3Sa8; Sat, 24 Jul 2021 07:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D42CE40581;
	Sat, 24 Jul 2021 07:53:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09BA71BF4D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D405383A9B
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlAPmzQLdDd1 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39E8483A9E
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:51:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1BBF1888E7; Sat, 24 Jul 2021 07:17:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:50:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bcbaaae1e0bfccc4d2b858bdc1c646b7fc7da7b
X-Git-Newrev: b350246df61671fa8f6b177e5015d4d2ac13f5d1
X-Patchwork-Hint: ignore
Message-Id: <20210724071726.1BBF1888E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-telnet: bump to version
 3.05
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b350246df61671fa8f6b177e5015d4d2ac13f5d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff in README:
-    Copyright (c) 1997, 2000, 2002, 2013 Jay Rogers.  All rights
+    Copyright (c) 1997, 2000, 2002, 2013, 2021 Jay Rogers.  All rights

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-telnet/perl-net-telnet.hash | 6 +++---
 package/perl-net-telnet/perl-net-telnet.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-telnet/perl-net-telnet.hash b/package/perl-net-telnet/perl-net-telnet.hash
index cf1def6a57..c6dc0ca600 100644
--- a/package/perl-net-telnet/perl-net-telnet.hash
+++ b/package/perl-net-telnet/perl-net-telnet.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d2514080116c1b0fa5f96295c84538e3 Net-Telnet-3.04.tar.gz
-sha256 e64d567a4e16295ecba949368e7a6b8b5ae2a16b3ad682121d9b007dc5d2a37a Net-Telnet-3.04.tar.gz
+md5  c8573c57a2d9469f038c40ac284b1e5f  Net-Telnet-3.05.tar.gz
+sha256  677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d923bd6283796a743  Net-Telnet-3.05.tar.gz
 
 # computed by scancpan
-sha256 05beca683093827706ef45a4958bf23bcd91990e0beeb0b098f97c661478c90d README
+sha256  22d0a3343b46c7857cd7d06cb37fe437d467df71aa5854af515374e1e8bf6c53  README
diff --git a/package/perl-net-telnet/perl-net-telnet.mk b/package/perl-net-telnet/perl-net-telnet.mk
index 0b9cce0af8..ec3c022168 100644
--- a/package/perl-net-telnet/perl-net-telnet.mk
+++ b/package/perl-net-telnet/perl-net-telnet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_TELNET_VERSION = 3.04
+PERL_NET_TELNET_VERSION = 3.05
 PERL_NET_TELNET_SOURCE = Net-Telnet-$(PERL_NET_TELNET_VERSION).tar.gz
 PERL_NET_TELNET_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JR/JROGERS
 PERL_NET_TELNET_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
