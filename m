Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E578FC47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BEC26F4A8;
	Thu,  4 Jan 2024 21:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BEC26F4A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQbL5uGwrgJw; Thu,  4 Jan 2024 21:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF6096F49B;
	Thu,  4 Jan 2024 21:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF6096F49B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CACD1BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FF484004D
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF484004D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y2tooRSuuyhO for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D934426D6
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D934426D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29D3083D35; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:12:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b7bac9bb2c1c977e4791c4430e2fff54522f257
X-Git-Newrev: 0ff1235c8ddd33807f263736c46b91d9cc8a7af8
X-Patchwork-Hint: ignore
Message-Id: <20240104212747.29D3083D35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbutils: bump to version 017
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ff1235c8ddd33807f263736c46b91d9cc8a7af8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/gregkh/usbutils/blob/v017/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbutils/usbutils.hash | 2 +-
 package/usbutils/usbutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index caedf5fd80..2c863543f6 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
-sha256  c3b451bb1f4ff9f6356cac5a6956a9ac8e85d81651af56a29e689f94fa6fda6e  usbutils-015.tar.xz
+sha256  a6a25ffdcf9103e38d7a44732aca17073f4e602b92e4ae55625231a82702e05b  usbutils-017.tar.xz
 # Locally calculated
 sha256  91412672119c72352b76c1d48fa1a8b7cdc7f70be7929e468c8805db468e23e4  LICENSES/GPL-2.0-only.txt
 sha256  4631da83311d27f99078d0d102e31bd34a4fcbcc2dae2aa40f1454a5b48125dc  LICENSES/GPL-3.0-only.txt
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 84a6a625cf..c2073df3b3 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBUTILS_VERSION = 015
+USBUTILS_VERSION = 017
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
