Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08997C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 20:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 911B84051A;
	Sat,  1 Oct 2022 20:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 911B84051A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3uFBfFbfDGd; Sat,  1 Oct 2022 20:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70BC9403A9;
	Sat,  1 Oct 2022 20:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70BC9403A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 762D21BF330
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 506F283E69
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 506F283E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGdv944h2Nfl for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 20:57:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D19982EA4
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 20:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D19982EA4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04F2086724; Sat,  1 Oct 2022 20:57:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 22:56:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 373fb7fcc963e79bdc08ec62db0d628e4e639476
X-Git-Newrev: 95e9a681e7fd2f823b26c3e70d6b12482f0c33ac
X-Patchwork-Hint: ignore
Message-Id: <20221001205716.04F2086724@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: bump to version 22.09.00
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
Content-Type: multipart/mixed; boundary="===============4582639643111631204=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4582639643111631204==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=95e9a681e7fd2f823b26c3e70d6b12482f0c33ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fwts/0001-build-do-not-use-Werror.patch | 26 ++++++++++++-------------
 package/fwts/fwts.hash                          |  2 +-
 package/fwts/fwts.mk                            |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/fwts/0001-build-do-not-use-Werror.patch b/package/fwts/0001-build-do-not-use-Werror.patch
index 715c4f63a5..c6a84537ed 100644
--- a/package/fwts/0001-build-do-not-use-Werror.patch
+++ b/package/fwts/0001-build-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From e481c2f990ffa71f205d4b9daf0823e71269a7f3 Mon Sep 17 00:00:00 2001
+From feb05271b484b158c14611839f968109e9cf3082 Mon Sep 17 00:00:00 2001
 From: Erico Nunes <nunes.erico@gmail.com>
 Date: Fri, 12 Aug 2016 23:11:56 +0200
 Subject: [PATCH] fwts: do not use -Werror
@@ -25,7 +25,7 @@ Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
  4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f40c3678..0ff5025b 100644
+index ca2f54e2..ed584abf 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1,5 +1,5 @@
@@ -36,25 +36,25 @@ index f40c3678..0ff5025b 100644
  	  AC_CANONICAL_HOST
  	  AC_CONFIG_MACRO_DIR([m4])
 diff --git a/src/Makefile.am b/src/Makefile.am
-index cdabb386..7c2e5730 100644
+index 3bb35e5c..e9fe92fe 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -12,7 +12,7 @@ AM_CPPFLAGS = \
- 	-I$(top_srcdir)/src/acpica/source/compiler	\
+@@ -13,7 +13,7 @@ AM_CPPFLAGS = \
  	-I$(top_srcdir)/efi_runtime			\
- 	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
+ 	-I$(top_srcdir)/smccc_test			\
+ 	-pthread					\
 -	-Wall -Werror -Wextra				\
-+	-Wall -Wextra					\
++	-Wall -Wextra				\
  	-Wno-address-of-packed-member			\
  	-Wfloat-equal -Wmissing-declarations		\
  	-Wno-long-long -Wredundant-decls -Wshadow	\
 diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index 55c52b41..50efa97a 100644
+index d5d53dd7..76c48d4d 100644
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
-@@ -25,7 +25,7 @@ AM_CPPFLAGS = \
- 	`pkg-config --silence-errors --cflags json-c`	\
- 	`pkg-config --cflags glib-2.0 gio-2.0` 		\
+@@ -22,7 +22,7 @@ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/src/acpica/source/include	\
+ 	-I$(top_srcdir)/src/acpica/source/compiler	\
  	-DDATAROOTDIR=\"$(datarootdir)\"		\
 -	-Wall -Werror -Wextra				\
 +	-Wall -Wextra					\
@@ -62,7 +62,7 @@ index 55c52b41..50efa97a 100644
  
  pkglib_LTLIBRARIES = libfwts.la
 diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
-index 1fc0fc02..53614e33 100644
+index de38f070..785975ff 100644
 --- a/src/utilities/Makefile.am
 +++ b/src/utilities/Makefile.am
 @@ -16,7 +16,7 @@
@@ -75,5 +75,5 @@ index 1fc0fc02..53614e33 100644
  
  bin_PROGRAMS = kernelscan
 -- 
-2.30.2
+2.36.1
 
diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 8634980e03..612bc768dd 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  17d1f0b9639e0f9b092ed8233be2d63d6c44ea8d2a76be0fb5902cc867961374  fwts-V21.11.00.tar.gz
+sha256  fee1c323fb9725c2b99c348c434d63196391cad66566d34b42707e55d14d7f25  fwts-V22.09.00.tar.gz
 
 # Hash for license file
 sha256  fbbea748555635dd8c7e6e2f99cddd778f5ee3f9e3510775183bf9799076e5e5  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 6634cdc40e..b208aa0c14 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 21.11.00
+FWTS_VERSION = 22.09.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0

--===============4582639643111631204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4582639643111631204==--
