Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B6FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 13:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34BF342590;
	Sat, 11 Jun 2022 13:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jp4Rc-IFmtOU; Sat, 11 Jun 2022 13:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDEF24259B;
	Sat, 11 Jun 2022 13:19:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FBBF1BF2A5
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EA7D404F0
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrAZQWFilWtS for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 13:18:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2BBA40A8D
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 13:18:53 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout09.t-online.de (Postfix) with SMTP id CC78412EED
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 15:18:51 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o010n-0moBE20; Sat, 11 Jun 2022 15:18:45 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:54090)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o010n-00061G-7H
 for buildroot@buildroot.org; Sat, 11 Jun 2022 15:18:45 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 15:18:45 +0200
Message-Id: <20220611131845.2605483-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220611131845.2605483-1-bernd.kuhls@t-online.de>
References: <20220611131845.2605483-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654953525-01421A9A-D13FFF7F/0/0 CLEAN NORMAL
X-TOI-MSGID: beb723af-e04b-4651-917d-ffbea65b9d07
Subject: [Buildroot] [PATCH 4/4] package/php: bump version to 8.1.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebased patches when needed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/0001-acinclude.m4-don-t-unset-variables.patch | 6 ++++--
 package/php/0002-iconv-tweak-iconv-detection.patch        | 4 ++--
 package/php/0003-configure-disable-the-phar-tool.patch    | 4 ++--
 package/php/0005-allow-opcache-cross-compiling.patch      | 6 ++++--
 package/php/php.hash                                      | 2 +-
 package/php/php.mk                                        | 2 +-
 6 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/package/php/0001-acinclude.m4-don-t-unset-variables.patch b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
index 2d15552783..9badbd1cc2 100644
--- a/package/php/0001-acinclude.m4-don-t-unset-variables.patch
+++ b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
@@ -9,6 +9,8 @@ Terminate them with extreme prejudice.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett@gmail.com: Update for 7.3.0]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 8.1.7]
 ---
  build/php.m4 | 4 ----
  1 file changed, 4 deletions(-)
@@ -17,7 +19,7 @@ diff --git a/build/php.m4 b/build/php.m4
 index e91ef988..9586c490 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1568,8 +1568,6 @@ dnl PHP_CHECK_FUNC_LIB
+@@ -1580,8 +1580,6 @@ dnl PHP_CHECK_FUNC_LIB
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -26,7 +28,7 @@ index e91ef988..9586c490 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1601,8 +1599,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+@@ -1616,8 +1616,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
  dnl HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index 19d7ab5cf9..758dd6133b 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -16,7 +16,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett@gmail.com: Update for 8.0.7]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 7.4.10 & 7.4.13]
+[Bernd: rebased for 7.4.10, 7.4.13 & 8.1.7]
 ---
  build/php.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -25,7 +25,7 @@ diff --git a/build/php.m4 b/build/php.m4
 index 9586c490..8b3d47ed 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1937,7 +1937,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1976,7 +1976,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    dnl Check external libs for iconv funcs.
    if test "$found_iconv" = "no"; then
  
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index cc4f55a8c8..ab3aecdaa3 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -13,7 +13,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [Aduskett: update for 8.0.7]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 7.4.10 & 7.4.13]
+[Bernd: rebased for 7.4.10, 7.4.13 & 8.1.7]
 ---
  configure.ac | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 0dfab302..6026fb66 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1423,13 +1423,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
+@@ -1566,13 +1566,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
  CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
index d168f71892..f9bc8b3ef5 100644
--- a/package/php/0005-allow-opcache-cross-compiling.patch
+++ b/package/php/0005-allow-opcache-cross-compiling.patch
@@ -13,6 +13,8 @@ CFLAGS when opcache is enabled:
   -DHAVE_SHM_MMAP_FILE
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 8.1.7]
 ---
  ext/opcache/config.m4 | 4 ----
  1 file changed, 4 deletions(-)
@@ -21,8 +23,8 @@ diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
 index 5492fd92..10c150ff 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -339,10 +339,6 @@ int main() {
-   PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)
+@@ -331,10 +331,6 @@ int main() {
+ 
    PHP_ADD_EXTENSION_DEP(opcache, pcre)
  
 -  if test "$have_shm_ipc" != "yes" && test "$have_shm_mmap_posix" != "yes" && test "$have_shm_mmap_anon" != "yes"; then
diff --git a/package/php/php.hash b/package/php/php.hash
index 2e9aa6880b..996a0152a8 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  973fec765336ee01f47536a5db1c2eee98df9d34a41522b7b6c760159bf0a77b  php-8.0.20.tar.xz
+sha256  f042322f1b5a9f7c2decb84b7086ef676896c2f7178739b9672afafa964ed0e5  php-8.1.7.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index d9c2edd839..2bcc3fcfc3 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.20
+PHP_VERSION = 8.1.7
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
