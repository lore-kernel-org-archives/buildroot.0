Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E898C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 10:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B3CC409FF;
	Sun, 13 Jul 2025 10:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y83bM4YCz7VW; Sun, 13 Jul 2025 10:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26A48409C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A48409C8;
	Sun, 13 Jul 2025 10:43:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 048BF5E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE98B409BF
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g14ojGAdwhdW for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 10:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEA47409C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEA47409C8
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:43:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA6BF8642B; Sun, 13 Jul 2025 10:43:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Jul 2025 12:39:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb1a5689459a6f6fead0c0cfec0052cafa77d2c3
X-Git-Newrev: 565ee4a9173693398800dcc3ee55cf41737c8649
X-Patchwork-Hint: ignore
Message-Id: <20250713104352.DA6BF8642B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.30
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=565ee4a9173693398800dcc3ee55cf41737c8649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v0.3.29, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.30

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 6b123b5c58..965d7458ba 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.29
-md5  853a0c5c0747c5943e7ef4bbb793162d  openblas-0.3.29.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.30
+md5  8db3d57f4d4485c6ae3f21ea465660e7  openblas-0.3.30.tar.gz
 # Locally calculated
-sha256  38240eee1b29e2bde47ebb5d61160207dc68668a54cac62c076bb5032013b1eb  openblas-0.3.29.tar.gz
+sha256  27342cff518646afb4c2b976d809102e368957974c250a25ccc965e53063c95d  openblas-0.3.30.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 069636f5f0..edab26493d 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.29
+OPENBLAS_VERSION = 0.3.30
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
