Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46679C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB4A4363A;
	Fri, 28 Feb 2025 16:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLEelBePfLCB; Fri, 28 Feb 2025 16:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B12924EFE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B12924EFE7;
	Fri, 28 Feb 2025 16:36:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D7FA68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A9A9424C2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmdQOFHEf3WN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B94419C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1B94419C6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEAB3844AB; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 14:27:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f22d4076370a9ac513e17662cc7ce56d5c3ca992
X-Git-Newrev: 5144d2d7aeafcbff1e0c5bf5ad3fc4bb44ca0089
X-Patchwork-Hint: ignore
Message-Id: <20250228162936.CEAB3844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/aarch64_efi: bump
 Linux to 6.11.11
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8207012069652587084=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8207012069652587084==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5144d2d7aeafcbff1e0c5bf5ad3fc4bb44ca0089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump Linux kernel version to 6.11.11 and update the hash accordingly.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/aarch64-efi/patches/linux/linux.hash | 2 +-
 configs/aarch64_efi_defconfig              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/aarch64-efi/patches/linux/linux.hash b/board/aarch64-efi/patches/linux/linux.hash
index 20941a269b..50983eb42b 100644
--- a/board/aarch64-efi/patches/linux/linux.hash
+++ b/board/aarch64-efi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  524858852f5869a9ef17de8b1e6e7faf05bcb2c462bc96b3c24dbf82ede373cf  linux-6.10.12.tar.xz
+sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 9f284ff74b..3aa649cf9c 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/aarch64-efi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/ge
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y

--===============8207012069652587084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8207012069652587084==--
