Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF733C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:39:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F8996117A
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F8996117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D4E660D74;
	Wed, 13 Oct 2021 19:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1C2lcG1XBv0x; Wed, 13 Oct 2021 19:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568FF60D6E;
	Wed, 13 Oct 2021 19:39:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 957031BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5378D832D8
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcC9nZLDNIa2 for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:38:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78887832D4
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:38:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CD97B95B2E; Wed, 13 Oct 2021 19:35:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:48:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f7b2c0dce599ab7050f2bfa201dedb164b63c69
X-Git-Newrev: 414492a7a63d835fe7df14e94990df67f20ad65e
X-Patchwork-Hint: ignore
Message-Id: <20211013193533.CD97B95B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro: bump
 version to 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=414492a7a63d835fe7df14e94990df67f20ad65e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match NXP 5.10.35-2.0.0 release.

Refresh patch 0001.

Various updates to the license files, but still NXP license.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...Fix-ion.h-header-inclusion-to-be-standard.patch | 43 +++++++++++-----------
 .../imx-vpu-hantro/imx-vpu-hantro.hash             |  6 +--
 .../freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk |  2 +-
 3 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
index f5a67cd514..7a89dd99e0 100644
--- a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
+++ b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
@@ -1,6 +1,6 @@
-From e776e7360f80da9ac03f81a5df27d8b7fabc7ac7 Mon Sep 17 00:00:00 2001
+From dfe8ef9123936d2c1d5da34f63f661849171d5ef Mon Sep 17 00:00:00 2001
 From: Gary Bisson <gary.bisson@boundarydevices.com>
-Date: Thu, 26 Mar 2020 16:00:33 +0100
+Date: Sun, 3 Oct 2021 16:39:29 -0700
 Subject: [PATCH] Fix ion.h header inclusion to be standard
 
 NXP "solution" was to manually copy the header to include/linux.
@@ -8,6 +8,7 @@ Let's point the Makefile to the proper (mainline) location instead:
 https://elixir.bootlin.com/linux/v4.17/source/drivers/staging/android/uapi/ion.h
 
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
 ---
  Makefile_G1G2                                             | 4 ++--
  Makefile_H1                                               | 4 ++--
@@ -16,7 +17,7 @@ Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
  4 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile_G1G2 b/Makefile_G1G2
-index 8280cce..4c9fc34 100755
+index 8f83391..25884fa 100755
 --- a/Makefile_G1G2
 +++ b/Makefile_G1G2
 @@ -10,8 +10,8 @@ INCLUDE_HEADERS = -I./decoder_sw -I$(SOURCE_ROOT)/source/inc -I$(SOURCE_ROOT)/so
@@ -31,10 +32,10 @@ index 8280cce..4c9fc34 100755
  CFLAGS += -DDEC_MODULE_PATH=\"/dev/mxc_hantro\" -DUSE_FAKE_RFC_TABLE -DFIFO_DATATYPE=void* -DNDEBUG -DDOWN_SCALER \
             -DUSE_EXTERNAL_BUFFER -DUSE_FAST_EC -DUSE_VP9_EC -DGET_FREE_BUFFER_NON_BLOCK \
 diff --git a/Makefile_H1 b/Makefile_H1
-index 9ab62e1..8d366e3 100755
+index 0979571..479940a 100755
 --- a/Makefile_H1
 +++ b/Makefile_H1
-@@ -17,8 +17,8 @@ ENV += -DMEMALLOC_MODULE_PATH=\\\"/dev/ion\\\"
+@@ -17,8 +17,8 @@ ENV = -DENC_MODULE_PATH=\\\"/dev/mxc_hantro_h1\\\"
  #ENV += -DSDRAM_LM_BASE=0x00000000
  ENV += -DEWL_NO_HW_TIMEOUT
  ENV += -DUSE_ION
@@ -43,34 +44,34 @@ index 9ab62e1..8d366e3 100755
 +ENV += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
 +ENV += -I$(LINUX_KERNEL_ROOT)/drivers/staging/android/uapi
  
- LIBENCNAME = libcodec_enc
- LIBSENC = -L./ -lhantro_h1 -lpthread
+ ifeq ($(CFG_SECURE_DATA_PATH), y)
+ ENV += -DCFG_SECURE_DATA_PATH
 diff --git a/decoder_sw/software/linux/dwl/dwl_linux.c b/decoder_sw/software/linux/dwl/dwl_linux.c
-index 9b057f0..43225f6 100755
+index 7d5e33b..c0e5727 100755
 --- a/decoder_sw/software/linux/dwl/dwl_linux.c
 +++ b/decoder_sw/software/linux/dwl/dwl_linux.c
-@@ -41,7 +41,7 @@
- #include "dwl.h"
- #include <linux/hantrodec.h>
- #ifdef USE_ION
+@@ -50,7 +50,7 @@
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
+ #include <linux/dma-heap.h>
+ #else
 -#include <linux/ion.h>
 +#include <ion.h>
- #include <linux/dma-buf.h>
- #include <linux/version.h>
+ #endif
  #ifdef ANDROID
+ #include <linux/mxc_ion.h>
 diff --git a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
-index fef1307..20b6f95 100755
+index 312e4cc..70630c3 100755
 --- a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
 +++ b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
-@@ -49,7 +49,7 @@
- 
- #include "linux/hx280enc.h"
- #ifdef USE_ION
+@@ -52,7 +52,7 @@
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
+ #include <linux/dma-heap.h>
+ #else
 -#include <linux/ion.h>
 +#include <ion.h>
+ #endif
  #include <linux/dma-buf.h>
  #include <linux/version.h>
- #ifdef ANDROID
 -- 
-2.25.1
+2.31.1
 
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
index e9df63bfca..dd3b167e3e 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  419725f0c09f5939c88cd234b729c3943cbd37e53db7352b02c8d6cc05b939b9  imx-vpu-hantro-1.21.0.bin
-sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
-sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
+sha256  03c61dfb268b31a0d25a4d1387cb3ad0261029ad5de801f72224602e2b37da00  imx-vpu-hantro-1.22.0.bin
+sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
+sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
index 0d075c49c0..360591b444 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VERSION = 1.21.0
+IMX_VPU_HANTRO_VERSION = 1.22.0
 IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
 IMX_VPU_HANTRO_DEPENDENCIES = linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
