Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50210C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECB9D60EEE;
	Mon,  5 Feb 2024 15:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECB9D60EEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKLt111gfw7S; Mon,  5 Feb 2024 15:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3896F60F06;
	Mon,  5 Feb 2024 15:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3896F60F06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17A161BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B39D7419F4
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B39D7419F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMTUkLUDaveJ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:43:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A63740A44
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A63740A44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6421086D51; Mon,  5 Feb 2024 15:43:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 16:41:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4ac946347cc0792956aca4d3ab2252aa9fbe2e9
X-Git-Newrev: 6ff00badaa23549f6a339a43f8ce19b4115a0796
X-Patchwork-Hint: ignore
Message-Id: <20240205154307.6421086D51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/asus_tinker-s_rk3288: bump Linux
 to 6.1.72
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
Content-Type: multipart/mixed; boundary="===============5322611960917455056=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5322611960917455056==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6ff00badaa23549f6a339a43f8ce19b4115a0796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/asus_tinker-s_rk3288_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/asus_tinker-s_rk3288_defconfig b/configs/asus_tinker-s_rk3288_defconfig
index fc1b3b3505..de03336cbb 100644
--- a/configs/asus_tinker-s_rk3288_defconfig
+++ b/configs/asus_tinker-s_rk3288_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.70"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.72"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker-s"

--===============5322611960917455056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5322611960917455056==--
