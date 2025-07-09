Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E99BC83F17
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 22:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0ACC81ED1;
	Wed,  9 Jul 2025 22:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nGgFQbBtdZz; Wed,  9 Jul 2025 22:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 128F381EB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 128F381EB7;
	Wed,  9 Jul 2025 22:34:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1654612E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 22:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F087760C08
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 22:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZAARW5dnfYe for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 22:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3018260C10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3018260C10
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 22:34:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 279A686328; Wed,  9 Jul 2025 22:34:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Jul 2025 21:54:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce839ea1b991cdaf66497b40011cb34e8c29c93a
X-Git-Newrev: 676c4369d9bb80d953fd3bda76200d1a36ca356c
X-Patchwork-Hint: ignore
Message-Id: <20250709223453.279A686328@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: bump to version 2.48.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=676c4369d9bb80d953fd3bda76200d1a36ca356c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a number of crashes. Release notes:

  https://webkitgtk.org/2025/05/28/webkitgtk2.48.3-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
