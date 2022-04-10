Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9226CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CF788405E;
	Sun, 10 Apr 2022 21:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TMjZFvbLmETa; Sun, 10 Apr 2022 21:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552EC8405C;
	Sun, 10 Apr 2022 21:12:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EC181BF3D8
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D6AE60BB0
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbrJ0KZeH2pQ for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:11:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F6C660B21
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:11:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E91FE8396B; Sun, 10 Apr 2022 21:02:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 23:06:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04164b81e76e29fb9482245e808b46af2aa67bc6
X-Git-Newrev: 4b1080d57ae642bd5d4b5783c49d4ba49f13dfe8
X-Patchwork-Hint: ignore
Message-Id: <20220410210201.E91FE8396B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/woff2: use github helper
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b1080d57ae642bd5d4b5783c49d4ba49f13dfe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/woff2/woff2.hash | 2 +-
 package/woff2/woff2.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/woff2/woff2.hash b/package/woff2/woff2.hash
index 469071e3c2..0812dabcf1 100644
--- a/package/woff2/woff2.hash
+++ b/package/woff2/woff2.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  c788bba1530aec463e755e901f9342f4b599e3a07f54645fef1dc388ab5d5c30625535e5dd38e9e792e04a640574baa50eeefb6b7338ab403755f4a4e0c3044d  v1.0.2.tar.gz
+sha512  c788bba1530aec463e755e901f9342f4b599e3a07f54645fef1dc388ab5d5c30625535e5dd38e9e792e04a640574baa50eeefb6b7338ab403755f4a4e0c3044d  woff2-1.0.2.tar.gz
 
 # Hash for license files:
 sha512  8ee924da3fb5d16135adcf6a8fbe9e2e8f3d2d80468617e72ca4fa059a60f8455c9a5f68a8dc381b1297c8bf39c887a912d0f69246d2604ada74d3da9e8e490b  LICENSE
diff --git a/package/woff2/woff2.mk b/package/woff2/woff2.mk
index b2ff33fe98..937e8cf736 100644
--- a/package/woff2/woff2.mk
+++ b/package/woff2/woff2.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 WOFF2_VERSION = 1.0.2
-WOFF2_SOURCE = v$(WOFF2_VERSION).tar.gz
-WOFF2_SITE = https://github.com/google/woff2/archive
+WOFF2_SITE = $(call github,google,woff2,v$(WOFF2_VERSION))
 WOFF2_LICENSE = MIT
 WOFF2_LICENSE_FILES = LICENSE
 WOFF2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
