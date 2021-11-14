Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A51C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:29:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B47260E8B
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B47260E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D72F54026F;
	Sun, 14 Nov 2021 14:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TqsO8H8KsUs; Sun, 14 Nov 2021 14:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2050240281;
	Sun, 14 Nov 2021 14:29:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 200831BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F5BE606D4
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KC0UelZ3OoQG for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:29:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB81606A8
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:29:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EA8928D26E; Sun, 14 Nov 2021 14:24:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:28:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3302281d8dbd99ded36f1d2af7d88db73b7b2bc3
X-Git-Newrev: ba85cb155e046d6b873326a6854490feb4602874
X-Patchwork-Hint: ignore
Message-Id: <20211114142459.EA8928D26E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libevdev: bump version
 to 1.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba85cb155e046d6b873326a6854490feb4602874
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For details see [1].

[1] https://lists.freedesktop.org/archives/input-tools/2021-November/001573.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libevdev/libevdev.hash | 6 +++---
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 584a9941c5..68a5ebdcba 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/input-tools/2021-February/001557.html
-sha256  63f4ea1489858a109080e0b40bd43e4e0903a1e12ea888d581db8c495747c2d0  libevdev-1.11.0.tar.xz
-sha512  b3c6b4a1532c5142f3684b920dcdd497a5368aec516e8c389e2c8f9d1eaba16c907b2a7f2c82a3c3ff89bb4d0ae5503c736098c095f9f1bc98f0668e99bf639d  libevdev-1.11.0.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2021-November/001573.html
+sha256  2f729e3480695791f9482e8388bd723402b89f0eaf118057bbdea3cecee9b237  libevdev-1.12.0.tar.xz
+sha512  6c1c1362d5112cdf3816d1f735c27e625f5463ebf10a83d675cd9364c3fb291ebcb91c051da442f1a36ed28ba7dd99af74546707f61274f7d5715c544a0ed04c  libevdev-1.12.0.tar.xz
 
 # Hash for license files:
 sha256  6f13de7ce28e4948ba95170e0723ee1254c1978ce1f127af82aeca597b567cb9  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index f6172809fd..cd80154be2 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.11.0
+LIBEVDEV_VERSION = 1.12.0
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
