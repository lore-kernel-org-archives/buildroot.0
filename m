Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E886BC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD1042D42;
	Mon, 20 Feb 2023 21:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD1042D42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id McFaExeyfk-D; Mon, 20 Feb 2023 21:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC1242D2A;
	Mon, 20 Feb 2023 21:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC1242D2A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFB2C1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6F5941947
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F5941947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpLzZQRXt2RV for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF3814192D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3814192D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8E1B86496; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:41:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3496f300a8ca2bb8b337db5d43be5b3293a4e9e4
X-Git-Newrev: 11133fbf22c64906655b7269d247ceeec28d0b41
X-Patchwork-Hint: ignore
Message-Id: <20230220205241.C8E1B86496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-data-optlist:
 bump to version 0.113
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

commit: https://git.buildroot.net/buildroot/commit/?id=11133fbf22c64906655b7269d247ceeec28d0b41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-data-optlist/perl-data-optlist.hash | 4 ++--
 package/perl-data-optlist/perl-data-optlist.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-data-optlist/perl-data-optlist.hash b/package/perl-data-optlist/perl-data-optlist.hash
index 1c805acef7..ccc05ae4d6 100644
--- a/package/perl-data-optlist/perl-data-optlist.hash
+++ b/package/perl-data-optlist/perl-data-optlist.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  3b2cdb7846391f9acaf4e948a9a6b21b  Data-OptList-0.112.tar.gz
-sha256  62c60ccaae88d5339ae36bcc8940b03388cf84adbf27828b1f8b300307103bab  Data-OptList-0.112.tar.gz
+md5  cda08370c4058ba56e40c2f21d94d233  Data-OptList-0.113.tar.gz
+sha256  36aebc5817b7d4686b649434c2ee41f45c8bf97d4ca5a99f607cc40f695a4285  Data-OptList-0.113.tar.gz
 
 # computed by scancpan
 sha256  712f3e40537810ba3046533fd71d877f69ab446d5e8e8a1135771804494b8b42  LICENSE
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
index 8e089245f6..1a9aa05cc9 100644
--- a/package/perl-data-optlist/perl-data-optlist.mk
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATA_OPTLIST_VERSION = 0.112
+PERL_DATA_OPTLIST_VERSION = 0.113
 PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
 PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
