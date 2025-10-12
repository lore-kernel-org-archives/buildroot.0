Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F653CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 16:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2213140AC5;
	Sun, 12 Oct 2025 16:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DgAbTHSeaLY; Sun, 12 Oct 2025 16:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B3EE40B28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B3EE40B28;
	Sun, 12 Oct 2025 16:28:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93B272A8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73AC640B28
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDGseoLkH0Fz for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 16:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EA6C40AC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EA6C40AC5
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:28:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 898E18696A; Sun, 12 Oct 2025 16:28:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 18:23:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6c7a7be36d1ac2c905b776aa86b93a15051ca43
X-Git-Newrev: b38cc734ef0a30fa5972c03b781882eeeeccf9e9
X-Patchwork-Hint: ignore
Message-Id: <20251012162828.898E18696A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gumbo-parser: bump to version
 0.13.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0795523371476996477=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0795523371476996477==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b38cc734ef0a30fa5972c03b781882eeeeccf9e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://codeberg.org/gumbo-parser/gumbo-parser/releases/tag/0.13.2

The removed patch has been merged with commit [1].

[1] https://codeberg.org/gumbo-parser/gumbo-parser/commit/b66e1679441acfa67f2d68ecf35fe4e1d1e13394

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 .../0001-configure.ac-fix-build-without-C.patch    | 72 ----------------------
 package/gumbo-parser/gumbo-parser.hash             |  2 +-
 package/gumbo-parser/gumbo-parser.mk               |  2 +-
 4 files changed, 2 insertions(+), 75 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0f6a5b0b19..4dde533e3a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -460,7 +460,6 @@ package/grpc/0003-disable-unconditionally-downloading-api-repos.patch lib_patch.
 package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch lib_patch.Upstream
 package/guile/0001-calculate-csqrt_manually.patch lib_patch.Upstream
 package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch lib_patch.Upstream
-package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch lib_patch.Upstream
 package/gutenprint/0001-use-pregen-xmli18n-header.patch lib_patch.Upstream
 package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.patch lib_patch.Upstream
 package/harfbuzz/0001-meson.build-check-for-pthread.h.patch lib_patch.Upstream
diff --git a/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch b/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch
deleted file mode 100644
index 011b929a48..0000000000
--- a/package/gumbo-parser/0001-configure.ac-fix-build-without-C.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From e6d9556775b0b8f597ce48dc18c908b3cc09e2a3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 21 Jul 2021 23:47:26 +0200
-Subject: [PATCH] configure.ac: fix build without C++
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix the following build failure raised on toolchains without C++:
-
-  CXX      examples/find_links.o
-/bin/bash: line 1: no: command not found
-  CXX      examples/clean_text.o
-/bin/bash: line 1: no: command not found
-make[2]: *** [Makefile:1071: examples/find_links.o] Error 127
-  CXX      examples/positions_of_class.o
-make[2]: *** Waiting for unfinished jobs....
-  CC       examples/get_title.o
-/bin/bash: line 1: no: command not found
-make[2]: *** [Makefile:1071: examples/clean_text.o] Error 127
-make[2]: *** [Makefile:1071: examples/positions_of_class.o] Error 127
-  CXX      examples/serialize.o
-/bin/bash: line 1: no: command not found
-  CXX      examples/prettyprint.o
-make[2]: *** [Makefile:1071: examples/serialize.o] Error 127
-/bin/bash: line 1: no: command not found
-make[2]: *** [Makefile:1071: examples/prettyprint.o] Error 127
-
-Fixes:
- - http://autobuild.buildroot.org/results/a32b5d3b959433fd5c3543661c37f80d27fbd010
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Raphaël: refresh patch on top of 0.13.1, update description]
-Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
-[Upstream status: https://codeberg.org/gumbo-parser/gumbo-parser/pulls/28]
----
- Makefile.am  | 2 ++
- configure.ac | 4 ++++
- 2 files changed, 6 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index e3f9ed7..8a93854 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -96,7 +96,9 @@ gumbo_test_DEPENDENCIES += gtest/lib/libgtest.a gtest/lib/libgtest_main.a
- gumbo_test_LDADD += gtest/lib/libgtest.a gtest/lib/libgtest_main.a
- endif
- 
-+if HAVE_EXAMPLES
- noinst_PROGRAMS = clean_text find_links get_title positions_of_class benchmark serialize prettyprint
-+endif
- LDADD = libgumbo.la
- AM_CPPFLAGS = -I"$(srcdir)/src"
- 
-diff --git a/configure.ac b/configure.ac
-index 5636a20..6d21b95 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,6 +28,10 @@ AC_CHECK_LIB([gtest_main],
-              AM_CONDITIONAL(HAVE_SHARED_LIBGTEST, [true]),
-              AM_CONDITIONAL(HAVE_SHARED_LIBGTEST, [false]))
- 
-+AC_ARG_ENABLE([examples],
-+              AS_HELP_STRING([--disable-examples], [Disable examples]))
-+AM_CONDITIONAL([HAVE_EXAMPLES], [test "x$enable_examples" != "xno"])
-+
- # Init Automake & libtool
- AM_INIT_AUTOMAKE([foreign subdir-objects])
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
--- 
-2.49.0
-
diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parser/gumbo-parser.hash
index 88c8fffa21..b8809d4db9 100644
--- a/package/gumbo-parser/gumbo-parser.hash
+++ b/package/gumbo-parser/gumbo-parser.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  1a054d1e53d556641a6666537247411a77b0c18ef6ad5df23e30d2131676ef81  0.13.1.tar.gz
+sha256  dbdc159dc8e5c6f3f254e50bce689dd9e439064ff06c165d5653410a5714ab66  0.13.2.tar.gz
 
 # Hash for license files:
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  doc/COPYING
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
index dacd7c981e..6abd24415a 100644
--- a/package/gumbo-parser/gumbo-parser.mk
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUMBO_PARSER_VERSION = 0.13.1
+GUMBO_PARSER_VERSION = 0.13.2
 GUMBO_PARSER_SITE = https://codeberg.org/gumbo-parser/gumbo-parser/archive
 GUMBO_PARSER_SOURCE = $(GUMBO_PARSER_VERSION).tar.gz
 GUMBO_PARSER_LICENSE = Apache-2.0

--===============0795523371476996477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0795523371476996477==--
