Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A7ACCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 11:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58EF561077;
	Sun, 12 Oct 2025 11:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOUH-AH9yYmr; Sun, 12 Oct 2025 11:37:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E5A160AD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E5A160AD2;
	Sun, 12 Oct 2025 11:37:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFC692A8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 11:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E45A80F21
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 11:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maE2F4Rls6nk for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 11:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD41E80E95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD41E80E95
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 11:37:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9D46870C7; Sun, 12 Oct 2025 11:37:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 12:57:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c8a0065955eab8fe9bf0a88c1955bb79724f2f3
X-Git-Newrev: 2adac697ff59697195497baa958ec54cb78f5c05
X-Patchwork-Hint: ignore
Message-Id: <20251012113735.B9D46870C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: bump version to 1.33.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2adac697ff59697195497baa958ec54cb78f5c05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.mpg123.org/cgi-bin/news.cgi

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 67ece34528..2fc0061476 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.32.8/
-sha1  dc4d8d9d7fdc9c6c85e3036734eb937272a97800  mpg123-1.32.8.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.3/
+sha1  41dd15e29668a8e1372d31f327c8962a8ef6b595  mpg123-1.33.3.tar.bz2
 # Locally calculated
-sha256  feee1374c79540e0e405df0bc45fde20ad67011425c361a2759e2146894a27a7  mpg123-1.32.8.tar.bz2
+sha256  6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26  mpg123-1.33.3.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 2020fa55e8..5e55d33b72 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.32.8
+MPG123_VERSION = 1.33.3
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
