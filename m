Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3686EC43334
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B8C4263D;
	Sat, 25 Jun 2022 06:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B8C4263D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1ucnXgW43_r; Sat, 25 Jun 2022 06:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7004262F;
	Sat, 25 Jun 2022 06:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7004262F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DFE71BF2C6
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4956060F0D
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4956060F0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jE06mUcf97ir for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72F1C60F13
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72F1C60F13
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 46C998754F; Sat, 25 Jun 2022 06:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 08:42:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fb9b97ca452e6f0c6404c532bb856ca4b69f0a8
X-Git-Newrev: 48d8b00a3c032d7bb1237c65bce1da97ccbc49d5
X-Patchwork-Hint: ignore
Message-Id: <20220625063418.46C998754F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnl: bump to version 3.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=48d8b00a3c032d7bb1237c65bce1da97ccbc49d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...usl-workaround-to-the-libc-compat.h-copy.patch} |  0
 ...ibs.private-field-in-libnl-pkg-config-fil.patch | 30 ----------------------
 package/libnl/libnl.hash                           |  8 +++---
 package/libnl/libnl.mk                             |  2 +-
 4 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/package/libnl/0002-Add-musl-workaround-to-the-libc-compat.h-copy.patch b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
similarity index 100%
rename from package/libnl/0002-Add-musl-workaround-to-the-libc-compat.h-copy.patch
rename to package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
diff --git a/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch b/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
deleted file mode 100644
index 2419ae282c..0000000000
--- a/package/libnl/0001-build-add-Libs.private-field-in-libnl-pkg-config-fil.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From db0d59cd06f3ffd350379847c0885e1bfb85af0f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 7 Mar 2015 11:34:42 +0100
-Subject: [PATCH] build: add Libs.private field in libnl pkg-config file
-
-In order to support static linking, the libnl pkg-config file should
-indicate in its Libs.private field the libraries that libnl-3.0.a
-requires. The LIBS variable contains the appropriate list of
-libraries: -lm in all cases, and -lpthread when pthread support is
-enabled. This allows to statically link applications against libnl
-properly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libnl-3.0.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libnl-3.0.pc.in b/libnl-3.0.pc.in
-index b87e3dc..ddbc999 100644
---- a/libnl-3.0.pc.in
-+++ b/libnl-3.0.pc.in
-@@ -7,4 +7,5 @@ Name: libnl
- Description: Convenience library for netlink sockets
- Version: @PACKAGE_VERSION@
- Libs: -L${libdir} -lnl-@MAJ_VERSION@
-+Libs.private: @LIBS@
- Cflags: -I${includedir}/libnl@MAJ_VERSION@
--- 
-2.1.0
-
diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index d7cd5c9532..a0f1388528 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,6 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz.md5sum
-md5 74ba57b1b1d6f9f92268aa8141d8e8e4  libnl-3.5.0.tar.gz
-# From https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz.sha256sum
-sha256 352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647a7ed382b5e05fa  libnl-3.5.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_6_0/libnl-3.6.0.tar.gz.sha256sum
+sha256  532155fd011e5a805bd67121b87a01c757e2bb24112ac17e69cb86013b970009  libnl-3.6.0.tar.gz
 # Locally calculated
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index fc9398b29a..d3bd185093 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.5.0
+LIBNL_VERSION = 3.6.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
