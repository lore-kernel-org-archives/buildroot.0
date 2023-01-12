Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09097C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30E87018F;
	Tue, 21 Feb 2023 02:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B30E87018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwH5Hv8NkTgl; Tue, 21 Feb 2023 02:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3E86701C6;
	Tue, 21 Feb 2023 02:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3E86701C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 961121BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE0F46FB5E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE0F46FB5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXvW0-laVeBy for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D78B56FB24
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D78B56FB24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5FF1828C8; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:10:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6e69d76aae479ab2d5f15baa79f25fd480e12eab
X-Git-Newrev: 79e8aad721099eb05e60b449432136691275022f
X-Patchwork-Hint: ignore
Message-Id: <20230220205229.D5FF1828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perl-http-message:
 bump version to 6.44
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

commit: https://git.buildroot.net/buildroot/commit/?id=79e8aad721099eb05e60b449432136691275022f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 0e05da644e..94b5c06a4f 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  17ca8ec3be118d50c5299b232f3109d7  HTTP-Message-6.37.tar.gz
-sha256  0e59da0a85e248831327ebfba66796314cb69f1bfeeff7a9da44ad766d07d802  HTTP-Message-6.37.tar.gz
+md5  926a077669a7828c5ca39b5cf7735625  HTTP-Message-6.44.tar.gz
+sha256  398b647bf45aa972f432ec0111f6617742ba32fc773c6612d21f64ab4eacbca1  HTTP-Message-6.44.tar.gz
 
 # computed by scancpan
 sha256  f2f428b5f8a3bf4e6a71cd5ea92558a3d123d3d7c5075d34923e71e46dea94df  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 79402c3298..67b68b0de2 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.37
+PERL_HTTP_MESSAGE_VERSION = 6.44
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
