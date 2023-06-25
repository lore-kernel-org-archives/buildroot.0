Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD05EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC9E40192;
	Sun, 25 Jun 2023 15:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC9E40192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKJl9zMZksRJ; Sun, 25 Jun 2023 15:03:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 639C540231;
	Sun, 25 Jun 2023 15:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 639C540231
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 166241BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E55E740998
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E55E740998
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-2w7nPToLbV for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14AE541525
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 15:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14AE541525
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04A3B84AE2; Sun, 25 Jun 2023 15:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:45:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5859cbd2ecef422883621790df3dee97d4486b10
X-Git-Newrev: eb19d01510d285b06c7092dec4cf5383012ce0e1
X-Patchwork-Hint: ignore
Message-Id: <20230625150110.04A3B84AE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xfont_font-*: mass version
 bump
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb19d01510d285b06c7092dec4cf5383012ce0e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes were posted in February 2023:
https://lists.x.org/archives/xorg-announce/2023-February/date.html

Switched tarball to xz and _SITE to https.

Updated license hash of xfont_font-sun-misc due to upstream commit which
removed "All rights reserved" from Oracle copyright notices:
https://gitlab.freedesktop.org/xorg/font/sun-misc/-/commits/master/COPYING

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash  | 2 +-
 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk    | 6 +++---
 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash    | 2 +-
 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk      | 6 +++---
 .../xfont_font-adobe-utopia-100dpi.hash                             | 2 +-
 .../xfont_font-adobe-utopia-100dpi.mk                               | 6 +++---
 .../xfont_font-adobe-utopia-type1.hash                              | 2 +-
 .../xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk  | 6 +++---
 package/x11r7/xfont_font-alias/xfont_font-alias.hash                | 4 +---
 package/x11r7/xfont_font-alias/xfont_font-alias.mk                  | 6 +++---
 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash    | 2 +-
 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk      | 6 +++---
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash        | 2 +-
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk          | 6 +++---
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash          | 2 +-
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk            | 6 +++---
 .../xfont_font-bh-lucidatypewriter-100dpi.hash                      | 2 +-
 .../xfont_font-bh-lucidatypewriter-100dpi.mk                        | 6 +++---
 .../xfont_font-bh-lucidatypewriter-75dpi.hash                       | 2 +-
 .../xfont_font-bh-lucidatypewriter-75dpi.mk                         | 6 +++---
 package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash              | 3 +--
 package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk                | 6 +++---
 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash          | 2 +-
 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk            | 6 +++---
 .../xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash    | 2 +-
 .../xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk      | 6 +++---
 .../xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash      | 2 +-
 .../x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk  | 6 +++---
 .../xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash      | 2 +-
 .../x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk  | 6 +++---
 .../xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash      | 2 +-
 .../x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk  | 6 +++---
 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.hash    | 2 +-
 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk      | 6 +++---
 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.hash    | 3 ++-
 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk      | 6 +++---
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash          | 2 +-
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk            | 6 +++---
 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash        | 2 +-
 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk          | 6 +++---
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash        | 2 +-
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk          | 6 +++---
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.hash          | 3 ++-
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk            | 6 +++---
 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash      | 2 +-
 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk        | 6 +++---
 .../x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash    | 2 +-
 package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk  | 6 +++---
 .../x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash    | 4 +---
 package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk  | 6 +++---
 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash    | 2 +-
 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk      | 6 +++---
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.hash        | 2 +-
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk          | 6 +++---
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash        | 2 +-
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk          | 6 +++---
 .../xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash      | 2 +-
 .../x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk  | 6 +++---
 .../xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.hash      | 3 +--
 .../x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk  | 6 +++---
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash        | 3 +--
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk          | 6 +++---
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash          | 5 ++---
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk            | 6 +++---
 .../xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.hash  | 3 +--
 .../xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk    | 6 +++---
 .../x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash    | 3 +--
 package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk  | 6 +++---
 68 files changed, 139 insertions(+), 147 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash
index 514c90915a..6c96f7dfea 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  b2c08433eab5cb202470aa9f779efefce8d9cab2534f34f3aa4a31d05671c054  font-adobe-100dpi-1.0.3.tar.bz2
+sha256  b67aff445e056328d53f9732d39884f55dd8d303fc25af3dbba33a8ba35a9ccf  font-adobe-100dpi-1.0.4.tar.xz
 sha256  bf6d862672b4fcc86f3f38bc138ad44e52d52207dd8689b8d3701630fc331194  COPYING
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 2418769808..498f39d14b 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_100DPI_VERSION = 1.0.3
-XFONT_FONT_ADOBE_100DPI_SOURCE = font-adobe-100dpi-$(XFONT_FONT_ADOBE_100DPI_VERSION).tar.bz2
-XFONT_FONT_ADOBE_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_100DPI_VERSION = 1.0.4
+XFONT_FONT_ADOBE_100DPI_SOURCE = font-adobe-100dpi-$(XFONT_FONT_ADOBE_100DPI_VERSION).tar.xz
+XFONT_FONT_ADOBE_100DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_ADOBE_100DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_100DPI_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash
index 41ac96fc4f..057cc0f1a4 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c6024a1e4a1e65f413f994dd08b734efd393ce0a502eb465deb77b9a36db4d09  font-adobe-75dpi-1.0.3.tar.bz2
+sha256  1281a62dbeded169e495cae1a5b487e1f336f2b4d971d92911c59c103999b911  font-adobe-75dpi-1.0.4.tar.xz
 sha256  bf6d862672b4fcc86f3f38bc138ad44e52d52207dd8689b8d3701630fc331194  COPYING
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index 90e94d27cb..a8480caf71 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_75DPI_VERSION = 1.0.3
-XFONT_FONT_ADOBE_75DPI_SOURCE = font-adobe-75dpi-$(XFONT_FONT_ADOBE_75DPI_VERSION).tar.bz2
-XFONT_FONT_ADOBE_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_75DPI_VERSION = 1.0.4
+XFONT_FONT_ADOBE_75DPI_SOURCE = font-adobe-75dpi-$(XFONT_FONT_ADOBE_75DPI_VERSION).tar.xz
+XFONT_FONT_ADOBE_75DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_ADOBE_75DPI_LICENSE = MIT
 XFONT_FONT_ADOBE_75DPI_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.hash b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.hash
