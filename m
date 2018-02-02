From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  2 Feb 2018 10:16:30 -0200
Subject: [Buildroot] [PATCH] liburiparser: bump to version 0.8.4
Message-ID: <20180202121630.26394-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/liburiparser/liburiparser.hash | 8 +++++---
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index 84340f8b9c..9e9517c17f 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,5 @@
-# From http://sourceforge.net/projects/uriparser/files/Sources/0.8.1/
-md5	4e4c5f0ee6abb111a431c45e144247aa		uriparser-0.8.1.tar.bz2
-sha1	4405d8baa0d9f5bc0319e6d5e68770acab67b602	uriparser-0.8.1.tar.bz2
+# From http://sourceforge.net/projects/uriparser/files/Sources/0.8.4/
+md5	9aabdc3611546f553f4af372167de6d6		uriparser-0.8.4.tar.bz2
+sha1	7a1948c20bed54b04dad0e1d7d2fa8f80fc7b2b3	uriparser-0.8.4.tar.bz2
+# Locally calculated
+sha256  c6ef125800c2ef13a41a22126bfc77e8b8c08993a6b96196117695988ea76249  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 7466a777a3..856a6aafd4 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.8.1
+LIBURIPARSER_VERSION = 0.8.4
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
 LIBURIPARSER_SITE = http://sourceforge.net/projects/uriparser/files/Sources/$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
-- 
2.14.3
