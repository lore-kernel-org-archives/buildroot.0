Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F24C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29CA7412CC;
	Fri, 12 Jul 2024 09:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-npZbgEnqjo; Fri, 12 Jul 2024 09:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1981412D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1981412D4;
	Fri, 12 Jul 2024 09:39:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38A0A1BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25DE060653
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxqRBJWGUoy9 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED3C260636
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED3C260636
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:39:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFCF67FE55; Fri, 12 Jul 2024 09:39:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:08:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ecd58b5c1f65e81b4522310460bf7986e02ddce
X-Git-Newrev: 9e50b643ad9a3afb7d2201faef7ac6385e5c3c52
X-Patchwork-Hint: ignore
Message-Id: <20240712093904.DFCF67FE55@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/freescale-imx/imx-vpu-hantro-daemon: bump to version 1.1.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9e50b643ad9a3afb7d2201faef7ac6385e5c3c52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- To match NXP 6.1.55-2.2.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v49.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash | 2 +-
 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
index 2992baead8..0fd64cdf9d 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  111cb6d5970f76aa3619cfd1a59a251d590fc474f84aad2d4d4083c2a4264fc8  imx-vpu-hantro-daemon-1.1.7.tar.gz
+sha256  80d6620063fd5e5506b05c907677b579d471a9b6daa8b26ffb963110cc680bf9  imx-vpu-hantro-daemon-1.1.9.tar.gz
 sha256  bb645f02b260955f333348100e40af76253e2cd8b116bac047230439dd53ec5a  LICENSE.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
index ab4746beb4..12ec055f92 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.7
+IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.9
 IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
