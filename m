From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Aug 2019 13:58:24 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libnftnl: bump version to 1.1.4
Message-ID: <20190831115824.21576-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(cosmetic) Removed patch version number from
0001-Add-Libs.private-field-to-libnftnl.pc.patch

Changelog: https://git.netfilter.org/libnftnl/log/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../libnftnl/0001-Add-Libs.private-field-to-libnftnl.pc.patch   | 2 +-
 package/libnftnl/libnftnl.hash                                  | 2 +-
 package/libnftnl/libnftnl.mk                                    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnftnl/0001-Add-Libs.private-field-to-libnftnl.pc.patch b/package/libnftnl/0001-Add-Libs.private-field-to-libnftnl.pc.patch
index ce3e9500ee..1b6143aa82 100644
--- a/package/libnftnl/0001-Add-Libs.private-field-to-libnftnl.pc.patch
+++ b/package/libnftnl/0001-Add-Libs.private-field-to-libnftnl.pc.patch
@@ -1,7 +1,7 @@
 From d89fca062ba966332b573673fdd5c4cf01c3e2f5 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Mon, 29 Dec 2014 15:32:08 +0100
-Subject: [PATCH 2/2] Add Libs.private field to libnftnl.pc
+Subject: [PATCH] Add Libs.private field to libnftnl.pc
 
 Static linking userspace programs such as nftables against libnftnl
 currently doesn't work out of the box, because libnftnl is linked
diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 64bd07a235..315e2e1522 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256	22dd97d3b06ae8c67499506e2bfd6803ce116479076ec3700e7a4c7cd9fcba0f  	libnftnl-1.1.3.tar.bz2
+sha256	c8c7988347adf261efac5bba59f8e5f995ffb65f247a88cc144e69620573ed20	libnftnl-1.1.4.tar.bz2
 sha256	98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24	COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index a3fba488c4..a4e9b4b940 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.1.3
+LIBNFTNL_VERSION = 1.1.4
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
-- 
2.20.1
