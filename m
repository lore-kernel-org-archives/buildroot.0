Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822F1CD128A
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C55C6076D;
	Tue,  9 Apr 2024 20:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKB5v3lPgXc5; Tue,  9 Apr 2024 20:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B3CB60E33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B3CB60E33;
	Tue,  9 Apr 2024 20:51:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE731BF969
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C577415DC
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ydn9O3PpLZQp for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66933415C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66933415C3
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B8C185E38; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 9 Apr 2024 14:12:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8259f935740322b0a3834eaa1071ec6bd3f1bc2
X-Git-Newrev: b460c7258797e4b335bd60d03c823489c7c4a9cb
X-Patchwork-Hint: ignore
Message-Id: <20240409205030.4B8C185E38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am64x_sk_defconfig: bump Linux
 version to 6.6.18
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
Content-Type: multipart/mixed; boundary="===============4536903213868485459=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4536903213868485459==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b460c7258797e4b335bd60d03c823489c7c4a9cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
Tested-by: Andreas Dannenberg <dannenberg@ti.com>
Tested-by: Gero Schwäricke <gero.schwaericke@grandcentrix.net>
Tested-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/ti/am64x-sk/patches/linux-headers/linux-headers.hash | 1 +
 board/ti/am64x-sk/patches/linux/linux.hash                 | 2 ++
 configs/ti_am64x_sk_defconfig                              | 5 +++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/board/ti/am64x-sk/patches/linux-headers/linux-headers.hash b/board/ti/am64x-sk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/ti/am64x-sk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/ti/am64x-sk/patches/linux/linux.hash b/board/ti/am64x-sk/patches/linux/linux.hash
new file mode 100644
index 0000000000..cedae67f33
--- /dev/null
+++ b/board/ti/am64x-sk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index eaeccde316..56e1b23335 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,13 +1,14 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
 BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"

--===============4536903213868485459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4536903213868485459==--
