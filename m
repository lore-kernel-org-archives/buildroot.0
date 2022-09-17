Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59906C6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED3F14008A;
	Sat, 17 Sep 2022 08:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED3F14008A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7D3TY-nKHF3F; Sat, 17 Sep 2022 08:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B794C4001F;
	Sat, 17 Sep 2022 08:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B794C4001F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C38C1BF973
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 156BA83EE4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 156BA83EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WwhU5gj2650U for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C3E83EE7
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C3E83EE7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 34F9A84093; Sat, 17 Sep 2022 08:45:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:39:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b420c3a162af30dbb8d5a36d602189ca5d48c9a8
X-Git-Newrev: 8032f56571081c1eb3bee1523badaab97286c805
X-Patchwork-Hint: ignore
Message-Id: <20220917084511.34F9A84093@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-http: bump to version 6.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=8032f56571081c1eb3bee1523badaab97286c805
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-This software is copyright (c) 2020 by Toby Inkster.
+This software is copyright (c) 2022 by Toby Inkster.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-http/perl-net-http.hash | 6 +++---
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 85ddad6eea..f02fd90808 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  dbe27483034a79a7d43f61cc48540641  Net-HTTP-6.21.tar.gz
-sha256  375aa35b76be99f06464089174d66ac76f78ce83a5c92a907bbfab18b099eec4  Net-HTTP-6.21.tar.gz
+md5  1d46019fb8559070a5ec1d838b690657  Net-HTTP-6.22.tar.gz
+sha256  62faf9a5b84235443fe18f780e69cecf057dea3de271d7d8a0ba72724458a1a2  Net-HTTP-6.22.tar.gz
 
 # computed by scancpan
-sha256  49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79  LICENSE
+sha256  0ed700a4bfc022e999d83407f71ab62ead96662d8f7bbebfd857376bf3ed6528  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index de0809d0b6..b4cef6188b 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.21
+PERL_NET_HTTP_VERSION = 6.22
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
