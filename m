Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538B9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 22:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D700D40BB1;
	Thu, 10 Mar 2022 22:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdgpXc7SEdiT; Thu, 10 Mar 2022 22:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D8B740BB0;
	Thu, 10 Mar 2022 22:35:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E82F81BF34D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D504A408FB
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQJYO8QnOlF6 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 22:35:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F9B5408F8
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 22:35:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C91AF83C72; Thu, 10 Mar 2022 22:27:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 23:35:47 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f1db1922e460d4f5862be16ef2b3f0c84c3201ce
X-Git-Newrev: 19214951bb25f215e26d3065204f3faf7527c0d1
X-Patchwork-Hint: ignore
Message-Id: <20220310222720.C91AF83C72@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/expat: bump to
 version 2.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=19214951bb25f215e26d3065204f3faf7527c0d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This release fixes a regression introduced by one of the security fixes
in 2.4.5.

https://blog.hartwork.org/posts/expat-2-4-6-released
https://github.com/libexpat/libexpat/blob/R_2_4_6/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 46390b3a7c47420b7523b8f18276f3ccd49940c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index cd2e8c7fb9..0d9f60931f 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.5/
-md5  9dc183e6c1eebc1b658c1e71be0885e1  expat-2.4.5.tar.xz
-sha1  360a49b55c442e91cb7b328bc0335083909ddf4f  expat-2.4.5.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.6/
+md5  22a30c888752fdda9f8dd1b7281c54b0  expat-2.4.6.tar.xz
+sha1  26e223c4795c242814b0e3299a5027c22b9dc733  expat-2.4.6.tar.xz
 
 # Locally calculated
-sha256  f2af8fc7cdc63a87920da38cd6d12cb113c3c3a3f437495b1b6541e0cff32579  expat-2.4.5.tar.xz
+sha256  de55794b7a9bc214852fdc075beaaecd854efe1361597e6268ee87946951289b  expat-2.4.6.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 7815d61027..c481b5c225 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.5
+EXPAT_VERSION = 2.4.6
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
