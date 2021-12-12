Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84D0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D076606FA;
	Sun, 12 Dec 2021 14:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ociLa16grERH; Sun, 12 Dec 2021 14:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5EC16E43F;
	Sun, 12 Dec 2021 14:53:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF7351BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E8E061CF7
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2W9NKp0g4NDB for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:53:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE53861CE7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:53:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 087D883469; Sun, 12 Dec 2021 14:48:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:48:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c71b52235d88cd8d38b4fd02c87f791aaa8eff3
X-Git-Newrev: c7233ec2c32c9fbef2738f8de7d59da85cd44b99
X-Patchwork-Hint: ignore
Message-Id: <20211212144823.087D883469@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcsc-lite: bump to version 1.9.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7233ec2c32c9fbef2738f8de7d59da85cd44b99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index b4f9e09b32..4844606c59 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8a8caac227e0a266015298dda663e81576a0d11d698685101e6aa6c9fdb51c4b  pcsc-lite-1.9.4.tar.bz2
+sha256  9ee3f9b333537562177893559ad4f7b8d5c23ebe828eef53056c02db14049d08  pcsc-lite-1.9.5.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 2536a49e5d..a7db105987 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.9.4
+PCSC_LITE_VERSION = 1.9.5
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
