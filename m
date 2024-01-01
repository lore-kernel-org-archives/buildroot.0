Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FFEC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23CDE60B74;
	Mon,  1 Jan 2024 20:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23CDE60B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTzYylWGZ0mK; Mon,  1 Jan 2024 20:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6740160B0F;
	Mon,  1 Jan 2024 20:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6740160B0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDCD71BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B39434035D
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B39434035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTB-lQnNjAu5 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBA1340334
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA1340334
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0C3183A95; Mon,  1 Jan 2024 20:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 21:33:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 498925bc0ee318d6093d44668ad7d6b74849c837
X-Git-Newrev: 745e1ca054d466618c1cbe82bee6c9af5a405fdf
X-Patchwork-Hint: ignore
Message-Id: <20240101203332.A0C3183A95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nbd: bump to version 3.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=745e1ca054d466618c1cbe82bee6c9af5a405fdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch site to github to get latest release

https://github.com/NetworkBlockDevice/nbd/releases/tag/nbd-3.25

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nbd/nbd.hash | 6 +-----
 package/nbd/nbd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index f58a89bf9a..9fe95441af 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,7 +1,3 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.24/
-md5  a6d9e7bbc311a2ed07ef84a58b82b5dd  nbd-3.24.tar.xz
-sha1  72c59ef5186ae355de6f539a1b348e18cbb8314e  nbd-3.24.tar.xz
-
 # Locally calculated
-sha256  6877156d23a7b33f75eee89d2f5c2c91c542afc3cdcb636dea5a88539a58d10c  nbd-3.24.tar.xz
+sha256  f5c8fd0fcb57b1c926594d0e57f356432ee08678bef1d40d088f0830f0cbdd0a  nbd-3.25.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 50f698dd24..b077e43624 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.24
+NBD_VERSION = 3.25
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
-NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
+NBD_SITE = https://github.com/NetworkBlockDevice/nbd/releases/download/nbd-$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
 NBD_DEPENDENCIES = host-bison host-pkgconf libglib2
 NBD_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
