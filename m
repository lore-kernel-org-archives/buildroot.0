Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B81C47DA9
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA9B760A79;
	Sat, 27 Jan 2024 20:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA9B760A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jP1jZxhW4i_N; Sat, 27 Jan 2024 20:56:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4751060A81;
	Sat, 27 Jan 2024 20:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4751060A81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4D81BF865
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6E3F402F4
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6E3F402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCFyK-WS90O9 for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3515400D0
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3515400D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD985866A5; Sat, 27 Jan 2024 20:56:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 21:47:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4c09a8fd2fa4e5f341d8bb0df993bb7474088bf
X-Git-Newrev: 43a520ff42ef80468cf47c94d761a9c26b9bd531
X-Patchwork-Hint: ignore
Message-Id: <20240127205629.AD985866A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-cookie-baker: bump to version
 0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=43a520ff42ef80468cf47c94d761a9c26b9bd531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-cookie-baker/perl-cookie-baker.hash | 6 +++---
 package/perl-cookie-baker/perl-cookie-baker.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-cookie-baker/perl-cookie-baker.hash b/package/perl-cookie-baker/perl-cookie-baker.hash
index cc2a84b146..34bb4b143c 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.hash
+++ b/package/perl-cookie-baker/perl-cookie-baker.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  bc8f95893d6ec3093a62d1957e1908f2  Cookie-Baker-0.11.tar.gz
-sha256  59275f474e07c0aa3611e3e684b894e7db913333d8214420be63f12ec18cd7ab  Cookie-Baker-0.11.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  7ab63698d2f24a8cfe31a7ea270e9d2d  Cookie-Baker-0.12.tar.gz
+sha256  9b04df5d47dcd45ac4299626a10ec990fb40c94ee5a6300c3a88bdfb3575ec29  Cookie-Baker-0.12.tar.gz
 
 # computed by scancpan
 sha256  b4ce94671fa219074d4e91e2268652d6bf9764cebcc7a5e27bfc14897745ca4c  LICENSE
diff --git a/package/perl-cookie-baker/perl-cookie-baker.mk b/package/perl-cookie-baker/perl-cookie-baker.mk
index 27c88f3e57..add5fcd0ed 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.mk
+++ b/package/perl-cookie-baker/perl-cookie-baker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_COOKIE_BAKER_VERSION = 0.11
+PERL_COOKIE_BAKER_VERSION = 0.12
 PERL_COOKIE_BAKER_SOURCE = Cookie-Baker-$(PERL_COOKIE_BAKER_VERSION).tar.gz
 PERL_COOKIE_BAKER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_COOKIE_BAKER_DEPENDENCIES = host-perl-module-build-tiny
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
