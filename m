Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8692C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4331261083;
	Wed, 11 Jan 2023 09:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4331261083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfXnIH6MJC5x; Wed, 11 Jan 2023 09:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9723C60B2A;
	Wed, 11 Jan 2023 09:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9723C60B2A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD811BF95E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD62D60B2A
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD62D60B2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiZFMxFUOtTK for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24667607B5
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24667607B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11446878DE; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 22:40:09 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 63106ccf658fd4f9c2150d7c60f8cc2a43745f09
X-Git-Newrev: 572bd5b703c19de9ab99b2ec4b5d64c750018ad1
X-Patchwork-Hint: ignore
Message-Id: <20230111093332.11446878DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/qcom-db410c-firmware: fix typo for <pkg>_LICENSE
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

commit: https://git.buildroot.net/buildroot/commit/?id=572bd5b703c19de9ab99b2ec4b5d64c750018ad1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Cc: Mike Frampton <mikeframpo@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aa35d8d071faf68abc4538be2a3bb636ea6b4a2c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qcom-db410c-firmware/qcom-db410c-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qcom-db410c-firmware/qcom-db410c-firmware.mk b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
index 9ef32cc9d4..cf4b59b72e 100644
--- a/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
+++ b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
@@ -8,7 +8,7 @@ QCOM_DB410C_FIRMWARE_VERSION = 1034.2.1
 QCOM_DB410C_FIRMWARE_BASE = linux-board-support-package-r$(QCOM_DB410C_FIRMWARE_VERSION)
 QCOM_DB410C_FIRMWARE_SOURCE = $(QCOM_DB410C_FIRMWARE_BASE).zip
 QCOM_DB410C_FIRMWARE_SITE = https://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware
-QCOM_DB410C_FIRMWARE_LICENCE = Qualcomm firmware license
+QCOM_DB410C_FIRMWARE_LICENSE = Qualcomm firmware license
 QCOM_DB410C_FIRMWARE_LICENSE_FILES = LICENSE
 QCOM_DB410C_FIRMWARE_DEPENDENCIES = host-mtools
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
