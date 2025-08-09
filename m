Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB36C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 16:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB7A81B04;
	Sat,  9 Aug 2025 16:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3L1ruXxO53cG; Sat,  9 Aug 2025 16:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F8081AF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F8081AF4;
	Sat,  9 Aug 2025 16:18:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FC341D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 763A840B48
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48zS_Kb1QcxX for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 16:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B082540B45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B082540B45
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0E6E82235; Sat,  9 Aug 2025 16:18:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 17:47:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53c0b8c2f24f0c0816206ce643227fc4cc7de739
X-Git-Newrev: 67c91e85b7ccaef7c9bccb173f75accee9a154dc
X-Patchwork-Hint: ignore
Message-Id: <20250809161805.A0E6E82235@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brcmfmac_sdio-firmware-rpi: bump
 version to 6596d33
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67c91e85b7ccaef7c9bccb173f75accee9a154dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  - 4eec7f2 Sync with RPiOS 1.2-9+rpt3 bluez/1:20230625-2+rpt3 brcm80211 versions
  - 4c1789e Merge pull request #25 from HiassofT/fw-2024-08
  - e59476f Sync with 1:20240709-2~bpo12+1+rpt3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Fiona: tested on CM4 (upstream kernel 6.16, as AP) and Zero 2W
        (upstream kernel 6.16 as client, RPi kernel 6.12.41 as AP)]
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
