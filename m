Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D7CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA08402D0;
	Fri, 21 Jan 2022 21:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vEgqtCu7uCb; Fri, 21 Jan 2022 21:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 782C54019D;
	Fri, 21 Jan 2022 21:27:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 408F71BF30C
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D4BB60F6E
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgsNvX_VeDS3 for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 21:26:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4F6860FD4
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 21:26:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A1EC58359C; Fri, 21 Jan 2022 21:19:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 22:23:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d3a26867b4c28d66314416b4b515a9686f9c2d3
X-Git-Newrev: 970f1b0df0e47979f0c6284dd5c40ff1d477b506
X-Patchwork-Hint: ignore
Message-Id: <20220121211938.A1EC58359C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-uri: bump to version 5.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=970f1b0df0e47979f0c6284dd5c40ff1d477b506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-uri/perl-uri.hash | 6 +++---
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 578beed9bf..e7e272c63a 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  bd66b0c620d076c4b0de9507b5f1fbdf  URI-5.09.tar.gz
-sha256  03e63ada499d2645c435a57551f041f3943970492baa3b3338246dab6f1fae0a  URI-5.09.tar.gz
+md5  2a00d3dbf891df4256d251382aefd9b9  URI-5.10.tar.gz
+sha256  16325d5e308c7b7ab623d1bf944e1354c5f2245afcfadb8eed1e2cae9a0bd0b5  URI-5.10.tar.gz
 
 # computed by scancpan
-sha256  65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e  LICENSE
+sha256  d4f0b7a8771dcb1eee79a38c2e466eb997e23565a6687dd1900a2027eabe12a0  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index d588e82056..d451bc5d6a 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.09
+PERL_URI_VERSION = 5.10
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
