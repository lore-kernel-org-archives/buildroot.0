Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED9AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 679BD40191;
	Mon, 27 Dec 2021 20:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8i2UGuduIz3h; Mon, 27 Dec 2021 20:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC60F4051E;
	Mon, 27 Dec 2021 20:03:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7534A1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AAF640193
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1Lg2MbC5Qqm for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:01:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CA1F40191
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:01:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5A4D382A9A; Mon, 27 Dec 2021 19:56:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 21:01:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 583125556e4a94855de7a4456838005e36073102
X-Git-Newrev: 15bc3d232c796c1e231c59583d55e31a281ff6ff
X-Patchwork-Hint: ignore
Message-Id: <20211227195611.5A4D382A9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-visualisation-goom: bump
 version to 19.0.1-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=15bc3d232c796c1e231c59583d55e31a281ff6ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index e4970972ec..6fec1d495e 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  03f4228421a1fe38d619d5599f31de04e2207647c5aae7ac83809e5324890437  kodi-visualisation-goom-19.0.0-Matrix.tar.gz
+sha256  167206c02b7c4ace0b5446cac013f77a7a238d2a9a7cc768987088b42ac1d941  kodi-visualisation-goom-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 37adccc9bf..c7168af306 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 19.0.0-Matrix
+KODI_VISUALISATION_GOOM_VERSION = 19.0.1-Matrix
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
