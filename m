Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39616C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E340A83FC3;
	Thu,  6 Oct 2022 19:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E340A83FC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7iw-qTxaQBz; Thu,  6 Oct 2022 19:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16AE783FBB;
	Thu,  6 Oct 2022 19:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16AE783FBB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 105B71BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97C62610CF
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C62610CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAJub4qhFutK for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:04:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44B8660F6F
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44B8660F6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B1CE869EC; Thu,  6 Oct 2022 19:04:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 20:47:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b77c2170d052e0b66ea132365c4c6747ca1cf7a
X-Git-Newrev: 164bf2158ed97f09d932ae847ca3c7c25cf0f6d2
X-Patchwork-Hint: ignore
Message-Id: <20221006190452.2B1CE869EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: bump version to 5.4.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=164bf2158ed97f09d932ae847ca3c7c25cf0f6d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 3b6412091a..1ee6b53694 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.4/
-md5  209c6da8693fa15ae1527c832075ef0f  gnuplot-5.4.4.tar.gz
-sha1  3305bb255d379eaf0b5181a01cb71119cf89c110  gnuplot-5.4.4.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.5/
+md5  c10cf81faa69d77e255a1dcfc625ba78  gnuplot-5.4.5.tar.gz
+sha1  1179a768fd5f585a5dcb6aedea76cfa7a8dd5dfe  gnuplot-5.4.5.tar.gz
 # Locally computed
-sha256  372300b7867f5b3538b25fc5d0ac7734af6e3fe0d202b6db926e4369913f0902  gnuplot-5.4.4.tar.gz
+sha256  66f679115dd30559e110498fc94d926949d4d370b4999a042e724b8e910ee478  gnuplot-5.4.5.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 18c13d5371..1ee49cb6ce 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.4
+GNUPLOT_VERSION = 5.4.5
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