index 81498788be..87e7894f5c 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.hash
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d16f5e3f227cc6dd07a160a71f443559682dbc35f1c056a5385085aaec4fada5  font-adobe-utopia-100dpi-1.0.4.tar.bz2
+sha256  fb84ec297a906973548ca59b7c6daeaad21244bec5d3fb1e7c93df5ef43b024b  font-adobe-utopia-100dpi-1.0.5.tar.xz
 sha256  234c2a8109afa8034c787dbf69696a9bdd374914aadf937d2a103831d95c1867  COPYING
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 83157f5c67..8962db61cf 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION = 1.0.4
-XFONT_FONT_ADOBE_UTOPIA_100DPI_SOURCE = font-adobe-utopia-100dpi-$(XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION).tar.bz2
-XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION = 1.0.5
+XFONT_FONT_ADOBE_UTOPIA_100DPI_SOURCE = font-adobe-utopia-100dpi-$(XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION).tar.xz
+XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash
index 514dd2829f..0770018fde 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  979435105f897a70f8993fa02c8362160b0513366c2ab896965416f96dbb8077  font-adobe-utopia-type1-1.0.4.tar.bz2
+sha256  4cb280bc47693b07c5e00fd0e5ad5721aabebc0548c3f06774e5cc3cbcf75697  font-adobe-utopia-type1-1.0.5.tar.xz
 sha256  234c2a8109afa8034c787dbf69696a9bdd374914aadf937d2a103831d95c1867  COPYING
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 9ec8f800bd..b53b499b28 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION = 1.0.4
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_SOURCE = font-adobe-utopia-type1-$(XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION).tar.bz2
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION = 1.0.5
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_SOURCE = font-adobe-utopia-type1-$(XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION).tar.xz
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.hash b/package/x11r7/xfont_font-alias/xfont_font-alias.hash
index 5390d1c126..8b1ead9efb 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.hash
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.hash
@@ -1,5 +1,3 @@
-# From https://lists.x.org/archives/xorg-announce/2020-August/003054.html
-sha256  f3111ae8bf2e980f5f56af400e8eefe5fc9f4207f4a412ea79637fd66c945276  font-alias-1.0.4.tar.bz2
-sha512  c67ac2ee344a601fcc09471580214b30c3fd6acc4800702840de44f0733e6d18b3faeec2fa3f4e2314025cc1724d7d6796ebaf620398fe350710182fd2c4b07d  font-alias-1.0.4.tar.bz2
 # locally computed
+sha256  9f89e217bb73e0e3636a0a493fbf8b7c995156e0c53d9a0476d201b67c2d6b6e  font-alias-1.0.5.tar.xz
 sha256  bdba5452fc080c0f1a56d66978ac4150d1d1a00a9cc0248bba4f0b76c80ad47e  COPYING
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 7f8e4b2ea0..fcd2706621 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_ALIAS_VERSION = 1.0.4
-XFONT_FONT_ALIAS_SOURCE = font-alias-$(XFONT_FONT_ALIAS_VERSION).tar.bz2
-XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ALIAS_VERSION = 1.0.5
+XFONT_FONT_ALIAS_SOURCE = font-alias-$(XFONT_FONT_ALIAS_VERSION).tar.xz
+XFONT_FONT_ALIAS_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_ALIAS_LICENSE = MIT
 XFONT_FONT_ALIAS_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash
index 3c565450f4..ae2503efcf 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  505d9b12a7093389e67a925dfda6346bde26d114c67f0cdca7aeda6e5d3344f4  font-arabic-misc-1.0.3.tar.bz2
+sha256  46ffe61b52c78a1d2dca70ff20a9f2d84d69744639cab9a085c7a7ee17663467  font-arabic-misc-1.0.4.tar.xz
 sha256  192b677a887c20f9671cc357cd5ea7bae586003d61c1f8f6e164e8f5530abf57  COPYING
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index c867a60233..f8e95d8fcb 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_ARABIC_MISC_VERSION = 1.0.3
-XFONT_FONT_ARABIC_MISC_SOURCE = font-arabic-misc-$(XFONT_FONT_ARABIC_MISC_VERSION).tar.bz2
-XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ARABIC_MISC_VERSION = 1.0.4
+XFONT_FONT_ARABIC_MISC_SOURCE = font-arabic-misc-$(XFONT_FONT_ARABIC_MISC_VERSION).tar.xz
+XFONT_FONT_ARABIC_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_ARABIC_MISC_LICENSE = MIT
 XFONT_FONT_ARABIC_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash
