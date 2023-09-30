Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10F1E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E6444224B;
	Sat, 30 Sep 2023 16:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E6444224B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBBrT58jiUbu; Sat, 30 Sep 2023 16:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279FF424EB;
	Sat, 30 Sep 2023 16:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279FF424EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 891981BF3B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6270360BF7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6270360BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0tYrsP-9OkL for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 767B360BD3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 767B360BD3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61BDD83BCC; Sat, 30 Sep 2023 16:05:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:02:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91a8088555167f8e4084873400d88d4381ea9cbd
X-Git-Newrev: d8593d6bad944209687b38eee6e1fdf5b9fd4a7a
X-Patchwork-Hint: ignore
Message-Id: <20230930160521.61BDD83BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/freescale-imx/imx-vpu-hantro-daemon: bump version to 1.1.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8593d6bad944209687b38eee6e1fdf5b9fd4a7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match NXP 6.1.22-2.0.0 release.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash | 2 +-
 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
index e952491a60..2992baead8 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  83ba2798564702d74ab65f6238f95f59247d983b846de1de4c19bdfaf6dabeb8  imx-vpu-hantro-daemon-1.1.4.tar.gz
+sha256  111cb6d5970f76aa3619cfd1a59a251d590fc474f84aad2d4d4083c2a4264fc8  imx-vpu-hantro-daemon-1.1.7.tar.gz
 sha256  bb645f02b260955f333348100e40af76253e2cd8b116bac047230439dd53ec5a  LICENSE.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
index 4f6f166b60..ab4746beb4 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.4
+IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.7
 IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
