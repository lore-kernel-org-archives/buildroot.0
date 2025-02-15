Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3587C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ED004F0FE;
	Fri, 28 Feb 2025 17:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBivhUp0o1Vt; Fri, 28 Feb 2025 17:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE114EF4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EE114EF4C;
	Fri, 28 Feb 2025 17:18:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A6A68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C7A642570
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsCWQlq5tIij for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 585B842D59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 585B842D59
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48FE082658; Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Feb 2025 14:20:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 45c13bf2490124f265a2efd6c0c3b8065e4498f6
X-Git-Newrev: 3dc8a793b646d1a91ce99baf534b19b3d214b883
X-Patchwork-Hint: ignore
Message-Id: <20250228163040.48FE082658@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wlroots: bump to
 version 0.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3dc8a793b646d1a91ce99baf534b19b3d214b883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a minor bugfix release. Changelog:

  https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index ccfcd6ac42..68b5dbd6d2 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.1/downloads/wlroots-0.18.1.tar.gz.sig
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.2/downloads/wlroots-0.18.2.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  b9c4bfef4123fe9f8662280b851e3c5741927457174315826827bfbb70612878  wlroots-0.18.1.tar.gz
+sha256  cf776c169169f279808d9eabc6583f484338dcd454c966a285ff178c88c105d4  wlroots-0.18.2.tar.gz
 
 # Hashes for license files:
 sha256  35d427c043dcafe8893b9e7247348f599847c81d9a067703587c80707f3d58df  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 8fa7408717..81f76fcdc7 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.18.1
+WLROOTS_VERSION = 0.18.2
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
