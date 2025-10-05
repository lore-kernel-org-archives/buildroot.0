Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAC4CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6385260DB9;
	Sun,  5 Oct 2025 13:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VfAtdmivIzk; Sun,  5 Oct 2025 13:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 717EC60A98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 717EC60A98;
	Sun,  5 Oct 2025 13:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6733226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD36581261
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vmT-OLH3h72 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1126581270
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1126581270
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01BF8868B9; Sun,  5 Oct 2025 13:45:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 15:37:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6c0f0015b4d469cb8e4e590e44e221d8660424c
X-Git-Newrev: 0d430ac7281b5fd35f6d76707faea4eae04bd72e
X-Patchwork-Hint: ignore
Message-Id: <20251005134509.01BF8868B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libatomic_ops: bump version to
 7.8.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d430ac7281b5fd35f6d76707faea4eae04bd72e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/bdwgc/libatomic_ops/releases/tag/v7.8.4

Updated _SITE and project URL following upstream:
https://github.com/bdwgc/libatomic_ops/commit/7fc1a8151aaa660c5991f06e80cc793df0b1c0fc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libatomic_ops/Config.in          | 2 +-
 package/libatomic_ops/libatomic_ops.hash | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index 8287c6522d..834f7cb134 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -15,4 +15,4 @@ config BR2_PACKAGE_LIBATOMIC_OPS
 	help
 	  Atomic operations library
 
-	  https://github.com/ivmai/libatomic_ops
+	  https://github.com/bdwgc/libatomic_ops
diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 1710fd3a47..64de98954d 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ad8428a40e01d41bc4ddad3166afa1fc175c9e58d8ef7ddbd7ef3298e32ac37b  libatomic_ops-7.8.2.tar.gz
+sha256  ea8295ac627646e37fd194d31535bbc02da60b908c8166c5e04d2461a53cb059  libatomic_ops-7.8.4.tar.gz
 sha256  969294c9324b2d360ae2a08edd5ca6f9cd754cb71b71e56bee15d2f10bb10496  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 555ba678fe..bbd7f36db8 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.8.2
-LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
+LIBATOMIC_OPS_VERSION = 7.8.4
+LIBATOMIC_OPS_SITE = $(call github,bdwgc,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
 # From doc/LICENSING.txt: "Our intent is to make it easy to use
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
