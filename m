Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E69C7EE24
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE1674286C;
	Fri,  2 Jun 2023 20:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE1674286C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-zBqwd2jXjU; Fri,  2 Jun 2023 20:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125E942874;
	Fri,  2 Jun 2023 20:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125E942874
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C13AA1BF97E
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90091616C8
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 20:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90091616C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NovVRxUbuTVU for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 20:24:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D48160ADC
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 20:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D48160ADC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C00186BCA; Fri,  2 Jun 2023 20:24:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 22:02:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be861867cfac5fb7cc2ce986d24f447b22568da0
X-Git-Newrev: 0cd8abda1bb64a87a5195fa6fc214b6b47147acb
X-Patchwork-Hint: ignore
Message-Id: <20230602202425.2C00186BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk{-bin}: security bump
 versions to 11.0.19+7 and 17.0.7+7
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cd8abda1bb64a87a5195fa6fc214b6b47147acb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

* CVEs
  - CVE-2023-21930
  - CVE-2023-21937
  - CVE-2023-21938
  - CVE-2023-21939
  - CVE-2023-21954
  - CVE-2023-21967
  - CVE-2023-21968
* Security fixes
  - JDK-8287404: Improve ping times
  - JDK-8288436: Improve Xalan supports
  - JDK-8294474: Better AES support
  - JDK-8295304: Runtime support improvements
  - JDK-8296676, JDK-8296622: Improve String platform support
  - JDK-8296684: Improve String platform support
  - JDK-8296692: Improve String platform support
  - JDK-8296832: Improve Swing platform support
  - JDK-8297371: Improve UTF8 representation redux
  - JDK-8298191: Enhance object reclamation process
  - JDK-8298310: Enhance TLS session negotiation
  - JDK-8298667: Improved path handling
  - JDK-8299129: Enhance NameService lookups

For details, see the announcements:
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021899.html
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021900.html

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                               | 2 +-
 package/openjdk-bin/openjdk-bin.hash                              | 8 ++++----
 package/openjdk-bin/openjdk-bin.mk                                | 4 ++--
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch           | 8 ++++----
 package/openjdk/openjdk.hash                                      | 4 ++--
 package/openjdk/openjdk.mk                                        | 4 ++--
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 401b24b5d6..d6d8d886b4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1129,7 +1129,7 @@ package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
 package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
-package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
+package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
 package/openldap/0001-fix_cross_strip.patch Upstream
 package/openldap/0002-fix-bignum.patch Upstream
 package/openldap/0003-disable-docs.patch Upstream
diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 241ca34a04..eb9d7396e3 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,10 +1,10 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  a0b1b9dd809d51a438f5fa08918f9aca7b2135721097f0858cf29f77a35d4289  OpenJDK17U-jdk_x64_linux_hotspot_17.0.6_10.tar.gz
-sha256  9e0e88bbd9fa662567d0c1e22d469268c68ac078e9e5fe5a7244f56fec71f55f  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.6_10.tar.gz
+sha256  e9458b38e97358850902c2936a1bb5f35f6cffc59da9fcd28c63eab8dbbfbc3b  OpenJDK17U-jdk_x64_linux_hotspot_17.0.7_7.tar.gz
+sha256  0084272404b89442871e0a1f112779844090532978ad4d4191b8d03fc6adfade  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.7_7.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
-sha256  4a29efda1d702b8ff38e554cf932051f40ec70006caed5c4857a8cbc7a0b7db7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.18_10.tar.gz
-sha256  04d5eeff6a6449bcdca0f52cd97bafd43ce09d40ef1e73fa0e1add63bea4a9c8  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.18_10.tar.gz
+sha256  5f19fb28aea3e28fcc402b73ce72f62b602992d48769502effe81c52ca39a581  OpenJDK11U-jdk_x64_linux_hotspot_11.0.19_7.tar.gz
+sha256  0c7763a19b4af4ef5fbae831781b5184e988d6f131d264482399eeaf51b6e254  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.19_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index c3eb0b05e6..dad846534b 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.6_10
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.7_7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.18_10
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.19_7
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 94%
rename from package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index dfd3b07bea..a8ea5aff65 100644
--- a/package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -68,7 +68,7 @@ diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.c
 index b08caf4d5d3..2bf084895ba 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
-@@ -1674,6 +1674,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1676,6 +1676,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
  #ifndef EM_AARCH64
    #define EM_AARCH64    183               /* ARM AARCH64 */
  #endif
@@ -78,7 +78,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #ifndef EM_RISCV
    #define EM_RISCV      243               /* RISC-V */
  #endif
-@@ -1698,6 +1701,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1700,6 +1703,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
      {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
  #endif
      {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
@@ -86,7 +86,7 @@ index b08caf4d5d3..2bf084895ba 100644
      // we only support 64 bit z architecture
      {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
      {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
-@@ -1726,6 +1730,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1728,6 +1732,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_PPC;
  #elif  (defined AARCH64)
    static  Elf32_Half running_arch_code=EM_AARCH64;
@@ -95,7 +95,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #elif  (defined ARM)
    static  Elf32_Half running_arch_code=EM_ARM;
  #elif  (defined S390)
-@@ -1748,7 +1754,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1750,7 +1756,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 0a67e7a3ec..3b36289628 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  331bad1f80e98761eb9692863146fec647db573db5a5efa5b9bd6326d53a3472  openjdk-17.0.6+10.tar.gz
-sha256  04af71fc7adda41a49861870f9ec0ac0f059c2cf9393ce32995ea8ef4279a1b1  openjdk-11.0.18+10.tar.gz
+sha256  43b80a5aec5fce908e80858e9b34efdf1b49255a12ce303650325af65141d3e8  openjdk-17.0.7+7.tar.gz
+sha256  25fd9ab3042a284aa4e6348969403016404bc2706a4a02c149a0054fbe477337  openjdk-11.0.19+7.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 0fe506bbfd..39d461a87c 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.6+10
+OPENJDK_VERSION_MINOR = 0.7+7
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.18+10
+OPENJDK_VERSION_MINOR = 0.19+7
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
