Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041F4C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C80F9409F3;
	Thu,  2 May 2024 07:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KcML_zPOdUq; Thu,  2 May 2024 07:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C868409F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C868409F9;
	Thu,  2 May 2024 07:48:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3011BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9E5F41A04
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSQ1GFCm3DBy for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B711C419F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B711C419F3
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:48:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F75E865E3; Thu,  2 May 2024 07:48:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 09:45:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce486bf62ad4e6f00a6e2bab16b55a960cbbc079
X-Git-Newrev: 20b4739c4e113cfd41898f2f1cf3f3c2a06ba21b
X-Patchwork-Hint: ignore
Message-Id: <20240502074841.9F75E865E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdeflate: bump version to 1.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=20b4739c4e113cfd41898f2f1cf3f3c2a06ba21b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
ttps://github.com/ebiggers/libdeflate/blob/master/NEWS.md

Build-tested using this defconfig

BR2_PACKAGE_LIBDEFLATE=y

                             arm-aarch64 [ 1/42]: OK
                   bootlin-aarch64-glibc [ 2/42]: OK
               bootlin-arcle-hs38-uclibc [ 3/42]: OK
                    bootlin-armv5-uclibc [ 4/42]: OK
                     bootlin-armv7-glibc [ 5/42]: OK
                   bootlin-armv7m-uclibc [ 6/42]: OK
                      bootlin-armv7-musl [ 7/42]: OK
                bootlin-m68k-5208-uclibc [ 8/42]: OK
               bootlin-m68k-68040-uclibc [ 9/42]: OK
             bootlin-microblazeel-uclibc [10/42]: OK
                bootlin-mipsel32r6-glibc [11/42]: OK
                   bootlin-mipsel-uclibc [12/42]: OK
                     bootlin-nios2-glibc [13/42]: OK
                 bootlin-openrisc-uclibc [14/42]: OK
        bootlin-powerpc64le-power8-glibc [15/42]: OK
           bootlin-powerpc-e500mc-uclibc [16/42]: OK
                   bootlin-riscv32-glibc [17/42]: OK
                   bootlin-riscv64-glibc [18/42]: OK
                    bootlin-riscv64-musl [19/42]: OK
                 bootlin-s390x-z13-glibc [20/42]: OK
                      bootlin-sh4-uclibc [21/42]: OK
                   bootlin-sparc64-glibc [22/42]: OK
                    bootlin-sparc-uclibc [23/42]: OK
                    bootlin-x86-64-glibc [24/42]: OK
                     bootlin-x86-64-musl [25/42]: OK
                   bootlin-x86-64-uclibc [26/42]: OK
                   bootlin-xtensa-uclibc [27/42]: OK
                            br-arm-basic [28/42]: OK
                    br-arm-full-nothread [29/42]: OK
                      br-arm-full-static [30/42]: OK
                   br-i386-pentium4-full [31/42]: OK
                br-i386-pentium-mmx-musl [32/42]: OK
                      br-mips64-n64-full [33/42]: OK
                 br-mips64r6-el-hf-glibc [34/42]: OK
               br-powerpc-603e-basic-cpp [35/42]: OK
               br-powerpc64-power7-glibc [36/42]: OK
                       linaro-aarch64-be [37/42]: OK
                          linaro-aarch64 [38/42]: OK
                              linaro-arm [39/42]: OK
                         sourcery-mips64 [40/42]: OK
                           sourcery-mips [41/42]: OK
                          sourcery-nios2 [42/42]: OK
42 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdeflate/libdeflate.hash | 2 +-
 package/libdeflate/libdeflate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 8609f5ab02..46afa96635 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  27bf62d71cd64728ff43a9feb92f2ac2f2bf748986d856133cc1e51992428c25  libdeflate-1.19.tar.gz
+sha256  ed1454166ced78913ff3809870a4005b7170a6fd30767dc478a09b96847b9c2a  libdeflate-1.20.tar.gz
 sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 3000a58407..4597dc5a8c 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.19
+LIBDEFLATE_VERSION = 1.20
 LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
