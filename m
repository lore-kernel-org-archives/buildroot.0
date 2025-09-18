Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E480CAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 19:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD1F81E9F;
	Thu, 18 Sep 2025 19:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZghT-yKx3Ax; Thu, 18 Sep 2025 19:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F372881E99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F372881E99;
	Thu, 18 Sep 2025 19:22:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DE20150
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0412F40B31
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmtbbvPY8JlI for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 19:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00C0C40B30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00C0C40B30
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:22:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF42D85C7A; Thu, 18 Sep 2025 19:22:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 20:39:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2febca71f78fc45805b7b004339cc2d83fdc5e28
X-Git-Newrev: ddb2fa5c5ac06beda7291729838bbdfefe83dfee
X-Patchwork-Hint: ignore
Message-Id: <20250918192247.EF42D85C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: bump to version 14.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddb2fa5c5ac06beda7291729838bbdfefe83dfee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release announce:
https://lists.freedesktop.org/archives/wayland-devel/2025-April/044158.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add release announce link in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 35fe608e20..cd2a82508d 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-October/043858.html
-sha256  a8150505b126a59df781fe8c30c8e6f87da7013e179039eb844a5bbbcc7c79b3  weston-14.0.1.tar.xz
-sha512  2d782f98f28b39b990acecfc885f62ab34c9cdd22ef06b09c5d8df792112c47b365f89c2bf05d871e36ddfb4c49aa7e6d05ff60fe67a2657727162e4f564a412  weston-14.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2025-April/044158.html
+sha256  b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac  weston-14.0.2.tar.xz
+sha512  e8214ec893e6c3ae94eb3c92feba104b0201843e9143f726a3e9a4d396d02523c94da706c1348cf934bc339fb1a4bc1fecdb865f0ea914115fd346d9eda091f5  weston-14.0.2.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 1d55a1fcba..57869b7e63 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 14.0.1
+WESTON_VERSION = 14.0.2
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
