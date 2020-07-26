From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jul 2020 21:47:15 +0200
Subject: [Buildroot] [git commit] package/xapian: bump to version 1.4.16
Message-ID: <20200726194558.2B6A38138E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a5a467eb0dabec6dac433a6fc5f0179b98ad67a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated indentation in hash file (two spaces)

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xapian/xapian.hash | 6 +++---
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 6e1ae3c423..3ebaea7059 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2020-February/009792.html
-sha256 b168e95918a01e014fb6a6cbce26e535f80da4d4791bfa5a0e0051fcb6f950ea xapian-core-1.4.15.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2020-June/009813.html
+sha256  4937f2f49ff27e39a42150e928c8b45877b0bf456510f0785f50159a5cb6bf70  xapian-core-1.4.16.tar.xz
 
 # locally computed
-sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42 COPYING
+sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 9fbe0b36f8..19d301e980 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.15
+XAPIAN_VERSION = 1.4.16
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
