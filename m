From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 08:36:10 +0100
Subject: [Buildroot] [git commit] package/xapian: bump to version 1.4.15
Message-ID: <20200322072315.0B2BF83C50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc93ede5ff54c76340bc126342a480e79e18d18f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index e4f8dfa23f..6e1ae3c423 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2019-November/009774.html
-sha256 975a7ac018c9d34a15cc94a3ecc883204403469f748907e5c4c64d0aec2e4949 xapian-core-1.4.14.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2020-February/009792.html
+sha256 b168e95918a01e014fb6a6cbce26e535f80da4d4791bfa5a0e0051fcb6f950ea xapian-core-1.4.15.tar.xz
 
 # locally computed
 sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42 COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 57aba5e039..9fbe0b36f8 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.14
+XAPIAN_VERSION = 1.4.15
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
