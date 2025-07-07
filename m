Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F506C83030
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 20:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4CBB84080;
	Mon,  7 Jul 2025 20:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlOUvuqiH2H9; Mon,  7 Jul 2025 20:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F6284077
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F6284077;
	Mon,  7 Jul 2025 20:27:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09A9E1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E338F41917
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hi28sVq-3Skq for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 20:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E6741814
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33E6741814
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:27:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1011186160; Mon,  7 Jul 2025 20:27:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Jul 2025 22:21:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d23852980d2ce92804de2c4fced38317fba6952
X-Git-Newrev: 7443e881f8ac86f7c7cbf38c595dbb26f2f66afe
X-Patchwork-Hint: ignore
Message-Id: <20250707202725.1011186160@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: bump version to 6.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7443e881f8ac86f7c7cbf38c595dbb26f2f66afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
http://www.gnuplot.info/ReleaseNotes_6_0_3.html

SHA256 hash now from:
https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/gnuplot-6.0.3.tar.gz.sha256

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 980fe6858d..bac1cb9d2d 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.2/
-md5  ea0931758fc180e3b1950931b9869921  gnuplot-6.0.2.tar.gz
-sha1  be803916e4ea32720b4a646f2ffc98d6ad3a0dc2  gnuplot-6.0.2.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/
+md5  c897ca69062010e2cf5f7483e39e5acc  gnuplot-6.0.3.tar.gz
+sha1  b31779d6760f432f57136600fc0c2bf65f4d4013  gnuplot-6.0.3.tar.gz
+sha256  ec52e3af8c4083d4538152b3f13db47f6d29929a3f6ecec5365c834e77f251ab  gnuplot-6.0.3.tar.gz
 # Locally computed
-sha256  f68a3b0bbb7bbbb437649674106d94522c00bf2f285cce0c19c3180b1ee7e738  gnuplot-6.0.2.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index b363e761ef..2a1072a55c 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 6.0.2
+GNUPLOT_VERSION = 6.0.3
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
