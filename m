Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB04C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 11:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE0D61089;
	Sun, 20 Jul 2025 11:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-UhGqkehN-B; Sun, 20 Jul 2025 11:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC8860F03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC8860F03;
	Sun, 20 Jul 2025 11:18:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83A37117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69E9661056
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ebcxz17--gFT for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 11:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A529B606FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A529B606FF
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:18:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 933EE867DD; Sun, 20 Jul 2025 11:18:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:01:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea797e760bc1d30ca5d8db042528bf3d1042a0f9
X-Git-Newrev: 90aa3e120d1ee2829deb2bc7cc538e37d0bfad14
X-Patchwork-Hint: ignore
Message-Id: <20250720111824.933EE867DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino_lime*: bump
 Linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=90aa3e120d1ee2829deb2bc7cc538e37d0bfad14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig        | 2 +-
 configs/olimex_a20_olinuxino_lime_defconfig         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index f8829b0ffd..49740ece9d 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9ee45843d43adb2e2ac5f6a8cb10a334e39e3e3384af8a0ce383a37f78221bdd  linux-6.6.96.tar.xz
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 161b030001..3e86696b4b 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 0662247427..524dc08008 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
