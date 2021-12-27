Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199ACC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7F26401A2;
	Mon, 27 Dec 2021 20:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJfqV3aANxex; Mon, 27 Dec 2021 20:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F01F740191;
	Mon, 27 Dec 2021 20:02:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA0451BF8B4
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D51584019F
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYRH-m5Kbe5c for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:01:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F056140186
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:01:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3822C82BA9; Mon, 27 Dec 2021 19:56:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 21:01:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67d2d7a294f0b7e01e042421066d202f125a6511
X-Git-Newrev: 1545d192290bb85a3db369f36591b8cdafa0e084
X-Patchwork-Hint: ignore
Message-Id: <20211227195611.3822C82BA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-screensaver-greynetic: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=1545d192290bb85a3db369f36591b8cdafa0e084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index b5844fd643..2268b2e52c 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c0643ea89202ab6bc384a4e6a59de2d09318fe3231d64fe244e81e75dd64827c  kodi-screensaver-greynetic-19.0.0-Matrix.tar.gz
+sha256  5428bc2bf17132dbc98ef0f9df0c98ab5abcbe4bf6e9040460cbf5be58ea3058  kodi-screensaver-greynetic-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index a94103d438..3e91cfb03a 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 19.0.0-Matrix
+KODI_SCREENSAVER_GREYNETIC_VERSION = 19.0.1-Matrix
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
