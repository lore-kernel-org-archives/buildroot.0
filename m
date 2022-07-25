Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A8EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40BC83DF1;
	Mon, 25 Jul 2022 22:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40BC83DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0J8UtaC4_GRa; Mon, 25 Jul 2022 22:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9A1383E20;
	Mon, 25 Jul 2022 22:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9A1383E20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0271BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1636C41A5D
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1636C41A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dMCLJEdt0Q22 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37C0D41A4A
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C0D41A4A
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E4B5285E6B; Mon, 25 Jul 2022 22:15:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 00:14:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44e071abb6b4e3aeba7e75693ddc00d6920f2f7e
X-Git-Newrev: 03739a936e60d7e315a89f4bcf79fbb0043ece35
X-Patchwork-Hint: ignore
Message-Id: <20220725221520.E4B5285E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvidia-driver: bump version to
 390.151
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

commit: https://git.buildroot.net/buildroot/commit/?id=03739a936e60d7e315a89f4bcf79fbb0043ece35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for Linux kernel 5.17.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nvidia-driver/nvidia-driver.hash | 6 +++---
 package/nvidia-driver/nvidia-driver.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 7f2248d0f9..620112e6c8 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
-sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
-sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
+sha256  94e399b459659c12b1344e8c8f4f5eee1ed5915ff459fc8bb831c9e1d44677db  NVIDIA-Linux-x86-390.151.run
+sha256  6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  NVIDIA-Linux-x86_64-390.151-no-compat32.run
+sha256  bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index ec070e3ca6..f1217b00aa 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 390.132
+NVIDIA_DRIVER_VERSION = 390.151
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