index 154d6eb2fd..6aa66d0b34 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481  font-bh-100dpi-1.0.3.tar.bz2
+sha256  fd8f5efe8491faabdd2744808d3d4eafdae5c83e617017c7fddd2716d049ab1e  font-bh-100dpi-1.0.4.tar.xz
 sha256  888fd79d2c7e6332559d661c62f7a50f92fc5842e6ff0e0bd4c59b0083dabce9  COPYING
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index cc15738692..89c5a0d802 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_BH_100DPI_VERSION = 1.0.3
-XFONT_FONT_BH_100DPI_SOURCE = font-bh-100dpi-$(XFONT_FONT_BH_100DPI_VERSION).tar.bz2
-XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_100DPI_VERSION = 1.0.4
+XFONT_FONT_BH_100DPI_SOURCE = font-bh-100dpi-$(XFONT_FONT_BH_100DPI_VERSION).tar.xz
+XFONT_FONT_BH_100DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_BH_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_100DPI_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash
index 0648e26dd9..0336c1b237 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  3486aa51ac92c646a448fe899c5c3dae0024b1fef724d5100d52640d1cac721c  font-bh-75dpi-1.0.3.tar.bz2
+sha256  6026d8c073563dd3cbb4878d0076eed970debabd21423b3b61dd90441b9e7cda  font-bh-75dpi-1.0.4.tar.xz
 sha256  888fd79d2c7e6332559d661c62f7a50f92fc5842e6ff0e0bd4c59b0083dabce9  COPYING
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index 788a76a2b9..1bc03affab 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_BH_75DPI_VERSION = 1.0.3
-XFONT_FONT_BH_75DPI_SOURCE = font-bh-75dpi-$(XFONT_FONT_BH_75DPI_VERSION).tar.bz2
-XFONT_FONT_BH_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_75DPI_VERSION = 1.0.4
+XFONT_FONT_BH_75DPI_SOURCE = font-bh-75dpi-$(XFONT_FONT_BH_75DPI_VERSION).tar.xz
+XFONT_FONT_BH_75DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_BH_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_75DPI_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.hash b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.hash
index 439d5d2602..2e21d28546 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.hash
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  62a83363c2536095fda49d260d21e0847675676e4e3415054064cbdffa641fbb  font-bh-lucidatypewriter-100dpi-1.0.3.tar.bz2
+sha256  76ec09eda4094a29d47b91cf59c3eba229c8f7d1ca6bae2abbb3f925e33de8f2  font-bh-lucidatypewriter-100dpi-1.0.4.tar.xz
 sha256  9428a98add4fada4c98e031ae0f29d27f8b15a2c8c6e8830591a4c18ea26a6cd  COPYING
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index 2f055ddab9..bbbdd3d13c 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION = 1.0.3
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SOURCE = font-bh-lucidatypewriter-100dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION).tar.bz2
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION = 1.0.4
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SOURCE = font-bh-lucidatypewriter-100dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION).tar.xz
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.hash b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.hash
index ed8d8514db..17b1b3f428 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.hash
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  4ac16afbe205480cc5572e2977ea63488c543d05be0ea8e5a94c845a6eebcb31  font-bh-lucidatypewriter-75dpi-1.0.3.tar.bz2
+sha256  864e2c39ac61f04f693fc2c8aaaed24b298c2cd40283cec12eee459c5635e8f5  font-bh-lucidatypewriter-75dpi-1.0.4.tar.xz
 sha256  9428a98add4fada4c98e031ae0f29d27f8b15a2c8c6e8830591a4c18ea26a6cd  COPYING
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 4166b2d741..86789dae5a 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION = 1.0.3
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SOURCE = font-bh-lucidatypewriter-75dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION).tar.bz2
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION = 1.0.4
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SOURCE = font-bh-lucidatypewriter-75dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION).tar.xz
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash
index c9b01efc7a..a0c5eea223 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash
@@ -1,4 +1,3 @@
-# From http://lists.x.org/archives/xorg-announce/2010-November/001537.html
-sha1  f42ebd527096011040a312e0f9cdf78d64177419  font-bh-ttf-1.0.3.tar.bz2
 # Locally computed
+sha256  85a5f90d00c48c2b06fd125ea8adbc8b8ee97429e3075081c8710926efec3a56  font-bh-ttf-1.0.4.tar.xz
 sha256  27d47d50006773f1c0bd97661252ae27bb8cfd6951f253bd9d3ef81ed1243934  COPYING
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index e3ed2a6f08..3cc0dedaa6 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_BH_TTF_VERSION = 1.0.3
-XFONT_FONT_BH_TTF_SOURCE = font-bh-ttf-$(XFONT_FONT_BH_TTF_VERSION).tar.bz2
-XFONT_FONT_BH_TTF_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_TTF_VERSION = 1.0.4
+XFONT_FONT_BH_TTF_SOURCE = font-bh-ttf-$(XFONT_FONT_BH_TTF_VERSION).tar.xz
+XFONT_FONT_BH_TTF_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_BH_TTF_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_TTF_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash
index cb0387d9e9..81a6a76dfb 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  761455a297486f3927a85d919b5c948d1d324181d4bea6c95d542504b68a63c1  font-bh-type1-1.0.3.tar.bz2
+sha256  19dec3ec06abde6bedd10094579e928be0f0fc3bdb4fbe93f4c69cce406d72a6  font-bh-type1-1.0.4.tar.xz
 sha256  27d47d50006773f1c0bd97661252ae27bb8cfd6951f253bd9d3ef81ed1243934  COPYING
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index 244c91ffb9..c4fd2e69b9 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_BH_TYPE1_VERSION = 1.0.3
-XFONT_FONT_BH_TYPE1_SOURCE = font-bh-type1-$(XFONT_FONT_BH_TYPE1_VERSION).tar.bz2
-XFONT_FONT_BH_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_TYPE1_VERSION = 1.0.4
+XFONT_FONT_BH_TYPE1_SOURCE = font-bh-type1-$(XFONT_FONT_BH_TYPE1_VERSION).tar.xz
+XFONT_FONT_BH_TYPE1_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_BH_TYPE1_LICENSE = Bigelow & Holmes License (no modification)
 XFONT_FONT_BH_TYPE1_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash
