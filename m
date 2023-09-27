Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CFDE82CC6
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3AE642C67;
	Wed, 27 Sep 2023 19:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3AE642C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yOEF0UfC76c; Wed, 27 Sep 2023 19:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9C1442C62;
	Wed, 27 Sep 2023 19:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C1442C62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 507951BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96DFB610B0
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96DFB610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFzSFpp6xDbf for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 858A861145
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 858A861145
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7108282640; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:01:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da8bd82e3b0cdba0d3cbf73a85913a9b567c840e
X-Git-Newrev: 6dc3d3c36063b4ef7a76badc0db2a60786eafee9
X-Patchwork-Hint: ignore
Message-Id: <20230927190533.7108282640@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: bump version to 5.4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dc3d3c36063b4ef7a76badc0db2a60786eafee9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
http://www.gnuplot.info/ReleaseNotes_5_4_9.html

Signed-off-by: Michael Fischer <mf@go-sys.de>
[Peter: use --without-qt for consistency]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 2f482ca434..6ed24b6d3c 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.7/
-md5  cdc9bb3ac0cc7e717246ed3df2d6ffa2  gnuplot-5.4.7.tar.gz
-sha1  6e68f94af822ff56549beab3a465c2fe976d3b34  gnuplot-5.4.7.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.9/
+md5  345533e461e41c263b3293f46651f0b2  gnuplot-5.4.9.tar.gz
+sha1  1a3953660656a38178ae2b368efa895af55a5001  gnuplot-5.4.9.tar.gz
 # Locally computed
-sha256  318a1501c9e659f39cf05ee5268335671bddc6c20eae06851f262fde27c2e739  gnuplot-5.4.7.tar.gz
+sha256  a328a021f53dc05459be6066020e9a71e8eab6255d3381e22696120d465c6a97  gnuplot-5.4.9.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 23fbae10a9..b98da4267a 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.7
+GNUPLOT_VERSION = 5.4.9
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
@@ -23,7 +23,8 @@ GNUPLOT_CONF_OPTS = \
 	--disable-wxwidgets \
 	--without-lua \
 	--without-latex \
-	--without-cairo
+	--without-cairo \
+	--without-qt
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
