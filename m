Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C12C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E3C940C80;
	Wed, 11 Jan 2023 09:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3C940C80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6zCJ2liGnUX; Wed, 11 Jan 2023 09:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD0D140C9B;
	Wed, 11 Jan 2023 09:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD0D140C9B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC531BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F10F40C89
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F10F40C89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsnJ1cOEcruD for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CD2840AAD
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CD2840AAD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BA9287818; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 22:40:19 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: bafb32a406e9335d33ac9048e4111e92ec7dc891
X-Git-Newrev: c694e0787b49f040843b4388c7513c93094be20b
X-Patchwork-Hint: ignore
Message-Id: <20230111092533.3BA9287818@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=c694e0787b49f040843b4388c7513c93094be20b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
