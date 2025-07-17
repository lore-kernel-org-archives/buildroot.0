Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF8AC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45ABE4175B;
	Thu, 17 Jul 2025 20:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJyu6IX3_349; Thu, 17 Jul 2025 20:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECDFA4171F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECDFA4171F;
	Thu, 17 Jul 2025 20:33:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AF94226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9658B41148
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kt36kqP6pP97 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEBE641163
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEBE641163
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCDD786573; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 13:17:50 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: aaca2bc830259c5b8a84b9b1043f9f0d84cb005c
X-Git-Newrev: e1785557ac1c68126da90d8830390a9a33691d12
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.BCDD786573@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/webkitgtk: bump
 to version 2.48.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1785557ac1c68126da90d8830390a9a33691d12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes a number of crashes. Release notes:

  https://webkitgtk.org/2025/05/28/webkitgtk2.48.3-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 676c4369d9bb80d953fd3bda76200d1a36ca356c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 82b5cb4651..6c2beb7d1d 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.48.2.tar.xz.sums
-sha1  e1a216588ad5eaf71b548b035699319f74cbd8da  webkitgtk-2.48.2.tar.xz
-sha256  ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37  webkitgtk-2.48.2.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.48.3.tar.xz.sums
+sha1  36faf2c30967db57175caf88cefd3d25781ae6d7  webkitgtk-2.48.3.tar.xz
+sha256  d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e9279640b3217a782c3  webkitgtk-2.48.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index b24527f7ce..419bef9d8e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.48.2
+WEBKITGTK_VERSION = 2.48.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