index 1cef17d4cd..9a97a16cd1 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ebe0d7444e3d7c8da7642055ac2206f0190ee060700d99cd876f8fc9964cb6ce  font-bitstream-100dpi-1.0.3.tar.bz2
+sha256  2d1cc682efe4f7ebdf5fbd88961d8ca32b2729968728633dea20a1627690c1a7  font-bitstream-100dpi-1.0.4.tar.xz
 sha256  6faf32f092c2b92f3f99e0d63db9d802b11b4dd5aa0ce991f107a398d7f1ae80  COPYING
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index 90d9e5bbb4..f756f29571 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_BITSTREAM_100DPI_VERSION = 1.0.3
-XFONT_FONT_BITSTREAM_100DPI_SOURCE = font-bitstream-100dpi-$(XFONT_FONT_BITSTREAM_100DPI_VERSION).tar.bz2
-XFONT_FONT_BITSTREAM_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BITSTREAM_100DPI_VERSION = 1.0.4
+XFONT_FONT_BITSTREAM_100DPI_SOURCE = font-bitstream-100dpi-$(XFONT_FONT_BITSTREAM_100DPI_VERSION).tar.xz
+XFONT_FONT_BITSTREAM_100DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_BITSTREAM_100DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_100DPI_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash
index 9973f1f456..03bcf66ca4 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ba3f5e4610c07bd5859881660753ec6d75d179f26fc967aa776dbb3d5d5cf48e  font-bitstream-75dpi-1.0.3.tar.bz2
+sha256  aaeb34d87424a9c2b0cf0e8590704c90cb5b42c6a3b6a0ef9e4676ef773bf826  font-bitstream-75dpi-1.0.4.tar.xz
 sha256  6faf32f092c2b92f3f99e0d63db9d802b11b4dd5aa0ce991f107a398d7f1ae80  COPYING
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index deb99aa596..9c74f0c4dc 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_BITSTREAM_75DPI_VERSION = 1.0.3
-XFONT_FONT_BITSTREAM_75DPI_SOURCE = font-bitstream-75dpi-$(XFONT_FONT_BITSTREAM_75DPI_VERSION).tar.bz2
-XFONT_FONT_BITSTREAM_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BITSTREAM_75DPI_VERSION = 1.0.4
+XFONT_FONT_BITSTREAM_75DPI_SOURCE = font-bitstream-75dpi-$(XFONT_FONT_BITSTREAM_75DPI_VERSION).tar.xz
+XFONT_FONT_BITSTREAM_75DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_BITSTREAM_75DPI_LICENSE = MIT
 XFONT_FONT_BITSTREAM_75DPI_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash
index 81bb8fc791..9e9e158f80 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c6ea0569adad2c577f140328dc3302e729cb1b1ea90cd0025caf380625f8a688  font-bitstream-type1-1.0.3.tar.bz2
+sha256  de2f238b4cd72db4228a0ba67829d76a2b7c039e22993d66a722ee385248c628  font-bitstream-type1-1.0.4.tar.xz
 sha256  ecad5afdbd1308634896744a4c962361e9eca73e7d9969bb3aad94533c66d046  COPYING
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 640ce86324..880e49a102 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_BITSTREAM_TYPE1_VERSION = 1.0.3
-XFONT_FONT_BITSTREAM_TYPE1_SOURCE = font-bitstream-type1-$(XFONT_FONT_BITSTREAM_TYPE1_VERSION).tar.bz2
-XFONT_FONT_BITSTREAM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BITSTREAM_TYPE1_VERSION = 1.0.4
+XFONT_FONT_BITSTREAM_TYPE1_SOURCE = font-bitstream-type1-$(XFONT_FONT_BITSTREAM_TYPE1_VERSION).tar.xz
+XFONT_FONT_BITSTREAM_TYPE1_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_BITSTREAM_TYPE1_LICENSE = MIT
 XFONT_FONT_BITSTREAM_TYPE1_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash
index 893ba5718d..480444e518 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  6e8631936157677c77ba032b5c7b1fb3cb2ee872dbcea0444f12cd602cd9212a  font-cronyx-cyrillic-1.0.3.tar.bz2
+sha256  dc0781ce0dcbffdbf6aae1a00173a13403f92b0de925bca5a9e117e4e2d6b789  font-cronyx-cyrillic-1.0.4.tar.xz
 sha256  857fa9f8d12bd7ce7fb235393d775dd5e0b5130fac7a88fdea9156d75b609402  COPYING
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index caca639c25..af7590842c 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_CRONYX_CYRILLIC_VERSION = 1.0.3
-XFONT_FONT_CRONYX_CYRILLIC_SOURCE = font-cronyx-cyrillic-$(XFONT_FONT_CRONYX_CYRILLIC_VERSION).tar.bz2
-XFONT_FONT_CRONYX_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_CRONYX_CYRILLIC_VERSION = 1.0.4
+XFONT_FONT_CRONYX_CYRILLIC_SOURCE = font-cronyx-cyrillic-$(XFONT_FONT_CRONYX_CYRILLIC_VERSION).tar.xz
+XFONT_FONT_CRONYX_CYRILLIC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE = MIT
 XFONT_FONT_CRONYX_CYRILLIC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.hash b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.hash
