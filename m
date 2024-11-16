Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31E1D68BF5
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 18:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 780A660709;
	Sat, 16 Nov 2024 18:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPLNuPlkI57o; Sat, 16 Nov 2024 18:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C326F6070C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C326F6070C;
	Sat, 16 Nov 2024 18:51:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 173AAB14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC70060712
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhBdbncdsGNQ for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 18:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08A3F6070C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08A3F6070C
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:51:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDD49863EC; Sat, 16 Nov 2024 18:51:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Nov 2024 19:42:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6f594a546bb87c27e3d222c60f963a84ea0e1967
X-Git-Newrev: d6c14a6bc8cb8ef4d2c71e35e9d7d35905ce0347
X-Patchwork-Hint: ignore
Message-Id: <20241116185128.EDD49863EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uuu: bump to version
 1.5.191
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6c14a6bc8cb8ef4d2c71e35e9d7d35905ce0347
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add python binding

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.191

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 9dc286c41f..8460481e0f 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  723d3da358e6af974a056e3adbcb105fac9dad4b87544de0d22b8c974a8037aa  uuu_source-uuu_1.5.182.tar.gz
+sha256  28792a9776d1ee73f6f20f7c49a7b81dcab10311733c5becac8928145fc86170  uuu_source-uuu_1.5.191.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index e57828a0ca..8faadc0201 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.182
+UUU_VERSION = 1.5.191
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
