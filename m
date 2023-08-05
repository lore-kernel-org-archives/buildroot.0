Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF67C00528
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 22:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D280402D7;
	Sat,  5 Aug 2023 22:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D280402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiRWRg_KwQPg; Sat,  5 Aug 2023 22:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F8A54148B;
	Sat,  5 Aug 2023 22:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F8A54148B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5969A1BF85D
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF13A81EEE
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF13A81EEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4qUlKs8Chax for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 22:26:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1994781E6C
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 22:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1994781E6C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0864B8425D; Sat,  5 Aug 2023 22:26:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 00:00:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: db8c5b35f29a163b7e72ca9e280904b76e6ff391
X-Git-Newrev: b86708826bcbbc1f1af01ed84f3e13dc9538ac6b
X-Patchwork-Hint: ignore
Message-Id: <20230805222638.0864B8425D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: bump
 version to 20230804
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

commit: https://git.buildroot.net/buildroot/commit/?id=b86708826bcbbc1f1af01ed84f3e13dc9538ac6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Updated license hash due to various commits:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 25b6d018a1..7ba9537dd8 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d  linux-firmware-20230625.tar.xz
+sha256  88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688  linux-firmware-20230804.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -35,6 +35,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  cb91afd4cf763c316d3cb6acc20a63a58d3c7e7b3ff03f254285a4414aeb76f9  WHENCE
+sha256  0f87f8f67de39828d8e59c69369f850e0a80de638795e22ddfdd1f7f31cdf889  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 01718fa1e0..a1cec90de2 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20230625
+LINUX_FIRMWARE_VERSION = 20230804
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
