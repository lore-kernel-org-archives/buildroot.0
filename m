Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D20CC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 14:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB4183F5C;
	Fri, 16 Sep 2022 14:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DB4183F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dI11WSs-ZJSb; Fri, 16 Sep 2022 14:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD18183F1A;
	Fri, 16 Sep 2022 14:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD18183F1A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3D7D1BF362
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 14:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0138610DD
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 14:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0138610DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZtlAwTTMzxU for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 14:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D186106A
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 14:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0D186106A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E0F0D83D7A; Fri, 16 Sep 2022 14:12:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 16:11:12 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 2e62586c7ddbb2da11d58186ff20ded4b475926e
X-Git-Newrev: f8949e4526df03f80a77d5c00b07e2d3c2ef819f
X-Patchwork-Hint: ignore
Message-Id: <20220916141236.E0F0D83D7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/qoriq-cadence-dp-firmware: fix license info
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8949e4526df03f80a77d5c00b07e2d3c2ef819f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a0ad1a68692d55aef407b8862a836ad1bcbf5897)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash | 2 ++
 package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
index d302d92783..88ac3db977 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -1,3 +1,5 @@
 # Locally calculated
 sha256  5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
 sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+sha256  53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  EULA.txt
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 23643d24e0..7d701c4ac2 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -7,8 +7,8 @@
 QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk1909
 QORIQ_CADENCE_DP_FIRMWARE_SITE = http://www.nxp.com/lgfiles/sdk/$(QORIQ_CADENCE_DP_FIRMWARE_VERSION)
 QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
-QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP-Binary-EULA
-QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING
+QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
+QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING EULA EULA.txt
 QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
