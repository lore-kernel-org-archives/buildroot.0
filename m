Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8287C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B0E60A93;
	Mon, 27 Dec 2021 20:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcfxPnC1Wxtk; Mon, 27 Dec 2021 20:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8A5F60A8C;
	Mon, 27 Dec 2021 20:01:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8061BF8B4
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EFFE60A8C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2P-poLbpaAW0 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:01:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEBBF60A6F
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:01:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2748E82A9A; Mon, 27 Dec 2021 19:56:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 21:01:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a40e2ce48826dde89b46448acb99cb6bfe64456
X-Git-Newrev: 5ce6e12d6613f2a409ba86c707ab845642983f04
X-Patchwork-Hint: ignore
Message-Id: <20211227195611.2748E82A9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-screensaver-asterwave: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ce6e12d6613f2a409ba86c707ab845642983f04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash | 2 +-
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index 91c3d61091..95c37a8e69 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  90b60cb321db34de16a9b64068ab3b78ab81c0d44e62bda0d03535ddb4ae1ebc  kodi-screensaver-asterwave-19.0.0-Matrix.tar.gz
+sha256  e1d97cf5628dd844745d152a2b3633a22c720c35ef0e81aa61857f47a78003aa  kodi-screensaver-asterwave-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 21def8ca4c..2ae243eba0 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 19.0.0-Matrix
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 19.0.1-Matrix
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
