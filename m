Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205C9C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 16:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC345400F3;
	Fri, 26 Jan 2024 16:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC345400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLWtclUaqDGy; Fri, 26 Jan 2024 16:12:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173B440033;
	Fri, 26 Jan 2024 16:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 173B440033
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 609CC1BF990
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B6D4039D
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37B6D4039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjqrZHjNiDce for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 16:12:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23403401D2
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23403401D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CF2086581; Fri, 26 Jan 2024 16:12:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 17:05:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 219178ef3eed5b3f4a5da0fe4af751e79d77e432
X-Git-Newrev: d433f06371f58c6a8705697b7cdf317518c984c5
X-Patchwork-Hint: ignore
Message-Id: <20240126161218.0CF2086581@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libksba: bump to version 1.6.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=d433f06371f58c6a8705697b7cdf317518c984c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 08b599dc0f..3ac36e19ca 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  258c31c72adda2ef547d94038b7e0fd7bd93d03c  libksba-1.6.4.tar.bz2
-sha256  bbb43f032b9164d86c781ffe42213a83bf4f2fee91455edfa4654521b8b03b6b  libksba-1.6.4.tar.bz2
+sha1  0ada15ac00baa7df677a05bcb517621708f9c2f2  libksba-1.6.5.tar.bz2
+sha256  a564628c574c99287998753f98d750babd91a4e9db451f46ad140466ef2a6d16  libksba-1.6.5.tar.bz2
 
 # Hash for license files:
 sha256  f9c59ea5a5e1dfdeebcd134e6a594c21eb088cc95f6653ee99ff2e187c105380  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index fdc4bb034e..52ad5fbeec 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.4
+LIBKSBA_VERSION = 1.6.5
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
