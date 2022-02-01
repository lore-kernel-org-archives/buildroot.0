Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2970DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA56560DC6;
	Tue,  1 Feb 2022 22:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_7iA20pDpty; Tue,  1 Feb 2022 22:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA46C60B3A;
	Tue,  1 Feb 2022 22:18:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 276AE1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1634783312
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prP_qa8q6RSW for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:18:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1254832D1
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:18:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D990182814; Tue,  1 Feb 2022 22:11:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 23:17:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab71ac15ddd7ed6a8ca83cbc23ea0b0cbb343f0f
X-Git-Newrev: 519a50decd7ee051ca5b900bed8abc7d99105d02
X-Patchwork-Hint: ignore
Message-Id: <20220201221102.D990182814@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: bump version to 3.10.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=519a50decd7ee051ca5b900bed8abc7d99105d02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Refresh 0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch now
that the MULTIARCH logic got updated by:
https://github.com/python/cpython/commit/7e951f356ec76a5a5fdb851d71df5d120014bf3f

Update license hash after a change of copyright years:
https://github.com/python/cpython/commit/35955e4adec4dd09127af93f9413d46889a3c475

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-fixup-CC-print-multiarch-output-for-mus.patch | 29 ++++++++++++----------
 package/python3/python3.hash                       |  8 +++---
 package/python3/python3.mk                         |  2 +-
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index 7fe2516e98..eff010fa22 100644
--- a/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From edc0757c56090364e0a95aabfa9f645a16a27569 Mon Sep 17 00:00:00 2001
+From d009b0142f77881dd75ff760fec728dbc8581a03 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -24,25 +24,28 @@ workaround, rewrite the --print-multiarch output to match older GCC versions
 to keep the configure script happy.
 
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: updated for 3.10.2]
 ---
- configure.ac | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 615c16aced..241298e6cf 100644
+index 913051c276..aba03f3779 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -873,7 +873,9 @@ fi
- rm -f conftest.c conftest.out
- 
- if test x$PLATFORM_TRIPLET != xdarwin; then
--  MULTIARCH=$($CC --print-multiarch 2>/dev/null)
+@@ -876,7 +876,11 @@ AC_MSG_CHECKING([for multiarch])
+ AS_CASE([$ac_sys_system],
+   [Darwin*], [MULTIARCH=""],
+   [FreeBSD*], [MULTIARCH=""],
+-  [MULTIARCH=$($CC --print-multiarch 2>/dev/null)]
++  [
 +  # GCC 8+ returns $arch-linux-{musl,uclibc} for musl/uClibc based
 +  # toolchains confusing python. Fix that up
 +  MULTIARCH=$($CC --print-multiarch 2>/dev/null | sed -E 's/-linux-(musl|uclibc)*$/-linux-gnu/')
- fi
- AC_SUBST(MULTIARCH)
- 
++  ]
+ )
+ AC_SUBST([MULTIARCH])
+ AC_MSG_RESULT([$MULTIARCH])
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index fa4b334877..97f4653490 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3101/
-md5  789210934745a65247a3ebf5da9adb64  Python-3.10.1.tar.xz
+# From https://www.python.org/downloads/release/python-3102/
+md5  14e8c22458ed7779a1957b26cde01db9  Python-3.10.2.tar.xz
 # Locally computed
-sha256  a7f1265b6e1a5de1ec5c3ec7019ab53413469934758311e9d240c46e5ae6e177  Python-3.10.1.tar.xz
-sha256  d0285b61e1a8e420c7deb95836738a5d4a0d26463138b17601f5971212684c4b  LICENSE
+sha256  17de3ac7da9f2519aa9d64378c603a73a0e9ad58dffa8812e45160c086de64c7  Python-3.10.2.tar.xz
+sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6d629ae96e..f9afcd5097 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
