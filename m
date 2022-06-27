Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E57C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98DBA41581;
	Mon, 27 Jun 2022 22:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98DBA41581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TnESN1fiE-0L; Mon, 27 Jun 2022 22:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2834041511;
	Mon, 27 Jun 2022 22:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2834041511
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 931E61BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A4F482451
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A4F482451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnXYRu7SY88m for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:46:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5204C81C38
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5204C81C38
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D4A558770C; Mon, 27 Jun 2022 22:34:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:46:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1fe952835ba0113f0f6f4f54686e29d6e1fc73b
X-Git-Newrev: c099842544248b10f4284a5d47084db8f476fcda
X-Patchwork-Hint: ignore
Message-Id: <20220627223409.D4A558770C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.11.8
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
Content-Type: multipart/mixed; boundary="===============5012572713451347557=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5012572713451347557==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c099842544248b10f4284a5d47084db8f476fcda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is stable bugfix release of libmdbx.
The project's website now is on https://libmdbx.dqdkfa.ru/

Release notes for v0.11.8 https://gitflic.ru/project/erthink/libmdbx/release/06268038-39ff-4270-9be8-9f26d5543015

The complete ChangeLog: https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/Config.in    | 2 +-
 package/libmdbx/libmdbx.hash | 3 ++-
 package/libmdbx/libmdbx.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libmdbx/Config.in b/package/libmdbx/Config.in
index 4849d60b92..a9a4ac45c5 100644
--- a/package/libmdbx/Config.in
+++ b/package/libmdbx/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LIBMDBX
 	  libmdbx surpasses the legendary LMDB in terms of
 	  reliability, features and performance.
 
-	  https://libmdbx.website.yandexcloud.net/
+	  https://libmdbx.dqdkfa.ru
 
 if BR2_PACKAGE_LIBMDBX
 
diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 7d663b3da0..3f2be134c3 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,4 +1,5 @@
-# Hashes from: https://libmdbx.website.yandexcloud.net/release/SHA256SUMS
+# Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
+sha256  06011f361481ee7adc2111e48b7b121384294e0b6b8f10c75e7886629297b279  libmdbx-amalgamated-0.11.8.tar.xz
 sha256  3a9fb6a4cd941e646597235518714373fda1ca6d4c5e23669afe70ea87c20940  libmdbx-amalgamated-0.11.7.tar.xz
 
 # Locally calculated
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index a7056b2850..130fe96793 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.11.7
+LIBMDBX_VERSION = 0.11.8
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
-LIBMDBX_SITE = https://libmdbx.website.yandexcloud.net/release
+LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBMDBX_LICENSE = OLDAP-2.8
 LIBMDBX_LICENSE_FILES = LICENSE

--===============5012572713451347557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5012572713451347557==--
