Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF9BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 09:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF0E83F5D;
	Mon, 11 Apr 2022 09:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZX0cW0HN8utD; Mon, 11 Apr 2022 09:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD12E83F53;
	Mon, 11 Apr 2022 09:46:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5721BF44A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1646B60E74
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sjGG93w6J1b for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 707BB600B4
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DBB2D838C1; Mon, 11 Apr 2022 09:36:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 11:41:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a52018aba6e9c2f201ababcbefdc1b178aebb608
X-Git-Newrev: 74399277a5a077973b3b86e5f9dde4b93f056f86
X-Patchwork-Hint: ignore
Message-Id: <20220411093636.DBB2D838C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/woff2: use github
 helper
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

commit: https://git.buildroot.net/buildroot/commit/?id=74399277a5a077973b3b86e5f9dde4b93f056f86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4b1080d57ae642bd5d4b5783c49d4ba49f13dfe8)
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
