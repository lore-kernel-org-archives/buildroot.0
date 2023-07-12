Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697A4EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B005041EA3;
	Wed, 12 Jul 2023 19:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B005041EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgC-TjNw5lSh; Wed, 12 Jul 2023 19:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB93D41EAD;
	Wed, 12 Jul 2023 19:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB93D41EAD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2BA11BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC1144012B
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC1144012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3CnoHd76a9Z for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:27:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA479403A5
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA479403A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C641686ED0; Wed, 12 Jul 2023 19:27:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:27:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08eb63dfdf45885830a0bcedf94c4e1d40231a25
X-Git-Newrev: 13cdadb317c8b489b3dfd6c75aa0018f033c29bf
X-Patchwork-Hint: ignore
Message-Id: <20230712192744.C641686ED0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-data-optlist: bump to version
 0.114
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

commit: https://git.buildroot.net/buildroot/commit/?id=13cdadb317c8b489b3dfd6c75aa0018f033c29bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-data-optlist/perl-data-optlist.hash | 6 +++---
 package/perl-data-optlist/perl-data-optlist.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-data-optlist/perl-data-optlist.hash b/package/perl-data-optlist/perl-data-optlist.hash
index ccc05ae4d6..6d55d6388d 100644
--- a/package/perl-data-optlist/perl-data-optlist.hash
+++ b/package/perl-data-optlist/perl-data-optlist.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  cda08370c4058ba56e40c2f21d94d233  Data-OptList-0.113.tar.gz
-sha256  36aebc5817b7d4686b649434c2ee41f45c8bf97d4ca5a99f607cc40f695a4285  Data-OptList-0.113.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  d63ec5d446eff1aaa5ba92bc13a52b77  Data-OptList-0.114.tar.gz
+sha256  9fd1093b917a21fb79ae1607db53d113b4e0ad8fe0ae776cb077a7e50044fdf3  Data-OptList-0.114.tar.gz
 
 # computed by scancpan
 sha256  712f3e40537810ba3046533fd71d877f69ab446d5e8e8a1135771804494b8b42  LICENSE
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
index 1a9aa05cc9..8c22cfe788 100644
--- a/package/perl-data-optlist/perl-data-optlist.mk
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATA_OPTLIST_VERSION = 0.113
+PERL_DATA_OPTLIST_VERSION = 0.114
 PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
 PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
