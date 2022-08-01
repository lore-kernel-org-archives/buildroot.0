Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DBDC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6851605B7;
	Mon,  1 Aug 2022 20:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6851605B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id St1VyDVuh_Yp; Mon,  1 Aug 2022 20:09:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3036605B1;
	Mon,  1 Aug 2022 20:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3036605B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6BC81BF293
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 820A940122
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 820A940122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRbeaa6PTJY0 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:09:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5D0D400A8
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5D0D400A8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6FBC686C08; Mon,  1 Aug 2022 19:55:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 22:05:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a520c64f62c666df4058821932321b4d377baa6
X-Git-Newrev: ccc3900326fd185c854b3b572c6cc776c7c0746f
X-Patchwork-Hint: ignore
Message-Id: <20220801195519.6FBC686C08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libutp: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccc3900326fd185c854b3b572c6cc776c7c0746f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Follow transmission switching from branch post-3.3-transmission to
branch post-3.4-transmission:
https://github.com/transmission/transmission/commit/745adf8332b9686afa55407f9be20de21002a187

This branch contains a copyright year bump for the license file:
https://github.com/transmission/libutp/commit/365254427e5358a0c390aa5a60df5f449b9c0f00

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libutp/libutp.hash | 4 ++--
 package/libutp/libutp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libutp/libutp.hash b/package/libutp/libutp.hash
index 38d46b0ae5..f347dc3f2c 100644
--- a/package/libutp/libutp.hash
+++ b/package/libutp/libutp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c515e6f9add47d3d202389e8a62feb765f0ae41d6398cc238e44028be520774e  libutp-fda9f4b3db97ccb243fcbed2ce280eb4135d705b.tar.gz
-sha256  4441418beb8e352b6e2aa09083b4c51a86814a49878dbb1a81936b466cd5badd  LICENSE
+sha256  484f802d044f774fa5f669476ecdd9cb6110c383781c39adc03bbf6575090771  libutp-059c9449a104e440e4f913756a5f560dd4ae76a9.tar.gz
+sha256  73b400bf61dde52223dae1642205ca187f1a6b24a508dcce52bf386c27a0e58c  LICENSE
diff --git a/package/libutp/libutp.mk b/package/libutp/libutp.mk
index c926c290d2..394c1e9cb9 100644
--- a/package/libutp/libutp.mk
+++ b/package/libutp/libutp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUTP_VERSION = fda9f4b3db97ccb243fcbed2ce280eb4135d705b
+LIBUTP_VERSION = 059c9449a104e440e4f913756a5f560dd4ae76a9
 LIBUTP_SITE = $(call github,transmission,libutp,$(LIBUTP_VERSION))
 LIBUTP_LICENSE = MIT
 LIBUTP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