index 04565f8b0f..3fe94b526f 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.hash
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  17363eb35eece2e08144da5f060c70103b59d0972b4f4d77fd84c9a7a2dba635  font-cursor-misc-1.0.3.tar.bz2
+sha256  25d9c9595013cb8ca08420509993a6434c917e53ca1fec3f63acd45a19d4f982  font-cursor-misc-1.0.4.tar.xz
 sha256  c22415fb2144d7298e995dbeee2eb120822d653c61ae43c64fa0fda2cc3ca3a0  COPYING
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index e752803086..38366a8089 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_CURSOR_MISC_VERSION = 1.0.3
-XFONT_FONT_CURSOR_MISC_SOURCE = font-cursor-misc-$(XFONT_FONT_CURSOR_MISC_VERSION).tar.bz2
-XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_CURSOR_MISC_VERSION = 1.0.4
+XFONT_FONT_CURSOR_MISC_SOURCE = font-cursor-misc-$(XFONT_FONT_CURSOR_MISC_VERSION).tar.xz
+XFONT_FONT_CURSOR_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_CURSOR_MISC_LICENSE = unencumbered
 XFONT_FONT_CURSOR_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.hash b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.hash
index 1b4ebe9d9f..cebdbbba88 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.hash
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256  bc65de70bee12698caa95b523d3b652c056347e17b68cc8b5d6bbdff235c4be8  font-daewoo-misc-1.0.3.tar.bz2
+sha256  f63c8b3dc8f30098cb868b7db2c2c0c8b5b3fd2cefd044035697a43d4c7a4f31  font-daewoo-misc-1.0.4.tar.xz
+sha256  294f786aa8f0ad8f92979d153e18f5cf7cc95d872cace25338f9c95e7b348ed9  COPYING
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index f5bd941383..57e151383b 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_DAEWOO_MISC_VERSION = 1.0.3
-XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSION).tar.bz2
-XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_DAEWOO_MISC_VERSION = 1.0.4
+XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSION).tar.xz
+XFONT_FONT_DAEWOO_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_DAEWOO_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash
index 34873fe3b7..2dea72b831 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  e19ddf8b5f8de914d81675358fdfe37762e9ce524887cc983adef34f2850ff7b  font-dec-misc-1.0.3.tar.bz2
+sha256  82d968201d8ff8bec0e51dccd781bb4d4ebf17e11004944279bdc0201e161af7  font-dec-misc-1.0.4.tar.xz
 sha256  bf4d44be4b5eb66c53bf5f7eb2d9d4817fb937788b37ed6ceda1876fdb964817  COPYING
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index 1642b41352..6f404ab2a0 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_DEC_MISC_VERSION = 1.0.3
-XFONT_FONT_DEC_MISC_SOURCE = font-dec-misc-$(XFONT_FONT_DEC_MISC_VERSION).tar.bz2
-XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_DEC_MISC_VERSION = 1.0.4
+XFONT_FONT_DEC_MISC_SOURCE = font-dec-misc-$(XFONT_FONT_DEC_MISC_VERSION).tar.xz
+XFONT_FONT_DEC_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_DEC_MISC_LICENSE = MIT
 XFONT_FONT_DEC_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash
index c5e8f4e4ae..5a967f70d5 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  fddb28d3db5a07f4b4ca15388488a9680a10e1367a18f358f903b2a608a5d2df  font-ibm-type1-1.0.3.tar.bz2
+sha256  c4395e95ba46d40c4ad1737e91cac20c0ab75411329b60db5d99fed92b60ce7f  font-ibm-type1-1.0.4.tar.xz
 sha256  fc0fd4df7ac7ac7f9b1ff3a221f28c52edea4506dc4c84f1869a3f4281360ca1  COPYING
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 4d34998af4..ea295cadfa 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_IBM_TYPE1_VERSION = 1.0.3
-XFONT_FONT_IBM_TYPE1_SOURCE = font-ibm-type1-$(XFONT_FONT_IBM_TYPE1_VERSION).tar.bz2
-XFONT_FONT_IBM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_IBM_TYPE1_VERSION = 1.0.4
+XFONT_FONT_IBM_TYPE1_SOURCE = font-ibm-type1-$(XFONT_FONT_IBM_TYPE1_VERSION).tar.xz
+XFONT_FONT_IBM_TYPE1_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_IBM_TYPE1_LICENSE = IBM/MIT X Consortium Courier Typefont agreement (no modification)
 XFONT_FONT_IBM_TYPE1_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash
index bc4a9e5b17..bc2164b23f 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  5824ab4b485951107dd245b8f7717d2822f1a6dbf6cea98f1ac7f49905c0a867  font-isas-misc-1.0.3.tar.bz2
+sha256  47e595bbe6da444b9f6fcaa26539abc7ba1989e23afa6cdc49e22e484cc438fc  font-isas-misc-1.0.4.tar.xz
 sha256  32d5d082b8186051bbe75ea9cbedc646830217ca931b1b7a1e534a828c94e839  COPYING
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 1393d67eae..d144925278 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_ISAS_MISC_VERSION = 1.0.3
-XFONT_FONT_ISAS_MISC_SOURCE = font-isas-misc-$(XFONT_FONT_ISAS_MISC_VERSION).tar.bz2
-XFONT_FONT_ISAS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ISAS_MISC_VERSION = 1.0.4
+XFONT_FONT_ISAS_MISC_SOURCE = font-isas-misc-$(XFONT_FONT_ISAS_MISC_VERSION).tar.xz
+XFONT_FONT_ISAS_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_ISAS_MISC_LICENSE = MIT
 XFONT_FONT_ISAS_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.hash b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.hash
