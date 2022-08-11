Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5896EC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D1440893;
	Thu, 11 Aug 2022 20:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2D1440893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6s9tFhlQC-34; Thu, 11 Aug 2022 20:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1C61402A9;
	Thu, 11 Aug 2022 20:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1C61402A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40CDC1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29C084013D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C084013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jFNpT9PVBzSR for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:55:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C2D8400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C2D8400E2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0F0118737F; Thu, 11 Aug 2022 20:40:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 22:49:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9181bd3ce16429482ef13d97da47dbcd69a0d8e6
X-Git-Newrev: 0b5aaa48d297e56768e7d10f3198dc6ed033317a
X-Patchwork-Hint: ignore
Message-Id: <20220811204059.0F0118737F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imx-mkimage: bump version to
 lf-5.10.72_2.2.0
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
Content-Type: multipart/mixed; boundary="===============8675475279235578141=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8675475279235578141==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0b5aaa48d297e56768e7d10f3198dc6ed033317a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-for-overriding-BL32-and-BL33-not-only-BL.patch | 10 ++++-----
 .../0002-Add-LDFLAGS-to-link-step.patch            | 12 +++++------
 .../imx-mkimage/0003-Add-unused-fake-version.patch |  8 ++++----
 ...support-for-overriding-BL31-BL32-and-BL33.patch | 24 +++++++++++-----------
 package/imx-mkimage/imx-mkimage.hash               |  2 +-
 package/imx-mkimage/imx-mkimage.mk                 |  2 +-
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch b/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
index e8ba820f2f..66891ac8e7 100644
--- a/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
+++ b/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
@@ -1,4 +1,4 @@
-From 4870df3d70e94f9f0d6c06f610cea2d88cd6edb5 Mon Sep 17 00:00:00 2001
+From a4993eda7483cd01662f3f3e2965e7a568cb7178 Mon Sep 17 00:00:00 2001
 From: Erik Larsson <erik.larsson@combitech.se>
 Date: Thu, 8 Mar 2018 19:04:37 +0100
 Subject: [PATCH] Add support for overriding BL32 and BL33 not only BL31
@@ -11,7 +11,7 @@ Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/iMX8M/mkimage_fit_atf.sh b/iMX8M/mkimage_fit_atf.sh
-index 95749b1..c1aa902 100755
+index 4f2b3f3..0444ff0 100755
 --- a/iMX8M/mkimage_fit_atf.sh
 +++ b/iMX8M/mkimage_fit_atf.sh
 @@ -18,23 +18,23 @@ if [ ! -f $BL31 ]; then
@@ -26,7 +26,7 @@ index 95749b1..c1aa902 100755
  
 -BL32="tee.bin"
 +[ -z "$BL32" ] && BL32="tee.bin"
- LOADABLES="\"atf@1\""
+ LOADABLES="\"atf-1\""
  
  if [ ! -f $BL32 ]; then
  	BL32=/dev/null
@@ -36,7 +36,7 @@ index 95749b1..c1aa902 100755
 -	ls -lct tee.bin | awk '{print $5}' >&2
 +	echo "$BL32 size: " >&2
 +	ls -lct $BL32 | awk '{print $5}' >&2
- 	LOADABLES="$LOADABLES, \"tee@1\""
+ 	LOADABLES="$LOADABLES, \"tee-1\""
  fi
  
 -BL33="u-boot-nodtb.bin"
@@ -56,5 +56,5 @@ index 95749b1..c1aa902 100755
  
  for dtname in $*
 -- 
-2.25.1
+2.31.1
 
diff --git a/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch b/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch
index 7272c3ac6c..086e634d23 100644
--- a/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch
+++ b/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch
@@ -1,4 +1,4 @@
-From 3ef9f773ce1a402607957fa73775d2e0a591a1a5 Mon Sep 17 00:00:00 2001
+From b7ace564b419a05a375a205fd4df8933716b241a Mon Sep 17 00:00:00 2001
 From: Erik Larsson <erik.larsson@combitech.se>
 Date: Tue, 6 Mar 2018 12:28:39 +0100
 Subject: [PATCH] Add LDFLAGS to link step
@@ -9,18 +9,18 @@ Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/iMX8M/soc.mak b/iMX8M/soc.mak
-index d714259..aecf84b 100644
+index 4bfdc37..806b805 100644
 --- a/iMX8M/soc.mak
 +++ b/iMX8M/soc.mak
-@@ -67,7 +67,7 @@ FW_DIR = imx-boot/imx-boot-tools/$(PLAT)
+@@ -84,7 +84,7 @@ FW_DIR = imx-boot/imx-boot-tools/$(PLAT)
  $(MKIMG): mkimage_imx8.c
  	@echo "PLAT="$(PLAT) "HDMI="$(HDMI)
  	@echo "Compiling mkimage_imx8"
 -	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) -lz
 +	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) $(LDFLAGS) -lz
  
- u-boot-spl-ddr.bin: u-boot-spl.bin lpddr4_pmu_train_1d_imem.bin lpddr4_pmu_train_1d_dmem.bin lpddr4_pmu_train_2d_imem.bin lpddr4_pmu_train_2d_dmem.bin
- 	@objcopy -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 lpddr4_pmu_train_1d_imem.bin lpddr4_pmu_train_1d_imem_pad.bin
+ lpddr4_imem_1d = lpddr4_pmu_train_1d_imem$(LPDDR_FW_VERSION).bin
+ lpddr4_dmem_1d = lpddr4_pmu_train_1d_dmem$(LPDDR_FW_VERSION).bin
 -- 
