Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA304C83F20
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 11:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88AAF40A6A;
	Sat, 12 Jul 2025 11:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6BXm5ZPxNU5; Sat, 12 Jul 2025 11:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D6B40AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D6B40AED;
	Sat, 12 Jul 2025 11:35:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08EE5106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC3F340A6A
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5aeaXXnpNrj for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 11:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F5CE40A42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F5CE40A42
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:35:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0A4A8642C; Sat, 12 Jul 2025 11:35:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Jul 2025 13:25:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4ce212da1558a68c8648022f8b5bfb6ff8b5d57
X-Git-Newrev: 8b0bb896404d90ac7b0f1d78d9ff74163c90d419
X-Patchwork-Hint: ignore
Message-Id: <20250712113552.F0A4A8642C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpebackend-fdo: bump to version
 1.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b0bb896404d90ac7b0f1d78d9ff74163c90d419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This maintenance release solves build issues and memory leaks.
Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.16.0.html
  https://wpewebkit.org/release/wpebackend-fdo-1.14.4.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Julien: add link to 1.14.4 release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
