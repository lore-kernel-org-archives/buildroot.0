Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10214C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D14D415A9;
	Wed, 19 Jan 2022 21:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OeCeX9tGeM4P; Wed, 19 Jan 2022 21:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7EC04158C;
	Wed, 19 Jan 2022 21:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDE961BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D1D4021C
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsVffpMvtAlH for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:28:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B936C40141
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:28:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E58CE8359D; Wed, 19 Jan 2022 21:22:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 22:12:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a8a6dc41c0571c3cd466ade890b4ed1209ca0e6
X-Git-Newrev: 9958744a0cddfd01e8359ab560e04e9a8cdd5578
X-Patchwork-Hint: ignore
Message-Id: <20220119212205.E58CE8359D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version to
 3f20b83
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

commit: https://git.buildroot.net/buildroot/commit/?id=9958744a0cddfd01e8359ab560e04e9a8cdd5578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  095deea759 kernel: overlays: vc4-kms-v3d: Change composite handling
  2e9b609e53c kernel: Bump to 5.10.79
  12bc6e36773 firmware: dtoverlay: Rebase aliases in overlays like labels
  24d966d35bb kernel: Bump to 5.10.81
  ca52e7c1303 kernel: edt-ft5x06 touchscreen fixes
  1a0297bfbf7 kernel: Bump to 5.10.82
  0a1a871d04c kernel: Fix for IN Token of USB Endpoint 1 stopping occasionally on Pi 4
  303d0012cd7 kernel: Bump to 5.10.83
  bd8b6d5dc8e kernel: Bump to 5.10.85
  56f1b8bbc88 kernel: Bump to 5.10.87
  536baf33ae9 kernel: Bump to 5.10.88
  ce71e3e9b34 kernel: Bump to 5.10.89
  19b570d0d6a firmware: arm-loader: Fix kernel8.img selection on 2837 with arm_64bit=1
  fbbde90b709 kernel: drm/vc4: fix non-working audio on RPi3 and no video with DVI
  165bd7bc562 firmware: improve firmware camera detection
  318e3373496 kernel: Bump to 5.10.90
  175984a6dc4 kernel: drm/vc4: Add alpha_blend_mode property to each plane
  20c5829b0af kernel: Bump to 5.10.92
  3f20b832b27 firmware: arm_loader: Only clip min/max to the same value for turbo clocks

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 7cbfd1b249..ec13115f3b 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a079a31fc80a23421589edcacef94faa713b12d3e77b92710ae2594c8d549477  rpi-firmware-fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25.tar.gz
+sha256  33aea2cb9c3be94c3dd6a96fbb3443eee5af1dc5fc9140e1fadc50832983064e  rpi-firmware-3f20b832b27cd730deb6419b570f31a98167eef6.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index f773f83999..b46a7f5270 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25
+RPI_FIRMWARE_VERSION = 3f20b832b27cd730deb6419b570f31a98167eef6
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
