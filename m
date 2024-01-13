Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D54C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E04EE60EE4;
	Sat, 13 Jan 2024 21:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E04EE60EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrydGUJrr1d3; Sat, 13 Jan 2024 21:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4458060EEE;
	Sat, 13 Jan 2024 21:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4458060EEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71CC41BF868
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B8FF835B1
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B8FF835B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v8MEJz0Jwy2h for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 657E083434
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 657E083434
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FBAB860AC; Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:17:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 083b03aec676534f0170cc2c599e936fd778faf2
X-Git-Newrev: 17c386fca2c529e1adf087a96b391a3619bd02c0
X-Patchwork-Hint: ignore
Message-Id: <20240113213034.4FBAB860AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/asus_tinker-s_rk3288: bump U-boot
 to 2024.01
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
Content-Type: multipart/mixed; boundary="===============6347454316511300976=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6347454316511300976==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=17c386fca2c529e1adf087a96b391a3619bd02c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/asus_tinker-s_rk3288_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/asus_tinker-s_rk3288_defconfig b/configs/asus_tinker-s_rk3288_defconfig
index ad2ccec9f9..fc1b3b3505 100644
--- a/configs/asus_tinker-s_rk3288_defconfig
+++ b/configs/asus_tinker-s_rk3288_defconfig
@@ -10,7 +10,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-s-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y

--===============6347454316511300976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6347454316511300976==--