-2.25.1
+2.31.1
 
diff --git a/package/imx-mkimage/0003-Add-unused-fake-version.patch b/package/imx-mkimage/0003-Add-unused-fake-version.patch
index 0e817a1ac8..7e8a98c137 100644
--- a/package/imx-mkimage/0003-Add-unused-fake-version.patch
+++ b/package/imx-mkimage/0003-Add-unused-fake-version.patch
@@ -1,4 +1,4 @@
-From b25b4324be4c0dd9ee5fecdf2981d291fb187686 Mon Sep 17 00:00:00 2001
+From 30e81d949d03f24de3b89d14cf98cb7decb2740c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
 Date: Mon, 25 Feb 2019 22:15:55 +0100
 Subject: [PATCH] Add unused fake version
@@ -17,10 +17,10 @@ Signed-off-by: André Hentschel <nerv@dawncrow.de>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 49ef486..b966399 100644
+index 1c0b039..49639a5 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -37,9 +37,7 @@ $(MKIMG): src/build_info.h $(SRCS)
+@@ -41,9 +41,7 @@ $(MKIMG): src/build_info.h $(SRCS)
  bin: $(MKIMG)
  
  src/build_info.h:
@@ -32,5 +32,5 @@ index 49ef486..b966399 100644
  help:
  	@echo $(CURR_DIR)
 -- 
-2.25.1
+2.31.1
 
diff --git a/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch b/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
index 4154b1c4a9..494aaf1566 100644
--- a/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
+++ b/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
@@ -1,4 +1,4 @@
-From 8fc8fc3dfce7533b9c965185277d34e27055cc8f Mon Sep 17 00:00:00 2001
+From b1e77d8ccabc6a3910ede2441ff567326291a355 Mon Sep 17 00:00:00 2001
 From: Thomas Perrot <thomas.perrot@bootlin.com>
 Date: Tue, 26 Apr 2022 15:10:04 +0200
 Subject: [PATCH] Add support for overriding BL31, BL32 and BL33
@@ -9,19 +9,19 @@ Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
  1 file changed, 9 insertions(+), 5 deletions(-)
 
 diff --git a/iMX8M/print_fit_hab.sh b/iMX8M/print_fit_hab.sh
-index b915115d1ecc..dbc28f2d9af5 100755
+index b915115..dbc28f2 100755
 --- a/iMX8M/print_fit_hab.sh
 +++ b/iMX8M/print_fit_hab.sh
 @@ -1,12 +1,16 @@
  #!/bin/bash
-
+ 
 -BL32="tee.bin"
 -
  let fit_off=$1
-
+ 
  # keep backward compatibility
  [ -z "$TEE_LOAD_ADDR" ] && TEE_LOAD_ADDR="0xfe000000"
-
+ 
 +[ -z "$BL31" ] && BL31="bl31.bin"
 +
 +[ -z "$BL32" ] && BL32="tee.bin"
@@ -34,28 +34,28 @@ index b915115d1ecc..dbc28f2d9af5 100755
 @@ -26,7 +30,7 @@ else
  	let uboot_sign_off=$((fit_off - 0x8000 - ivt_off + 0x3000))
  fi
-
+ 
 -let uboot_size=$(ls -lct u-boot-nodtb.bin | awk '{print $5}')
 +let uboot_size=$(ls -lct $BL33 | awk '{print $5}')
  let uboot_load_addr=0x40200000
-
+ 
  let last_sign_off=$(((uboot_sign_off + uboot_size + 3) & ~3))
 @@ -64,13 +68,13 @@ done
-
+ 
  let atf_sign_off=$((last_sign_off))
  let atf_load_addr=$ATF_LOAD_ADDR
 -let atf_size=$(ls -lct bl31.bin | awk '{print $5}')
 +let atf_size=$(ls -lct $BL31 | awk '{print $5}')
-
+ 
  if [ ! -f $BL32 ]; then
  	let tee_size=0x0
  	let tee_sign_off=$((atf_sign_off + atf_size))
  else
 -	let tee_size=$(ls -lct tee.bin | awk '{print $5}')
 +	let tee_size=$(ls -lct $BL32 | awk '{print $5}')
-
+ 
  	let tee_sign_off=$(((atf_sign_off + atf_size + 3) & ~3))
  	let tee_load_addr=$TEE_LOAD_ADDR
---
-2.35.1
+-- 
+2.31.1
 
diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 88fac9bb39..81d99a5d1c 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2746136aa5ed79ba24cfbe877d29022a2a33f6614b1bba728e95d1b2f0448196  imx-mkimage-rel_imx_5.4.70_2.3.0-br1.tar.gz
+sha256  769b3d7376a1f7107ce2958a1babe361bfd29e2cbfbe47eeb2911acc460058e5  imx-mkimage-lf-5.10.72_2.2.0-br1.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index b88be0ca64..0bfca72504 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = rel_imx_5.4.70_2.3.0
+IMX_MKIMAGE_VERSION = lf-5.10.72_2.2.0
 IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
 IMX_MKIMAGE_SITE_METHOD = git
 IMX_MKIMAGE_LICENSE = GPL-2.0+

--===============8675475279235578141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8675475279235578141==--
