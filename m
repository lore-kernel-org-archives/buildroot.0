Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23619C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFDF76076A;
	Thu, 17 Jul 2025 20:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZYPtOa3ovlS; Thu, 17 Jul 2025 20:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5A3460791
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5A3460791;
	Thu, 17 Jul 2025 20:33:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36E981A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D1E84116E
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LheGUPf5sv6C for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5713841148
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5713841148
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54A1486673; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 22:57:55 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: bf6e1577f45d2ef9369c8e860857077bfcc7197d
X-Git-Newrev: 1a0486503b7e748878ea787bd5d5f2ab6d051dad
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.54A1486673@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/wpebackend-fdo:
 bump to version 1.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a0486503b7e748878ea787bd5d5f2ab6d051dad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This maintenance release solves build issues and memory leaks.
Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.16.0.html
  https://wpewebkit.org/release/wpebackend-fdo-1.14.4.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Julien: add link to 1.14.4 release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8b0bb896404d90ac7b0f1d78d9ff74163c90d419)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 5055998ab7..f0578808c4 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.3.tar.xz.sums
-md5  ab73398b1e35495977e50bee103969d2  wpebackend-fdo-1.14.3.tar.xz
-sha1  2d2945df15cc1efa957657fa727f3bc4c6f580bb  wpebackend-fdo-1.14.3.tar.xz
-sha256  10121842595a850291db3e82f3db0b9984df079022d386ce42c2b8508159dc6c  wpebackend-fdo-1.14.3.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.16.0.tar.xz.sums
+md5  38f488aaa6d68252b593b65ba3e2d9d1  wpebackend-fdo-1.16.0.tar.xz
+sha1  8a06e51aeb2c94b4cf254d866c19eca587d3cd37  wpebackend-fdo-1.16.0.tar.xz
+sha256  beddf321232d5bd08106c179dbc600f8ce88eb3620b4a59a6329063b78f64635  wpebackend-fdo-1.16.0.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index dbabacf498..e5972754f6 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.14.3
+WPEBACKEND_FDO_VERSION = 1.16.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
