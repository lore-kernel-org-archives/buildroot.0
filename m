Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7C0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DBCA408BA;
	Sat,  8 Jan 2022 17:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoaWT6-6sJg7; Sat,  8 Jan 2022 17:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A966408B6;
	Sat,  8 Jan 2022 17:29:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28D591BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18725408B2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:28:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ACQ0ckmrFvvH for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:28:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7888408B1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2381182A9C; Sat,  8 Jan 2022 17:22:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:26:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e39379ff595d189c714bb758f5da1a0882fa1a2a
X-Git-Newrev: a1a48f1bac19ac679803353bd048d91d02ffd75d
X-Patchwork-Hint: ignore
Message-Id: <20220108172225.2381182A9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/raspberrypi-usbboot: bump to
 version 2021.07.01
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1a48f1bac19ac679803353bd048d91d02ffd75d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/raspberrypi-usbboot/raspberrypi-usbboot.hash | 2 +-
 package/raspberrypi-usbboot/raspberrypi-usbboot.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
index 3f66b12ff1..cedc5fb7e1 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e4a07df05c23e0eba100d4013367e7823e3b8bc72da7b79b031bd346616c6ae5  raspberrypi-usbboot-9324fd7034b9d3606aed8a27da74d6d57e066e7e.tar.gz
+sha256  4565314b38e7c7505b7d32a3b51b49f79c7dd5767d45b86d38e5255ae7489a43  raspberrypi-usbboot-2021.07.01.tar.gz
 
 # License files
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
index 5d7b433c64..2e4194da0b 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-RASPBERRYPI_USBBOOT_VERSION = 9324fd7034b9d3606aed8a27da74d6d57e066e7e
-RASPBERRYPI_USBBOOT_SITE = $(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
+RASPBERRYPI_USBBOOT_VERSION = 2021.07.01
+RASPBERRYPI_USBBOOT_SITE = \
+	$(call github,raspberrypi,usbboot,v$(RASPBERRYPI_USBBOOT_VERSION))
 RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
 RASPBERRYPI_USBBOOT_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
