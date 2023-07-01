Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95840EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F67860B98;
	Sat,  1 Jul 2023 14:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F67860B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9x84jwxR2Rce; Sat,  1 Jul 2023 14:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8115C60AEC;
	Sat,  1 Jul 2023 14:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8115C60AEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC831BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 731838122D
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 731838122D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kMPtzAF3nmIL for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:43:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 833CC811FC
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 833CC811FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7348C86095; Sat,  1 Jul 2023 14:43:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 16:41:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c9b853093f44c45348947783297ed79e40101f2
X-Git-Newrev: dae54143f596e6e36f4b93b11ae0e66f5f983ed7
X-Patchwork-Hint: ignore
Message-Id: <20230701144338.7348C86095@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: bump to version 1.5.104
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

commit: https://git.buildroot.net/buildroot/commit/?id=dae54143f596e6e36f4b93b11ae0e66f5f983ed7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.104

The changes to README.md are not related to license modifications.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uuu/uuu.hash | 4 ++--
 package/uuu/uuu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index a5b665620c..a35970c54f 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  e89d3665af499ab71360d948176cf64619b082f8272a994d1fbfc000e67c0f14  uuu_source-1.5.21.tar.gz
+sha256  f95ef6e5f4feb8b3e8d2c1163c35415263c82ac4ba3a51bcf4e3d59d3eebd063  uuu_source-uuu_1.5.104.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
+sha256  f68fb8c8002c797a14e63f91963ac247034fdfd44275e4f4a3226111cd0423db  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 1a5f84ce4d..07dd6ce5b3 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.21
-UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
+UUU_VERSION = 1.5.104
+UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
