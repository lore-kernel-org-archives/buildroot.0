Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29AECCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D62E60ABC;
	Mon, 10 Nov 2025 21:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGLeQoqwWFwb; Mon, 10 Nov 2025 21:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BD1660ABE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD1660ABE;
	Mon, 10 Nov 2025 21:01:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6B0A25D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 21:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CF3E816F1
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 21:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOVZ9NdO-8bT for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 21:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF702816EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF702816EE
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 21:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9DD0843BC; Mon, 10 Nov 2025 21:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Nov 2025 21:53:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53a302c6ed2a8f83a5bc9e4ecb1a280ee3e1bc92
X-Git-Newrev: b3b7faaf2adc46d49140a0c4ab24d18f4648b5c4
X-Patchwork-Hint: ignore
Message-Id: <20251110210129.C9DD0843BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-bootcount: bump to version
 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3b7faaf2adc46d49140a0c4ab24d18f4648b5c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/VoltServer/uboot-bootcount/releases/tag/v3.2.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-bootcount/uboot-bootcount.hash | 2 +-
 package/uboot-bootcount/uboot-bootcount.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-bootcount/uboot-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
index aaf702c789..da77d614a9 100644
--- a/package/uboot-bootcount/uboot-bootcount.hash
+++ b/package/uboot-bootcount/uboot-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dd74a806c779c3180250ca2fce68ce9dc59f9d5fa1cbd170212cf7878c56d348  uboot-bootcount-3.1.0.tar.gz
+sha256  cd3345ac6ff1f44588ae39a8da4bc9c7993f98ece556f374f2f7af6715a9cfa7  uboot-bootcount-3.2.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
index 2c75f8f564..26d2b95bac 100644
--- a/package/uboot-bootcount/uboot-bootcount.mk
+++ b/package/uboot-bootcount/uboot-bootcount.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_BOOTCOUNT_VERSION = 3.1.0
+UBOOT_BOOTCOUNT_VERSION = 3.2.0
 UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
 UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
 UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
