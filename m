Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39163C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 19:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D36B360E71;
	Sun,  6 Aug 2023 19:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D36B360E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGWe7STLlqjr; Sun,  6 Aug 2023 19:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0735F60E46;
	Sun,  6 Aug 2023 19:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0735F60E46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 175961BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFBEE607FE
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFBEE607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DixyDzdBA4UU for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 19:23:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86A5B60A79
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 19:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A5B60A79
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70F0D845A5; Sun,  6 Aug 2023 19:23:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 19:27:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2bd1d9d812d529071e1ab9d8ed8344f8077286d3
X-Git-Newrev: aa17849e8ba216022fff15f2fafb669317c4b237
X-Patchwork-Hint: ignore
Message-Id: <20230806192335.70F0D845A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/firmware-imx: bump version to 8.20
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
Content-Type: multipart/mixed; boundary="===============0794472374604118599=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0794472374604118599==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=aa17849e8ba216022fff15f2fafb669317c4b237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Both the COPYING and EULA files have changed, with the following main
changes:
  - update to copyright years (2022 -> 2023)
  - switch from ASCCI double quotes to fancy Unicode ones ("" -> “”)
  - reflow the license text
  - identify new third-parties and their conditions

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index eb0c387af3..0b3561a927 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  937e196476b8e95b4b7f2501a14c8326d8a0649f8a3f9228b72373770a08deb3  firmware-imx-8.15.bin
-sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
-sha256  30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0a4  EULA
+sha256  f6dc6a5c8fd9b913a15360d3ccd53d188db05a08a8594c518e57622478c72383  firmware-imx-8.20.bin
+sha256  913ba38d4be97361c3d0fa9bf2f6dbe7b1c0c41213dd268fb6738db9704dbe32  COPYING
+sha256  4fd8bb45a2ec22117d20cfea84370e2a3a2cd99e8e177138bed0938137b1aeb3  EULA
 sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 4cceb67019..66ef8c3930 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.15
+FIRMWARE_IMX_VERSION = 8.20
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 

--===============0794472374604118599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0794472374604118599==--
