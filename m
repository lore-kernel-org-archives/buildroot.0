Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5006FC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 093F641E38;
	Mon,  4 Dec 2023 20:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 093F641E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AL_0vQDNHtA; Mon,  4 Dec 2023 20:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 275E441F9B;
	Mon,  4 Dec 2023 20:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 275E441F9B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 197D01BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E27BB4177B
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E27BB4177B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vg-DjZuthJHg for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18C52416C5
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18C52416C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11FE1879B7; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 19:55:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13ba668a2da3a0dcb386578ce15b00a444101dbe
X-Git-Newrev: 9d27996289f50f1e3e16748920f5945e1efcffa7
X-Patchwork-Hint: ignore
Message-Id: <20231204201330.11FE1879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version to
 83dafbc
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d27996289f50f1e3e16748920f5945e1efcffa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 83dafbc will match the with kernel 6.1.61

Signed-off-by: Bram Oosterhuis <dev@bybram.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index ec13115f3b..33e05a2f4a 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  33aea2cb9c3be94c3dd6a96fbb3443eee5af1dc5fc9140e1fadc50832983064e  rpi-firmware-3f20b832b27cd730deb6419b570f31a98167eef6.tar.gz
+sha256  dd43e77ca1a8969cdb7f05dd72a57f90862071d5a93bdd6aea8246aba85689cf  rpi-firmware-83dafbc92c0e63f76ca2ecdd42462d56489d1c77.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 53d6d8ca06..37e010d1de 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 3f20b832b27cd730deb6419b570f31a98167eef6
+RPI_FIRMWARE_VERSION = 83dafbc92c0e63f76ca2ecdd42462d56489d1c77
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
