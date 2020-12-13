From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Dec 2020 18:15:31 +0100
Subject: [Buildroot] [PATCH] package/xapian: bump to version 1.4.17
In-Reply-To: <20201213171531.5182-1-gilles.talis@gmail.com>
References: <20201213171531.5182-1-gilles.talis@gmail.com>
Message-ID: <20201213171531.5182-3-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 3ebaea7059..7105fbe7da 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2020-June/009813.html
-sha256  4937f2f49ff27e39a42150e928c8b45877b0bf456510f0785f50159a5cb6bf70  xapian-core-1.4.16.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2020-August/009814.html
+sha256  b5eb8556dea1b0cad4167a66223522e66d670ec1eba16c7fdc844ed6b652572e  xapian-core-1.4.17.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 19d301e980..3ad816a36f 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.16
+XAPIAN_VERSION = 1.4.17
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
-- 
2.25.1
