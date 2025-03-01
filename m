Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D30C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 12:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B136FCBF;
	Sat,  1 Mar 2025 12:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xs7jNgG8H2z6; Sat,  1 Mar 2025 12:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A93B6FCDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A93B6FCDF;
	Sat,  1 Mar 2025 12:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0958B791
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC98E42FDD
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7drgiFNuLHj5 for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 12:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D49AA42ECA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D49AA42ECA
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF23087E7F; Sat,  1 Mar 2025 12:49:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 11:31:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9d4dcf5b0cff580ce3a96ceb58c9085fac18d92b
X-Git-Newrev: 6295c5ef567d8500d6a8d1ee9e29396d39fa4a67
X-Patchwork-Hint: ignore
Message-Id: <20250301124922.BF23087E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/firmware-imx: bump version to 8.26
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870494841331912287=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1870494841331912287==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6295c5ef567d8500d6a8d1ee9e29396d39fa4a67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version is aligned with NXP Linux BSP version "lf-6.6.52-2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v56 April 2024" to "v57 July 2024".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: fixed the bsp version name in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index d606ae6da6..606075c85e 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2e27962332197ebebbb30138f6dfb365361d48d7efa565df97c4f79285b1ca50  firmware-imx-8.24-fbe0a4c.bin
-sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
-sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
+sha256  b2fcf84a0417678aa441b1bcde9ece467f8bd063a63d8390684f8e37768d84cf  firmware-imx-8.26-d4c33ab.bin
+sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
+sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
 sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 8666d76a73..62077238a7 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.24
-FIRMWARE_IMX_REVISION = fbe0a4c
+FIRMWARE_IMX_VERSION = 8.26
+FIRMWARE_IMX_REVISION = d4c33ab
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION)-$(FIRMWARE_IMX_REVISION).bin
 

--===============1870494841331912287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1870494841331912287==--
