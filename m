Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBF5EB64D9
	for <buildroot@archiver.kernel.org>; Sat, 17 Jun 2023 16:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8662607EC;
	Sat, 17 Jun 2023 16:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8662607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_mmyZcJvGVV; Sat, 17 Jun 2023 16:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F4C61140;
	Sat, 17 Jun 2023 16:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1F4C61140
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 484631BF297
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 16:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22382405C2
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 16:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22382405C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kE_WJojYVoAA for <buildroot@lists.busybox.net>;
 Sat, 17 Jun 2023 16:55:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A11940948
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 16:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A11940948
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA54A839C5; Sat, 17 Jun 2023 16:54:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jun 2023 18:53:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bee0f837999fce6f9b3483c40a706f34be8a3b5
X-Git-Newrev: 1c512cc5bd9a1a02ed32dfe1c5db2c04efe7a9a7
X-Patchwork-Hint: ignore
Message-Id: <20230617165459.EA54A839C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-peripheral-joystick: bump
 version to 20.1.9-Nexus
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c512cc5bd9a1a02ed32dfe1c5db2c04efe7a9a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 1ccb528526..ea22c603ac 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e8fb553309d3ad48fad21d2d6cebdb537a4e2b88878b6fdc43707c7bc37e160  kodi-peripheral-joystick-20.1.8-Nexus.tar.gz
+sha256  b1b379e7eb24a16702745c78a57b2f246a013becf5c2daf7579651cbf2188b82  kodi-peripheral-joystick-20.1.9-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index c893ae1247..a8c2502420 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.8-Nexus
+KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.9-Nexus
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