index c39db36061..95cdaa9f1c 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.hash
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256  2b18ce10b367ebafe95a17de799b6db9a24e2337188d124adaf68af05b1fac65  font-jis-misc-1.0.3.tar.bz2
+sha256  78d1eff6c471f7aa6802a26d62cccf51d8e5185586406d9b6e1ee691b0bffad0  font-jis-misc-1.0.4.tar.xz
+sha256  7a94eaf8f051c95232d64b24b082eb02f827e1361c03b82e9bc7252263ea66c1  COPYING
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 78a5bbbf8e..f0ba7fe942 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_JIS_MISC_VERSION = 1.0.3
-XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz2
-XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_JIS_MISC_VERSION = 1.0.4
+XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.xz
+XFONT_FONT_JIS_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_JIS_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash
index ce0899b65a..ace39dcd64 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9a3381c10f32d9511f0ad4179df395914c50779103c16cddf7017f5220ed8db6  font-micro-misc-1.0.3.tar.bz2
+sha256  2ee0b9d6bd7ae849aff1bd82efab44a1b6b368fbb5e11d12ff7f015a3df6f943  font-micro-misc-1.0.4.tar.xz
 sha256  1711d038bca0efb51b5114e902412019d1c21531882866b1a6908c6386268cfb  COPYING
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index b5da83f398..e76626bb96 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_MICRO_MISC_VERSION = 1.0.3
-XFONT_FONT_MICRO_MISC_SOURCE = font-micro-misc-$(XFONT_FONT_MICRO_MISC_VERSION).tar.bz2
-XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MICRO_MISC_VERSION = 1.0.4
+XFONT_FONT_MICRO_MISC_SOURCE = font-micro-misc-$(XFONT_FONT_MICRO_MISC_VERSION).tar.xz
+XFONT_FONT_MICRO_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_MICRO_MISC_LICENSE = Public Domain
 XFONT_FONT_MICRO_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash
index 5eb407f4c7..5d2f1dedc1 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  e40fe3e3323c62b738550795457ad555c70c008aa91b5912dfd46f8e745f5e60  font-misc-cyrillic-1.0.3.tar.bz2
+sha256  76021a7f53064001914a57fd08efae57f76b68f0a24dca8ab1b245474ee8e993  font-misc-cyrillic-1.0.4.tar.xz
 sha256  8765722448e0ca6ce113d0406554c40224f74abfc005f4b2ef927567349f1529  COPYING
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 8fa30ea314..93a7973fb7 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.3
-XFONT_FONT_MISC_CYRILLIC_SOURCE = font-misc-cyrillic-$(XFONT_FONT_MISC_CYRILLIC_VERSION).tar.bz2
-XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.4
+XFONT_FONT_MISC_CYRILLIC_SOURCE = font-misc-cyrillic-$(XFONT_FONT_MISC_CYRILLIC_VERSION).tar.xz
+XFONT_FONT_MISC_CYRILLIC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_MISC_CYRILLIC_LICENSE = MIT / Public Domain
 XFONT_FONT_MISC_CYRILLIC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
index 45cf430018..73f38186f2 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
@@ -1,5 +1,3 @@
-# From https://lists.x.org/archives/xorg-announce/2020-August/003055.html
-sha256  698c0f6ddf9ca482250bdafa08293893148393bb9cb23e0a9ca313c6dbfc4ae0  font-misc-ethiopic-1.0.4.tar.bz2
-sha512  4fed9ff3782746898c56dac199e9ca89356f4967779937049b9ff4ffad202317c023859f92d44b371dfa5485d5368ccad648e64b12cde0ed21f7d4aee5affcd5  font-misc-ethiopic-1.0.4.tar.bz2
 # locally computed
+sha256  4749a7e6e1a1eef6c91fcc9a04e8b1c0ed027d40c1599e5a6c93270d8469b612  font-misc-ethiopic-1.0.5.tar.xz
 sha256  94835f274f1ddad34f8fd3a06b2c493222a68e4094f4097000d101f22ee0d0d5  COPYING
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 9ded4b6ced..9a4e25bf82 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.4
-XFONT_FONT_MISC_ETHIOPIC_SOURCE = font-misc-ethiopic-$(XFONT_FONT_MISC_ETHIOPIC_VERSION).tar.bz2
-XFONT_FONT_MISC_ETHIOPIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.5
+XFONT_FONT_MISC_ETHIOPIC_SOURCE = font-misc-ethiopic-$(XFONT_FONT_MISC_ETHIOPIC_VERSION).tar.xz
+XFONT_FONT_MISC_ETHIOPIC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_MISC_ETHIOPIC_LICENSE = MIT
 XFONT_FONT_MISC_ETHIOPIC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash
