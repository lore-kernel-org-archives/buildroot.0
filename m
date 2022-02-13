Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A8AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44A1A40477;
	Sun, 13 Feb 2022 11:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtvAPuHuI_aK; Sun, 13 Feb 2022 11:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D3794046A;
	Sun, 13 Feb 2022 11:14:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 674ED1BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54D0340360
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jg8_B-tvEsE7 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F0464033F
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 725EA82817; Sun, 13 Feb 2022 11:06:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:12:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26157321240adb9f5cc2802183d3955a877b9487
X-Git-Newrev: 4c2e26681724085106df18b382f591b47fe43141
X-Patchwork-Hint: ignore
Message-Id: <20220213110615.725EA82817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fatcat: bump to version 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c2e26681724085106df18b382f591b47fe43141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/Gregwar/fatcat/compare/v1.1.0...v1.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fatcat/fatcat.hash | 4 ++--
 package/fatcat/fatcat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fatcat/fatcat.hash b/package/fatcat/fatcat.hash
index 66823e2d9e..56f89edd50 100644
--- a/package/fatcat/fatcat.hash
+++ b/package/fatcat/fatcat.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 303efe2aa73cbfe6fbc5d8af346d0f2c70b3f996fc891e8859213a58b95ad88c  fatcat-1.1.0.tar.gz
-sha256 3ea03755e32cf7f5b12981de92a0fdad396448195fe0024990c9cbc388e9866c  LICENSE
+sha256  5574f715f62a9feda7fffc8099f8bca7134ff4f1274bb1bc0db96a2969eea206  fatcat-1.1.1.tar.gz
+sha256  3ea03755e32cf7f5b12981de92a0fdad396448195fe0024990c9cbc388e9866c  LICENSE
diff --git a/package/fatcat/fatcat.mk b/package/fatcat/fatcat.mk
index 1a2e5aacae..0dff53fa65 100644
--- a/package/fatcat/fatcat.mk
+++ b/package/fatcat/fatcat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FATCAT_VERSION = 1.1.0
+FATCAT_VERSION = 1.1.1
 FATCAT_SITE = $(call github,Gregwar,fatcat,v$(FATCAT_VERSION))
 FATCAT_LICENSE = MIT
 FATCAT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
