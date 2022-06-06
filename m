Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D44C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6BC841747;
	Mon,  6 Jun 2022 10:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikX0BPPa4ZpN; Mon,  6 Jun 2022 10:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879A7416E0;
	Mon,  6 Jun 2022 10:32:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05DA11BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8788402F7
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t4B4zRD2p87o for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0942D400EF
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:31:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1524886CC0; Mon,  6 Jun 2022 10:19:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 12:05:26 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9d471142493dd011681c7d2236e86da6ad04c4d5
X-Git-Newrev: e9524de9ca4472a78e4e42fe99b591ad6d43e5df
X-Patchwork-Hint: ignore
Message-Id: <20220606101958.1524886CC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/edk2: fix patch line
 ending
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9524de9ca4472a78e4e42fe99b591ad6d43e5df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The patch 0001 from [1] has been corrupted on the
ML or patchwork.

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20220527112146.387164-1-romain.naour@gmail.com/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e7da09eb6dbd89f55bc62e222875ff69304c1e2b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
