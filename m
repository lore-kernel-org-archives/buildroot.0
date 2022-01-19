Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B97C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC9C8291C;
	Wed, 19 Jan 2022 21:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7sf6RfizZUJ; Wed, 19 Jan 2022 21:28:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93725828D1;
	Wed, 19 Jan 2022 21:28:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC841BF9B6
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6947082AC3
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yiXeC4Dz3LIQ for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:28:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C23B982AA7
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:28:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id EFB84835A2; Wed, 19 Jan 2022 21:22:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 22:12:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9958744a0cddfd01e8359ab560e04e9a8cdd5578
X-Git-Newrev: 8a71f9f8276d0d74a25760dfd7937dcb9cb212f9
X-Patchwork-Hint: ignore
Message-Id: <20220119212205.EFB84835A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-userland: bump version to
 14b90ff
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a71f9f8276d0d74a25760dfd7937dcb9cb212f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  f5404b2 raspicam: Check system is running legacy camera stack
  14b90ff mmal: Hack to make mmal core register VideoCore components

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 8ea184a4f6..b837cfe709 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  16c01befff64ebc11a0554e487b00939ed7a716f68dc795db4880b35bb25fa41  rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz
+sha256  bb682f3c20bc5c7877531d5666c8dcc674a2f347aa792cf979dc0b07b6261e77  rpi-userland-14b90ff9d9f031391a299e6e006965d02bfd1bb1.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 09a7f6af74..84050b6df3 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = bab9bf8790cd69660d443ce43b4e372999f3f7ac
+RPI_USERLAND_VERSION = 14b90ff9d9f031391a299e6e006965d02bfd1bb1
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