index 92046c8511..63d033b444 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  3721323f13855cf7ca609115a1f7b182491e9b2b9c6e01eb1a2c7f8edd480791  font-misc-meltho-1.0.3.tar.bz2
+sha256  63be5ec17078898f263c24096a68b43ae5b06b88852e42549afa03d124d65219  font-misc-meltho-1.0.4.tar.xz
 sha256  6a02b45e4877b9df8c1bdaa21e1e8fba86d85e3be4c90f2791183a501e0cbd25  COPYING
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index ac4a71b700..727b82fccf 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_MELTHO_VERSION = 1.0.3
-XFONT_FONT_MISC_MELTHO_SOURCE = font-misc-meltho-$(XFONT_FONT_MISC_MELTHO_VERSION).tar.bz2
-XFONT_FONT_MISC_MELTHO_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MISC_MELTHO_VERSION = 1.0.4
+XFONT_FONT_MISC_MELTHO_SOURCE = font-misc-meltho-$(XFONT_FONT_MISC_MELTHO_VERSION).tar.xz
+XFONT_FONT_MISC_MELTHO_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_MISC_MELTHO_LICENSE = Meltho License
 XFONT_FONT_MISC_MELTHO_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.hash b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.hash
index 781742420d..2fbdcaf3a1 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.hash
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794  font-misc-misc-1.1.2.tar.bz2
+sha256  79abe361f58bb21ade9f565898e486300ce1cc621d5285bec26e14b6a8618fed  font-misc-misc-1.1.3.tar.xz
 sha256  1711d038bca0efb51b5114e902412019d1c21531882866b1a6908c6386268cfb  COPYING
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index e03da6f1b5..ee90e7a80c 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_MISC_VERSION = 1.1.2
-XFONT_FONT_MISC_MISC_SOURCE = font-misc-misc-$(XFONT_FONT_MISC_MISC_VERSION).tar.bz2
-XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MISC_MISC_VERSION = 1.1.3
+XFONT_FONT_MISC_MISC_SOURCE = font-misc-misc-$(XFONT_FONT_MISC_MISC_VERSION).tar.xz
+XFONT_FONT_MISC_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_MISC_MISC_LICENSE = Public Domain
 XFONT_FONT_MISC_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash
index f6e8e9aa79..978c634ec5 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  bd5f7adb34367c197773a9801df5bce7b019664941900b2a31fbfe1ff2830f8f  font-mutt-misc-1.0.3.tar.bz2
+sha256  b12359f4e12c23bcfcb448b918297e975fa91bef5293d88d3c25343cc768bb24  font-mutt-misc-1.0.4.tar.xz
 sha256  81d42a6eeaf3ac2fcc1e1408fb6e2039d1162ca85d4abaf75e3daddcb250e4ff  COPYING
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 6fcaa5dadc..41179f4c4f 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_MUTT_MISC_VERSION = 1.0.3
-XFONT_FONT_MUTT_MISC_SOURCE = font-mutt-misc-$(XFONT_FONT_MUTT_MISC_VERSION).tar.bz2
-XFONT_FONT_MUTT_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MUTT_MISC_VERSION = 1.0.4
+XFONT_FONT_MUTT_MISC_SOURCE = font-mutt-misc-$(XFONT_FONT_MUTT_MISC_VERSION).tar.xz
+XFONT_FONT_MUTT_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_MUTT_MISC_LICENSE = MIT
 XFONT_FONT_MUTT_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash
index 107493b267..44ce495ec6 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  e444028656e0767e2eddc6d9aca462b16a2be75a47244dbc199b2c44eca87e5a  font-schumacher-misc-1.1.2.tar.bz2
+sha256  8b849f0cdb1e55a34cc3dd8b0fb37443fabbc224d5ba44085569581244a68070  font-schumacher-misc-1.1.3.tar.xz
 sha256  4e2b9933887950acad3a780dce91c71770c8887f132bcd0c2ba6146cdc372407  COPYING
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index e07569d4b4..4e61b45339 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_SCHUMACHER_MISC_VERSION = 1.1.2
-XFONT_FONT_SCHUMACHER_MISC_SOURCE = font-schumacher-misc-$(XFONT_FONT_SCHUMACHER_MISC_VERSION).tar.bz2
-XFONT_FONT_SCHUMACHER_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_SCHUMACHER_MISC_VERSION = 1.1.3
+XFONT_FONT_SCHUMACHER_MISC_SOURCE = font-schumacher-misc-$(XFONT_FONT_SCHUMACHER_MISC_VERSION).tar.xz
+XFONT_FONT_SCHUMACHER_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_SCHUMACHER_MISC_LICENSE = MIT
 XFONT_FONT_SCHUMACHER_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.hash b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.hash
index e8d3fa1605..4d92cdaf9f 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.hash
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.hash
@@ -1,4 +1,3 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256  824231e8dffe15299454e47259f29d98001c9cf8ad3d6b5171399e4d71705e79  font-screen-cyrillic-1.0.4.tar.bz2
 # Locally computed
+sha256  8f758bb8cd580c7e655487d1d0db69d319acae54d932b295d96d9d9b83fde5c0  font-screen-cyrillic-1.0.5.tar.xz
 sha256  5234cbcbdcc9865ce2b576b5f67e77e40ccdc1aa01e6528bea5a17784934b894  COPYING
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index a254d4a756..144cec5203 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.4
-XFONT_FONT_SCREEN_CYRILLIC_SOURCE = font-screen-cyrillic-$(XFONT_FONT_SCREEN_CYRILLIC_VERSION).tar.bz2
-XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.5
+XFONT_FONT_SCREEN_CYRILLIC_SOURCE = font-screen-cyrillic-$(XFONT_FONT_SCREEN_CYRILLIC_VERSION).tar.xz
+XFONT_FONT_SCREEN_CYRILLIC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE = MIT
 XFONT_FONT_SCREEN_CYRILLIC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash
