Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F902C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FFDF4055D;
	Sat,  8 Jan 2022 23:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9sb8Z_x7Ogi; Sat,  8 Jan 2022 23:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F9D240457;
	Sat,  8 Jan 2022 23:17:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 002021BF27E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1B4780D47
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzMXa6zQuEkT for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:17:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38DFA80BFD
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:17:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F1D18813F5; Sat,  8 Jan 2022 23:11:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 00:17:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc232de771baf51f17f59264246d722ff241e125
X-Git-Newrev: bcaed85304d14d3d0a8020e17af2d6daeca0be58
X-Patchwork-Hint: ignore
Message-Id: <20220108231108.F1D18813F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbsd: bump to version 0.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcaed85304d14d3d0a8020e17af2d6daeca0be58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation in hash file (two spaces)
- Update hash of COPYING:
  - files added and year updated with
    https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/01f0d1ea1e71f1018a009ebd9203dd48e6d90c45
    https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/37a9b56c05339301510213c41fc507ea31cc2464
    https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/d54ceb37ce9d7c04fa450a6638eaee31375bbde1
  - files removed with
    https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/847e682f8de452d5f0038458f06ae68ae3959b3a
- libmmd is a mandatory dependency since version 0.11 and
  https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/847e682f8de452d5f0038458f06ae68ae3959b3a

https://lists.freedesktop.org/archives/libbsd/2021-February/000298.html
https://lists.freedesktop.org/archives/libbsd/2021-February/000302.html
https://lists.freedesktop.org/archives/libbsd/2021-February/000305.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libbsd/Config.in   | 1 +
 package/libbsd/libbsd.hash | 6 +++---
 package/libbsd/libbsd.mk   | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 845a22162b..093a2e646c 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBBSD
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBMD
 	help
 	  This library provides useful functions commonly found on BSD
 	  systems, and lacking on others like GNU systems, thus making
diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 95887bd607..17bb32e01c 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,3 +1,3 @@
-# From https://lists.freedesktop.org/archives/libbsd/2019-August/000229.html
-sha256	34b8adc726883d0e85b3118fa13605e179a62b31ba51f676136ecb2d0bc1a887	libbsd-0.10.0.tar.xz
-sha256	933d14a6bc89ee1fd7adbf5b6ec97f6ff0e002549d0b0c164f8a8895371d78f8	COPYING
+# From https://lists.freedesktop.org/archives/libbsd/2021-February/000305.html
+sha512  a7015ea1ffa3766b1a4690526a25231898ad8275149b31fb6801082450172249997c36165626d101ffce53b59767a46676eebc0806426922fe4e773a0376c1f5  libbsd-0.11.3.tar.xz
+sha256  ff2fdeeb0fe8bcb9045fe91d69e8312a5b477c54db48dffe34dd1c0d730c5864  COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 256a75f15e..86df8a97a2 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.10.0
+LIBBSD_VERSION = 0.11.3
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = https://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
@@ -12,5 +12,6 @@ LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
 LIBBSD_LICENSE_FILES = COPYING
 LIBBSD_CPE_ID_VENDOR = freedesktop
 LIBBSD_INSTALL_STAGING = YES
+LIBBSD_DEPENDENCIES = libmd
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
