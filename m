Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CC3C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 08:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4261C81F38;
	Wed, 10 Jul 2024 08:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1rfEZe8G9in; Wed, 10 Jul 2024 08:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6291C81F40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6291C81F40;
	Wed, 10 Jul 2024 08:31:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A95F1BF5AD
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37E2860F9E
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5SSXASPVIbR for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 08:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A08C60F9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A08C60F9C
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 08:31:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06F48845FD; Wed, 10 Jul 2024 08:31:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 10:30:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3466c4bcad59911a099bd1322773f244359f533c
X-Git-Newrev: 1e24c913a109b2a1055bc01ac5523c577629af11
X-Patchwork-Hint: ignore
Message-Id: <20240710083117.06F48845FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: bump version to 6.0.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e24c913a109b2a1055bc01ac5523c577629af11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index dd587a8220..4072338885 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.0/
-md5  10246eb96bbf3a151d6eb9bbcc223e4e  gnuplot-6.0.0.tar.gz
-sha1  3abea0cccad89b0c8fb6619ad51b83a971ee24b9  gnuplot-6.0.0.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.1/
+md5  744fde2362fb20db6cfc58de73f96e9c  gnuplot-6.0.1.tar.gz
+sha1  ce1aaeff632c78cba2b3ca8142cf130bfd411478  gnuplot-6.0.1.tar.gz
 # Locally computed
-sha256  635a28f0993f6ab0d1179e072ad39b8139d07f51237f841d93c6c2ff4b1758ec  gnuplot-6.0.0.tar.gz
+sha256  e85a660c1a2a1808ff24f7e69981ffcbac66a45c9dcf711b65610b26ea71379a  gnuplot-6.0.1.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index e34dd2a60b..adb9ce6ad1 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 6.0.0
+GNUPLOT_VERSION = 6.0.1
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
