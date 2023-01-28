Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD54BC38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56FF441731;
	Sat, 28 Jan 2023 21:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56FF441731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCniT32qWuvo; Sat, 28 Jan 2023 21:45:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316A641729;
	Sat, 28 Jan 2023 21:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 316A641729
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3846B1BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 125B160E41
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 125B160E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kbg-Arx9mGDY for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:45:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30B5E60E40
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30B5E60E40
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DAA087F7F; Sat, 28 Jan 2023 21:45:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:43:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d183a6d333eaf57b6a5f5c1a7eb323b5ada7cd6
X-Git-Newrev: acc4570bf41d10573c73cda08defb385324becc6
X-Patchwork-Hint: ignore
Message-Id: <20230128214521.1DAA087F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-peripheral-xarcade: bump
 version to 19.0.5-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=acc4570bf41d10573c73cda08defb385324becc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 0ae1ffaa50..5467513a0b 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1327ecd05e2e66a4faf809efee4c5b99627912d971db26a0a905f0299e4f876b  kodi-peripheral-xarcade-19.0.4-Matrix.tar.gz
+sha256  11f746cfeeffdfc1de6829d17aad999c8b598ca2239fcddb64801738546be6c9  kodi-peripheral-xarcade-19.0.5-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index 9ee26ea2fe..2d9e33b625 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 19.0.4-Matrix
+KODI_PERIPHERAL_XARCADE_VERSION = 19.0.5-Matrix
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
