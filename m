Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F4AC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2722A6129A;
	Sun,  5 Jun 2022 20:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NuSyYMyuo9F; Sun,  5 Jun 2022 20:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D576128C;
	Sun,  5 Jun 2022 20:56:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C96C01BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8D8E41719
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSmSHO6qUfen for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:56:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C682C4169E
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:56:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 257FD86BED; Sun,  5 Jun 2022 20:44:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 22:55:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: edfa431c9b7b53dbbb3063bd5efd88aac84b1c6e
X-Git-Newrev: 811e3d852380b6b5bf67f3349a4e5ef78ae103ea
X-Patchwork-Hint: ignore
Message-Id: <20220605204417.257FD86BED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/meson: bump to version
 0.62.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=811e3d852380b6b5bf67f3349a4e5ef78ae103ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 2037c46bbc..33bd8b6eb9 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.62.1/meson-0.62.1.tar.gz.asc
-sha256  a0f5caa1e70da12d5e63aa6a9504273759b891af36c8d87de381a4ed1380e845  meson-0.62.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.62.2/meson-0.62.2.tar.gz.asc
+sha256  a7669e4c4110b06b743d57cc5d6432591a6677ef2402139fe4f3d42ac13380b0  meson-0.62.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 6d55f19402..8bc7848705 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.62.1
+MESON_VERSION = 0.62.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
