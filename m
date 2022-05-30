Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC1FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5446141B8B;
	Mon, 30 May 2022 20:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMekvgBtjYkn; Mon, 30 May 2022 20:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAC3F41B7E;
	Mon, 30 May 2022 20:28:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D4741BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE81841B7E
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hdJvYHB22ep for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:28:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11C9241B6F
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2E633867CF; Mon, 30 May 2022 20:17:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:28:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55d164bf5d88669bad2bc52eb38eaab06619a027
X-Git-Newrev: e7da09eb6dbd89f55bc62e222875ff69304c1e2b
X-Patchwork-Hint: ignore
Message-Id: <20220530201712.2E633867CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: fix patch line ending
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7da09eb6dbd89f55bc62e222875ff69304c1e2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch 0001 from [1] has been corrupted on the
ML or patchwork.

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20220527112146.387164-1-romain.naour@gmail.com/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
index 15abdb2840..f4f1b1565a 100644
--- a/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
+++ b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
@@ -22,27 +22,27 @@ index 7529e03e85..b2ce97ca37 100644
 --- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
 +++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
 @@ -285,7 +285,7 @@ UsbHcBulkTransfer (
-   IN  UINT8                               DevSpeed,
-   IN  UINTN                               MaxPacket,
-   IN  UINT8                               BufferNum,
--  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
-+  IN  OUT VOID                            *Data[],
-   IN  OUT UINTN                           *DataLength,
-   IN  OUT UINT8                           *DataToggle,
-   IN  UINTN                               TimeOut,
+   IN  UINT8                               DevSpeed,
+   IN  UINTN                               MaxPacket,
+   IN  UINT8                               BufferNum,
+-  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
++  IN  OUT VOID                            *Data[],
+   IN  OUT UINTN                           *DataLength,
+   IN  OUT UINT8                           *DataToggle,
+   IN  UINTN                               TimeOut,
 diff --git a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
 index 1d2b8a6174..1316a5981f 100644
 --- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
 +++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
 @@ -149,7 +149,7 @@ UsbHcBulkTransfer (
-   IN  UINT8                               DevSpeed,
-   IN  UINTN                               MaxPacket,
-   IN  UINT8                               BufferNum,
--  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
-+  IN  OUT VOID                            *Data[],
-   IN  OUT UINTN                           *DataLength,
-   IN  OUT UINT8                           *DataToggle,
-   IN  UINTN                               TimeOut,
+   IN  UINT8                               DevSpeed,
+   IN  UINTN                               MaxPacket,
+   IN  UINT8                               BufferNum,
+-  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
++  IN  OUT VOID                            *Data[],
+   IN  OUT UINTN                           *DataLength,
+   IN  OUT UINT8                           *DataToggle,
+   IN  UINTN                               TimeOut,
 -- 
 2.35.3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
