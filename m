Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BACEC19F2C
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B442E610E3;
	Wed,  3 Aug 2022 16:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B442E610E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTsemXMgO1tG; Wed,  3 Aug 2022 16:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87B9610C7;
	Wed,  3 Aug 2022 16:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87B9610C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C732C1BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2D3F82896
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2D3F82896
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEfE7htOjR9X for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:17:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9DF382893
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9DF382893
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6B1B786D4B; Wed,  3 Aug 2022 16:03:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 10:53:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d795dc7bfd74315874b61a98ed588c63892116b
X-Git-Newrev: 7d743ccb070d00849bfe35a97211c705440d5e96
X-Patchwork-Hint: ignore
Message-Id: <20220803160350.6B1B786D4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: bump version to 5.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d743ccb070d00849bfe35a97211c705440d5e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 1cc14973d1..3b6412091a 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.2/
-md5  9bb03cfa77e38924e08ffbb9eb59d8b1  gnuplot-5.4.3.tar.gz
-sha1  c4b60fd7a700b22fa62b14829cbb0e17911627c9  gnuplot-5.4.3.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.4/
+md5  209c6da8693fa15ae1527c832075ef0f  gnuplot-5.4.4.tar.gz
+sha1  3305bb255d379eaf0b5181a01cb71119cf89c110  gnuplot-5.4.4.tar.gz
 # Locally computed
-sha256  51f89bbab90f96d3543f95235368d188eb1e26eda296912256abcd3535bd4d84  gnuplot-5.4.3.tar.gz
+sha256  372300b7867f5b3538b25fc5d0ac7734af6e3fe0d202b6db926e4369913f0902  gnuplot-5.4.4.tar.gz
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 6cf36a0997..18c13d5371 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 5.4.3
+GNUPLOT_VERSION = 5.4.4
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
