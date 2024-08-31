Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F515CD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAA9F840C3;
	Sat, 31 Aug 2024 17:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8jzgKN7hTOQ; Sat, 31 Aug 2024 17:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE699840C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE699840C5;
	Sat, 31 Aug 2024 17:13:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3F7A1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9148D840CD
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvSR0hu5IfX5 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6176840C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6176840C3
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:13:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0E61867F0; Sat, 31 Aug 2024 17:13:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 18:54:44 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c07502e827de7ce9ae4457d113c35ad0fba66355
X-Git-Newrev: 1ba78a69fd34f99282f47b78891e98d7c9c62b2f
X-Patchwork-Hint: ignore
Message-Id: <20240831171343.B0E61867F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/uuu: update
 upstream link
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ba78a69fd34f99282f47b78891e98d7c9c62b2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

NXP repositories moved to a new location. The old URL redirects to the
new one.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3f31c4ef33eff191fc17cd0f8aa4d3d4ad9ed2c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uuu/Config.in.host | 2 +-
 package/uuu/uuu.mk         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/Config.in.host b/package/uuu/Config.in.host
index 0ed064feb6..99f20ee070 100644
--- a/package/uuu/Config.in.host
+++ b/package/uuu/Config.in.host
@@ -12,7 +12,7 @@ config BR2_PACKAGE_HOST_UUU
 	    sudo sh -c "uuu -udev >> /etc/udev/rules.d/70-uuu.rules"
 	    sudo udevadm control --reload
 
-	  https://github.com/NXPmicro/mfgtools
+	  https://github.com/nxp-imx/mfgtools
 
 comment "host uuu needs a toolchain w/ host gcc >= 4.9"
 	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index b6611dc3d4..d9e4e148a7 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -6,7 +6,7 @@
 
 UUU_VERSION = 1.5.177
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
-UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
+UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE
 HOST_UUU_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
