Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D859CAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF63A83E0C;
	Sun, 21 Sep 2025 19:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZINQBHdXuyq4; Sun, 21 Sep 2025 19:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFEE083E0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFEE083E0E;
	Sun, 21 Sep 2025 19:35:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7058E7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D085941413
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjnReMETVrX1 for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 19:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9B5413FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E9B5413FE
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A1F686149; Sun, 21 Sep 2025 19:35:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Sep 2025 21:30:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a33e1af4a01cab51988fba8bbb02b94f7ed28ecf
X-Git-Newrev: e8be2cbc168d9ecdba350646862560b8716d54ab
X-Patchwork-Hint: ignore
Message-Id: <20250921193535.1A1F686149@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: bump to version 4.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8be2cbc168d9ecdba350646862560b8716d54ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/shadow-maint/shadow/releases/tag/4.18.0

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/shadow/shadow.hash | 4 ++--
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 985d8eced0..68703e6082 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
-# Verified from https://github.com/shadow-maint/shadow/releases/download/4.17.4/shadow-4.17.4.tar.xz.asc
+# Verified from https://github.com/shadow-maint/shadow/releases/download/4.18.0/shadow-4.18.0.tar.xz.asc
 # with key 66D0387DB85D320F8408166DB175CFA98F192AF2
-sha256  554801054694ff7d8a7abdf0d6ece34e2f16e111673cc01b8c9ee1278451181e  shadow-4.17.4.tar.xz
+sha256  add4604d3bc410344433122a819ee4154b79dd8316a56298c60417e637c07608  shadow-4.18.0.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 41b0122f62..2ba7a0e03e 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.17.4
+SHADOW_VERSION = 4.18.0
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
