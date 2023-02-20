Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A893C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA047031C;
	Tue, 21 Feb 2023 02:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA047031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VFemvlNA2lLZ; Tue, 21 Feb 2023 02:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0919E701EA;
	Tue, 21 Feb 2023 02:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0919E701EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C48361BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E8A64F304
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E8A64F304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3SMdufwE6P4 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:47:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 327D24F2F8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327D24F2F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DBAE864D7; Mon, 20 Feb 2023 22:47:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 23:47:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f2c1e10b8ac3531ab5a48e23c23b702cd24b3f73
X-Git-Newrev: cc0d6bdd66e477ee0e3de0538e37d49bdfd7a9e6
X-Patchwork-Hint: ignore
Message-Id: <20230220224732.1DBAE864D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openjdk{-bin}: bump
 versions to 11.0.18+10 and 17.0.6+10
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc0d6bdd66e477ee0e3de0538e37d49bdfd7a9e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk-bin/openjdk-bin.hash                 |  8 ++++----
 package/openjdk-bin/openjdk-bin.mk                   |  4 ++--
 ...01-Add-ARCv2-ISA-processors-support-to-Zero.patch | 20 ++++++++++----------
 package/openjdk/openjdk.hash                         |  4 ++--
 package/openjdk/openjdk.mk                           |  4 ++--
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 4d3942125f..241ca34a04 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,10 +1,10 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  288f34e3ba8a4838605636485d0365ce23e57d5f2f68997ac4c2e4c01967cd48  OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz
-sha256  302caf29f73481b2b914ba2b89705036010c65eb9bc8d7712b27d6e9bedf6200  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.2_8.tar.gz
+sha256  a0b1b9dd809d51a438f5fa08918f9aca7b2135721097f0858cf29f77a35d4289  OpenJDK17U-jdk_x64_linux_hotspot_17.0.6_10.tar.gz
+sha256  9e0e88bbd9fa662567d0c1e22d469268c68ac078e9e5fe5a7244f56fec71f55f  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.6_10.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
-sha256  43fb84f8063ad9bf6b6d694a67b8f64c8827552b920ec5ce794dfe5602edffe7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz
-sha256  79572f5172c6a040591d34632f98a20ed148702bbce2f57649e8ac01c0d2e3db  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.14.1_1.tar.gz
+sha256  4a29efda1d702b8ff38e554cf932051f40ec70006caed5c4857a8cbc7a0b7db7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.18_10.tar.gz
+sha256  04d5eeff6a6449bcdca0f52cd97bafd43ce09d40ef1e73fa0e1add63bea4a9c8  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.18_10.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 608a0bc3ac..c3eb0b05e6 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.2_8
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.6_10
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.14.1_1
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.18_10
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 83%
rename from package/openjdk/17.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index 1ef523a419..dfd3b07bea 100644
--- a/package/openjdk/17.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -23,8 +23,8 @@ diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
 index 5120918aed2..f7a99955874 100644
 --- a/make/autoconf/libraries.m4
 +++ b/make/autoconf/libraries.m4
-@@ -122,6 +122,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
-     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lpthread"
+@@ -146,6 +146,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     fi
    fi
  
 +  # Libatomic library
@@ -55,7 +55,7 @@ index c0f2446dbd7..dc416ece885 100644
      arm*)
        VAR_CPU=arm
        VAR_CPU_ARCH=arm
-@@ -478,6 +484,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
+@@ -563,6 +569,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
      HOTSPOT_$1_CPU_DEFINE=PPC64
  
    # The cpu defines below are for zero, we don't support them directly.
@@ -68,7 +68,7 @@ diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.c
 index b08caf4d5d3..2bf084895ba 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
-@@ -1858,6 +1858,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1674,6 +1674,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
  #ifndef EM_AARCH64
    #define EM_AARCH64    183               /* ARM AARCH64 */
  #endif
@@ -78,7 +78,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #ifndef EM_RISCV
    #define EM_RISCV      243               /* RISC-V */
  #endif
-@@ -1879,6 +1882,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1698,6 +1701,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
      {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
  #endif
      {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
@@ -86,7 +86,7 @@ index b08caf4d5d3..2bf084895ba 100644
      // we only support 64 bit z architecture
      {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
      {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
-@@ -1906,6 +1910,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1726,6 +1730,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_PPC;
  #elif  (defined AARCH64)
    static  Elf32_Half running_arch_code=EM_AARCH64;
@@ -95,12 +95,12 @@ index b08caf4d5d3..2bf084895ba 100644
  #elif  (defined ARM)
    static  Elf32_Half running_arch_code=EM_ARM;
  #elif  (defined S390)
-@@ -1926,7 +1932,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
-   static  Elf32_Half running_arch_code=EM_RISCV;
+@@ -1748,7 +1754,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+   static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
--        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
-+        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
+-        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
  #endif
  
    // Identify compatibility class for VM's architecture and library's architecture
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 293787792d..0a67e7a3ec 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2fdd23261526362d4aaf58323441d4c31d29de2e374ba94bbf2727a00adc0ea7  openjdk-17.0.2+8.tar.gz
-sha256  0e859cc03378439023e17ee82aecee5a52265fb38906a8bebf16027aa2b2bcf5  openjdk-11.0.14.1+1.tar.gz
+sha256  331bad1f80e98761eb9692863146fec647db573db5a5efa5b9bd6326d53a3472  openjdk-17.0.6+10.tar.gz
+sha256  04af71fc7adda41a49861870f9ec0ac0f059c2cf9393ce32995ea8ef4279a1b1  openjdk-11.0.18+10.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 42d52d57c4..0fe506bbfd 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.2+8
+OPENJDK_VERSION_MINOR = 0.6+10
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.14.1+1
+OPENJDK_VERSION_MINOR = 0.18+10
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
