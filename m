Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EC8C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02DAA40B7B;
	Tue, 14 Jun 2022 18:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2uM7WiIUPqy; Tue, 14 Jun 2022 18:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F16BE40B6A;
	Tue, 14 Jun 2022 18:51:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27AB41BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEE8D40893
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GA-x7Msew64f for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0115741798
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F355E870DF; Tue, 14 Jun 2022 18:36:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:33:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dc8563363d639255217ffc59482eaccf93a1b51
X-Git-Newrev: 69015ce94ac3ffe7f349ec37868eea0d0ffec90e
X-Patchwork-Hint: ignore
Message-Id: <20220614183634.F355E870DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gptfdisk: bump version to 1.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=69015ce94ac3ffe7f349ec37868eea0d0ffec90e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gptfdisk/gptfdisk.hash | 6 +++---
 package/gptfdisk/gptfdisk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index caded358ec..0b98677afb 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.8/
-sha1  c8824e779056158fa32887e415f5399a8646c3c5  gptfdisk-1.0.8.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.9/
+sha1  284bd000edaf7874b472bd01719c6a71a8030e13  gptfdisk-1.0.9.tar.gz
 # Locally computed
-sha256  95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df  gptfdisk-1.0.8.tar.gz
+sha256  dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2  gptfdisk-1.0.9.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 9869975f51..0df9cda08f 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.8
+GPTFDISK_VERSION = 1.0.9
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
