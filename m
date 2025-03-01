Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50168C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F32DD8224A;
	Tue, 18 Mar 2025 15:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zK-MjzCztZXn; Tue, 18 Mar 2025 15:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE8DD827A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE8DD827A1;
	Tue, 18 Mar 2025 15:03:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12FA9D5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEDEA814BB
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evPKnmO7LD27 for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80AE28156A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80AE28156A
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AE03880EC; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 11:32:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe08ec9efa6ec9a2506f7e3ffcb83c14b96b55ec
X-Git-Newrev: 793b45cea77ed645f6800240811d03f8be392ccd
X-Patchwork-Hint: ignore
Message-Id: <20250318150242.7AE03880EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/freescale-imx/imx-vpu-hantro-daemon: bump version to 1.4.0
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
Content-Type: multipart/mixed; boundary="===============3161238544693263347=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3161238544693263347==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=793b45cea77ed645f6800240811d03f8be392ccd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with NXP Linux BSP version "lf-6.6.52-2.2.0".

Add SCR-imx-vpu-hantro-daemon.txt to _LICENSE_FILES.

Note: in this release, the package source archive name changed to
include a revision. This commit adds a new _REVISION variable with the
value published in the corresponding NXP BSP.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: fixed the bsp version name in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash  | 3 ++-
 .../freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk    | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
index 0fd64cdf9d..0f3ca60865 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  80d6620063fd5e5506b05c907677b579d471a9b6daa8b26ffb963110cc680bf9  imx-vpu-hantro-daemon-1.1.9.tar.gz
+sha256  c3ac36c203fef44ef21c98a90b3fff73af9f328f16b4d85157308848f6c34823  imx-vpu-hantro-daemon-1.4.0-75d9dd9.tar.gz
 sha256  bb645f02b260955f333348100e40af76253e2cd8b116bac047230439dd53ec5a  LICENSE.txt
+sha256  c61176048f74950c0849d91b4b6b30e335e050462a8950b89a4e6f35c7fe577b  SCR-imx-vpu-hantro-daemon.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
index 12ec055f92..a328005328 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.9
+IMX_VPU_HANTRO_DAEMON_VERSION = 1.4.0
+IMX_VPU_HANTRO_DAEMON_REVISION = 75d9dd9
+IMX_VPU_HANTRO_DAEMON_SOURCE = imx-vpu-hantro-daemon-$(IMX_VPU_HANTRO_DAEMON_VERSION)-$(IMX_VPU_HANTRO_DAEMON_REVISION).tar.gz
 IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
-IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = LICENSE.txt
+IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = LICENSE.txt SCR-imx-vpu-hantro-daemon.txt
 IMX_VPU_HANTRO_DAEMON_REDISTRIBUTE = NO
 IMX_VPU_HANTRO_DAEMON_DEPENDENCIES = imx-vpu-hantro linux
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)

--===============3161238544693263347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3161238544693263347==--
