Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E0EC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1C234171A;
	Thu, 17 Jul 2025 20:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hr5I-64mZpyc; Thu, 17 Jul 2025 20:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18205417D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18205417D1;
	Thu, 17 Jul 2025 20:33:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 117C9A59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 390F460787
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtA0sHikVbRV for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE95E60887
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE95E60887
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC8C18667E; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 13:17:37 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 9e870099fa49f22471ff9e31de6658748be838f2
X-Git-Newrev: fbb1c478bbbf812b2ab809e07f1c7d6a680c65a5
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.AC8C18667E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/gnuplot: bump
 version to 6.0.3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fbb1c478bbbf812b2ab809e07f1c7d6a680c65a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

For release note, see:
http://www.gnuplot.info/ReleaseNotes_6_0_3.html

SHA256 hash now from:
https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/gnuplot-6.0.3.tar.gz.sha256

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7443e881f8ac86f7c7cbf38c595dbb26f2f66afe)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
