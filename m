Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03EDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 14:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 768788349A;
	Sat, 22 Jan 2022 14:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1lOcd-an-0F; Sat, 22 Jan 2022 14:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B745B831B0;
	Sat, 22 Jan 2022 14:39:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6F811BF390
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE8A4831B0
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aj5XaUFQaX14 for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 14:39:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00F5782909
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0CF1C828C8; Sat, 22 Jan 2022 14:32:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 15:39:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 937a70001f4d8ebd39050af64deff759f8de4385
X-Git-Newrev: 829bf508bba7df9aee3f86bcd70394ee487b19a6
X-Patchwork-Hint: ignore
Message-Id: <20220122143253.0CF1C828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump to version
 2.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=829bf508bba7df9aee3f86bcd70394ee487b19a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-45960, CVE-2021-46143 and CVE-2022-22822 to CVE-2022-22827

https://blog.hartwork.org/posts/expat-2-4-3-released
https://github.com/libexpat/libexpat/blob/R_2_4_3/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 8cf563d8f5..0853c3c76d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.1/
-md5  a4fb91a9441bcaec576d4c4a56fa3aa6  expat-2.4.1.tar.xz
-sha1  7988e4df355162500f09837aa95cbb48e6754420  expat-2.4.1.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.3/
+md5  b1137f030590b3f0c41c69c6cd68fa90  expat-2.4.3.tar.xz
+sha1  cfaacc4f929b34cfbde2b8f33b74ec84c0cbb329  expat-2.4.3.tar.xz
 
 # Locally calculated
-sha256  cf032d0dba9b928636548e32b327a2d66b1aab63c4f4a13dd132c2d1d2f2fb6a  expat-2.4.1.tar.xz
+sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.3.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index bb1cfd8c8a..a7ace66095 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.1
+EXPAT_VERSION = 2.4.3
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