index 80261ff312..726e748050 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash
@@ -1,4 +1,3 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256  2043a326ba347c9da5ca1e9bc363e2521c3ea40b43b1f9662d333efd4867cff5  font-sony-misc-1.0.3.tar.bz2
 # Locally computed
+sha256  e6b09f823fccb06e0bd0b2062283b6514153323bd8a7486e9c2e3f55ab84946b  font-sony-misc-1.0.4.tar.xz
 sha256  8233ff7d7bc8b5b46cbba3f6cd0069d2ef875bd1b1e0090ca4145282aa096739  COPYING
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 6e580fd922..f77a5f004f 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_SONY_MISC_VERSION = 1.0.3
-XFONT_FONT_SONY_MISC_SOURCE = font-sony-misc-$(XFONT_FONT_SONY_MISC_VERSION).tar.bz2
-XFONT_FONT_SONY_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_SONY_MISC_VERSION = 1.0.4
+XFONT_FONT_SONY_MISC_SOURCE = font-sony-misc-$(XFONT_FONT_SONY_MISC_VERSION).tar.xz
+XFONT_FONT_SONY_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_SONY_MISC_LICENSE = MIT
 XFONT_FONT_SONY_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash
index 8b195c9f9b..ac2f343906 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash
@@ -1,4 +1,3 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256  481f4fcbbf7005658b080b3cf342c8c76de752e77f47958b2b383de73266d2e0  font-sun-misc-1.0.3.tar.bz2
 # Locally computed
-sha256  dd6da1d39832ab2878c3304405c1c7883c6da292ffde262fca1785239534c40f  COPYING
+sha256  dd84dd116d927affa4fa0fa29727b3ecfc0f064238817c0a1e552a0ac384db9f  font-sun-misc-1.0.4.tar.xz
+sha256  d76b96147b5c155642652ca15e2e4cb4cc249ee2eaa02292e274b723224b88de  COPYING
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 737cfb5c9b..3d3596a9b6 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_SUN_MISC_VERSION = 1.0.3
-XFONT_FONT_SUN_MISC_SOURCE = font-sun-misc-$(XFONT_FONT_SUN_MISC_VERSION).tar.bz2
-XFONT_FONT_SUN_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_SUN_MISC_VERSION = 1.0.4
+XFONT_FONT_SUN_MISC_SOURCE = font-sun-misc-$(XFONT_FONT_SUN_MISC_VERSION).tar.xz
+XFONT_FONT_SUN_MISC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_SUN_MISC_LICENSE = MIT
 XFONT_FONT_SUN_MISC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.hash b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.hash
index 283f6f9f2c..a0200073de 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.hash
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.hash
@@ -1,4 +1,3 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256  abd13b63d02fcaec488686c23683e5cf640b43bd32f8ca22eeae6f84df0a36a0  font-winitzki-cyrillic-1.0.3.tar.bz2
 # Locally computed
+sha256  3b6d82122dc14776e3afcd877833a7834e1f900c53fc1c7bb2d67c781cfa97a8  font-winitzki-cyrillic-1.0.4.tar.xz
 sha256  ca60a2aa1133e39e8c72a01af06cf0c927f5ddfe70d469d1535231100618095d  COPYING
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index e43cd1150f..f13483994b 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_WINITZKI_CYRILLIC_VERSION = 1.0.3
-XFONT_FONT_WINITZKI_CYRILLIC_SOURCE = font-winitzki-cyrillic-$(XFONT_FONT_WINITZKI_CYRILLIC_VERSION).tar.bz2
-XFONT_FONT_WINITZKI_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_WINITZKI_CYRILLIC_VERSION = 1.0.4
+XFONT_FONT_WINITZKI_CYRILLIC_SOURCE = font-winitzki-cyrillic-$(XFONT_FONT_WINITZKI_CYRILLIC_VERSION).tar.xz
+XFONT_FONT_WINITZKI_CYRILLIC_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE = Public Domain
 XFONT_FONT_WINITZKI_CYRILLIC_LICENSE_FILES = COPYING
 
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash
index 640f56636a..68035e4195 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash
@@ -1,4 +1,3 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256  caebf42aec7be7f3bd40e0f232d6f34881b853dc84acfcdf7458358701fbe34a  font-xfree86-type1-1.0.4.tar.bz2
 # Locally computed
+sha256  a93c2c788a5ea1c002af7c8662cf9d9821fb1df51b8d2b2c5e0026dfdfea4837  font-xfree86-type1-1.0.5.tar.xz
 sha256  51e6bc6513b3fa94512d8dd570240498c878605f25292c3883d92fdfca18d0c6  COPYING
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index a26fbc8948..0b332d20bf 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_XFREE86_TYPE1_VERSION = 1.0.4
-XFONT_FONT_XFREE86_TYPE1_SOURCE = font-xfree86-type1-$(XFONT_FONT_XFREE86_TYPE1_VERSION).tar.bz2
-XFONT_FONT_XFREE86_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_XFREE86_TYPE1_VERSION = 1.0.5
+XFONT_FONT_XFREE86_TYPE1_SOURCE = font-xfree86-type1-$(XFONT_FONT_XFREE86_TYPE1_VERSION).tar.xz
+XFONT_FONT_XFREE86_TYPE1_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_XFREE86_TYPE1_LICENSE = MIT
 XFONT_FONT_XFREE86_TYPE1_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
