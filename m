Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CDBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C1A940588;
	Thu, 10 Feb 2022 21:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1FCU3yTKIgb; Thu, 10 Feb 2022 21:38:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEB1740909;
	Thu, 10 Feb 2022 21:38:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B09BF1BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F25160B65
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6OsPGD6sgNQ for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:38:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB36B60A84
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:38:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ABD5C82DE9; Thu, 10 Feb 2022 21:30:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 22:32:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c24eff63a8f5f4f06e95ed6c899e1813287e33a4
X-Git-Newrev: 5eac014874d0d5be36f0d9a580b6fc9378678e35
X-Patchwork-Hint: ignore
Message-Id: <20220210213036.ABD5C82DE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to 19.0.3-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=5eac014874d0d5be36f0d9a580b6fc9378678e35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index c7a081f887..74aefe2138 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f2285e77043a0c9160d1ab11dd5943cc584be17a2f7920be3002751ff697ec7b  kodi-inputstream-adaptive-19.0.2-Matrix.tar.gz
+sha256  1549422ac1386929dfc1a479898d6311440d1f8bfd1bc94e1fe5da9cc2db805c  kodi-inputstream-adaptive-19.0.3-Matrix.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index f632a42adb..83ac897037 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.2-Matrix
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.3-Matrix
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
