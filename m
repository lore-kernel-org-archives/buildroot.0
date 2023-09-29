Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ADFCE7AF3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B35C160A91;
	Fri, 29 Sep 2023 20:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B35C160A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sz_kak76cesg; Fri, 29 Sep 2023 20:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD7261637;
	Fri, 29 Sep 2023 20:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FD7261637
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC95B1BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 978E240BFB
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 978E240BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAR6awDwuX3n for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B14240AB7
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B14240AB7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03B9C83705; Fri, 29 Sep 2023 20:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:21:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1de978fc29fd3a4bfc23ae33fa286e19a5cdafe
X-Git-Newrev: 03bdb1e1b2e25ee979a97f6ca3f918f107a03615
X-Patchwork-Hint: ignore
Message-Id: <20230929202828.03B9C83705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-json-maybexs: bump to version
 1.004005
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

commit: https://git.buildroot.net/buildroot/commit/?id=03bdb1e1b2e25ee979a97f6ca3f918f107a03615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/ETHER/JSON-MaybeXS-1.004005/diff/ETHER/JSON-MaybeXS-1.004003#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-json-maybexs/perl-json-maybexs.hash | 8 ++++----
 package/perl-json-maybexs/perl-json-maybexs.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-json-maybexs/perl-json-maybexs.hash b/package/perl-json-maybexs/perl-json-maybexs.hash
index a53d4ec616..3b603310f6 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.hash
+++ b/package/perl-json-maybexs/perl-json-maybexs.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  e46181e34588428d317932744597a7ab  JSON-MaybeXS-1.004003.tar.gz
-sha256  5bee3b17ff9dcffd6e99ab8cf7f35747650bfce1dc622e3ad10b85a194462fbf  JSON-MaybeXS-1.004003.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  bee9d0cba3f87e05e9613684e4ee2159  JSON-MaybeXS-1.004005.tar.gz
+sha256  f5b6bc19f579e66b7299f8748b8ac3e171936dc4e7fcb72a8a257a9bd482a331  JSON-MaybeXS-1.004005.tar.gz
 
 # computed by scancpan
-sha256  0f2d6b537f7a735c981511875d832bc8ff767bf97d62848cf0bada964e40aadd  LICENSE
+sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
diff --git a/package/perl-json-maybexs/perl-json-maybexs.mk b/package/perl-json-maybexs/perl-json-maybexs.mk
index e6891f6808..13c9439ea6 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.mk
+++ b/package/perl-json-maybexs/perl-json-maybexs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_JSON_MAYBEXS_VERSION = 1.004003
+PERL_JSON_MAYBEXS_VERSION = 1.004005
 PERL_JSON_MAYBEXS_SOURCE = JSON-MaybeXS-$(PERL_JSON_MAYBEXS_VERSION).tar.gz
 PERL_JSON_MAYBEXS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_JSON_MAYBEXS_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
