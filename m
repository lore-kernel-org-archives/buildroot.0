Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4935AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9DD44029F;
	Wed, 19 Jan 2022 21:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8P-5Qi4uQ5D; Wed, 19 Jan 2022 21:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCEE14021C;
	Wed, 19 Jan 2022 21:47:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 309351BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E9D581778
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXwTI7TE7NRS for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:47:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A5C816F5
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:47:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A86F48351F; Wed, 19 Jan 2022 21:41:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 22:46:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6775e3e47689088589e0a2448b4033a1bd2853e5
X-Git-Newrev: 3a4300e8261f352f9e4af5e569fd55ad944843f7
X-Patchwork-Hint: ignore
Message-Id: <20220119214115.A86F48351F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: bump version to 5.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a4300e8261f352f9e4af5e569fd55ad944843f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gnuplot/gnuplot.hash | 6 +++---
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index fc166205d0..1cc14973d1 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.2/
-md5  2050ca477199a591543bc968aba7d899  gnuplot-5.4.2.tar.gz
-sha1  2e076b29f38bfcb841cb5eb3377fd1a469ced1ac  gnuplot-5.4.2.tar.gz
+md5  9bb03cfa77e38924e08ffbb9eb59d8b1  gnuplot-5.4.3.tar.gz
+sha1  c4b60fd7a700b22fa62b14829cbb0e17911627c9  gnuplot-5.4.3.tar.gz
 # Locally computed
-sha256  e57c75e1318133951d32a83bcdc4aff17fed28722c4e71f2305cfc2ae1cae7ba  gnuplot-5.4.2.tar.gz
+sha256  51f89bbab90f96d3543f95235368d188eb1e26eda296912256abcd3535bd4d84  gnuplot-5.4.3.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 436d3e5f92..6cf36a0997 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.2
+GNUPLOT_VERSION = 5.4.3
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
