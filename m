Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53633EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 12:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0037E41624;
	Sun, 18 Jun 2023 12:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0037E41624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOo7iFJbiqrv; Sun, 18 Jun 2023 12:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A868241505;
	Sun, 18 Jun 2023 12:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A868241505
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B32D1BF5A8
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BE94414C5
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BE94414C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yr4K0QqPH7hh for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 12:48:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0316E4141D
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 12:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0316E4141D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4B5F83C24; Sun, 18 Jun 2023 12:48:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 14:46:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2043ee1ab3f1177a7a0024693209253adc96f549
X-Git-Newrev: f8af24707b196eb64121d29a829fc31b5506409c
X-Patchwork-Hint: ignore
Message-Id: <20230618124832.E4B5F83C24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: bump version to 1.31.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8af24707b196eb64121d29a829fc31b5506409c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed md5 hash, switched _SITE to https.

Updated license hash due to copyright year bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash | 9 ++++-----
 package/mpg123/mpg123.mk   | 4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index e5fb09b46a..39ded93fb9 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,7 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.15/
-sha1  286fcb83afad3ecbfea60434d3ee1b6d7f41bb7c  mpg123-1.25.15.tar.bz2
-md5  9a050d4b3573661c606f8095a3f34ca3  mpg123-1.25.15.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.31.3/
+sha1  c41b98e4c5ac55a5b3787b5aa309a71a6d458145  mpg123-1.31.3.tar.bz2
 # Locally calculated
-sha256  503a76d82d97f1a6513bbeb284e460a99fb17ef80f23a661d8fc026ce6adcbbc  mpg123-1.25.15.tar.bz2
+sha256  1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a  mpg123-1.31.3.tar.bz2
 # License file
-sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
+sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index fbb011c2c2..64c8e0d8e5 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.25.15
+MPG123_VERSION = 1.31.3
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
-MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
+MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPL-2.1
 MPG123_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
