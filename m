Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22242C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7FA560A4F;
	Sat,  8 Jan 2022 22:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qm_9Pm42mYi1; Sat,  8 Jan 2022 22:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A30B60AB5;
	Sat,  8 Jan 2022 22:02:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC021BF977
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76B6A81426
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdQT9sOvby8h for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:01:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C694A81424
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:01:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A8C3282626; Sat,  8 Jan 2022 21:55:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:01:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 590d89fdad50f48c120b91ac008cc2ea4b625e15
X-Git-Newrev: a6fc1b09211abc1c724e3665cec606c3bbdb209e
X-Patchwork-Hint: ignore
Message-Id: <20220108215546.A8C3282626@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jimtcl: bump to version 0.81
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6fc1b09211abc1c724e3665cec606c3bbdb209e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://jim.tcl.tk/index.html/doc/www/www/articles/jim-release-0-81/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jimtcl/jimtcl.hash | 2 +-
 package/jimtcl/jimtcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.hash b/package/jimtcl/jimtcl.hash
index 7960f4fddb..d4174a3da6 100644
--- a/package/jimtcl/jimtcl.hash
+++ b/package/jimtcl/jimtcl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e79a960de925552eeb4df51121f0ea017e34409568117b1ac461f4c3071289e  jimtcl-0.80.tar.gz
+sha256  ab7eb3680ba0d16f4a9eb1e05b7fcbb7d23438e25185462c55cd032a1954a985  jimtcl-0.81.tar.gz
 sha256  419f1146334e57fb258d6c957d1f94d43455ec0d24b1b54c4447e5f61a353950  LICENSE
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 5d6b379260..2f8e0e6c69 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JIMTCL_VERSION = 0.80
+JIMTCL_VERSION = 0.81
 JIMTCL_SITE = $(call github,msteveb,jimtcl,$(JIMTCL_VERSION))
 JIMTCL_INSTALL_STAGING = YES
 JIMTCL_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
