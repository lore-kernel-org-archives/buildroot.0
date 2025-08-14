Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066C2CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D072F60751;
	Thu, 14 Aug 2025 20:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Wg2PFKy2jkr; Thu, 14 Aug 2025 20:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8903607E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8903607E8;
	Thu, 14 Aug 2025 20:06:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A0E1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43755404A5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7STXY7Q0QDrS for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE2AB404B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE2AB404B5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC03287609; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:32:24 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 07a458c9c66461a0a2192eceee5b5f55b299a47c
X-Git-Newrev: 443bf63537edcefa5167be893fbb73bd12b2ee38
X-Patchwork-Hint: ignore
Message-Id: <20250814200604.AC03287609@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 package/brcmfmac_sdio-firmware-rpi: bump version to 6596d33
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=443bf63537edcefa5167be893fbb73bd12b2ee38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Changelog:

  - 4eec7f2 Sync with RPiOS 1.2-9+rpt3 bluez/1:20230625-2+rpt3 brcm80211 versions
  - 4c1789e Merge pull request #25 from HiassofT/fw-2024-08
  - e59476f Sync with 1:20240709-2~bpo12+1+rpt3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Fiona: tested on CM4 (upstream kernel 6.16, as AP) and Zero 2W
        (upstream kernel 6.16 as client, RPi kernel 6.12.41 as AP)]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 67c91e85b7ccaef7c9bccb173f75accee9a154dc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash | 2 +-
 package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
index c20abfc26c..aba028ef6a 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2f0917b104739455dd488dd8f5af2ee4430801a7ac8fe8d9866e74bfbb185356  brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf182804ad9dbfea5.tar.gz
+sha256  d9835b33bea65cf15f41753e215a11e5eca818a6e3bfacaa750aeac12456c24f  brcmfmac_sdio-firmware-rpi-6596d332eaadd63e2413e3937715a084f61c39e2.tar.gz
 sha256  ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd599  LICENSE
diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
index 95707487a9..8c04b017e3 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 26ff205b45dc109b498a70aaf182804ad9dbfea5
+BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 6596d332eaadd63e2413e3937715a084f61c39e2
 BRCMFMAC_SDIO_FIRMWARE_RPI_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))
 BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE = PROPRIETARY
 BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
