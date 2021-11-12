Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4447CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:13:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D218861054
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D218861054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80B66827CE;
	Fri, 12 Nov 2021 22:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wq7GgW92PJuT; Fri, 12 Nov 2021 22:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA20F827BA;
	Fri, 12 Nov 2021 22:13:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC42D1C115D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8A9240602
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmZ8OKPjBnYg for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E56F7405E3
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 612E08854A; Fri, 12 Nov 2021 22:08:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 22:55:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 146c232692e72154e5987f83e9bd0678e3b86e20
X-Git-Newrev: 1f051ef2e8f7ffd9291fe7b6db2a384d6eb788c7
X-Patchwork-Hint: ignore
Message-Id: <20211112220833.612E08854A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpi-firmware: bump
 version to fa9a006
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f051ef2e8f7ffd9291fe7b6db2a384d6eb788c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:

    kernel: Bump to 5.10.78
    kernel: VC4 PixelValve and HDMI Drivers Locking Improvements for 5.10
    kernel: Bump to 5.10.77
    kernel: dtoverlays: Update all image sensor overlays for Media Controller option
    kernel: drm/vc4: Add support for non-standard modes in VEC
    kernel: Bump to 5.10.76
    kernel: Bump to 5.10.75
    firmware: video_decode: i/p port enable/disable without o/p active could stall
    firmware: clock-2711: Limit PLLB VCO frequency to the high range
    kernel: Bump to 5.10.74
    kernel: ARM: dts: bcm2835_audio missing firmware reference
    kernel: vcio rewrite
    kernel: Bump to 5.10.73
    kernel: Bump to 5.10.71
    kernel: Bump to 5.10.69
    kernel: Bump to 5.10.67
    kernel: Bump to 5.10.66
    kernel: Bump to 5.10.65
    kernel: Bump to 5.10.64
    kernel: Enable driver for RTL8111H used in cm4 carrier boards

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: actually fill-in the changelog]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 0ff7a73a37..7cbfd1b249 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80af5efb51677edb7af6746a553dc2d8ad3f532ff44e4b7263f1e12d4bf72ffd  rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342.tar.gz
+sha256  a079a31fc80a23421589edcacef94faa713b12d3e77b92710ae2594c8d549477  rpi-firmware-fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 3a4741a0ff..5e8b0379ba 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 2ef3800b1b71c0e30c2a61ecad6e007ae96ea342
+RPI_FIRMWARE_VERSION = fa9a00624e7d5d3dcdb297dff132dc32cc2d9a25
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
