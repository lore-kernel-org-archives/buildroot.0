From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 25 Mar 2020 17:43:00 -0700
Subject: [Buildroot] [PATCH 2/2] package/libite: bump version to 2.2.0
In-Reply-To: <20200326004300.17121-1-bluemrp9@gmail.com>
References: <20200326004300.17121-1-bluemrp9@gmail.com>
Message-ID: <20200326004300.17121-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hash for LICENSE also changed. The following text was removed:

Note: Much of the code in libite (-lite) is written by Claudio Matsuoka
      for Finit and released under the MIT/X11 license.  Joachim Nilsson
      later improved on the Finit code base and included pieces of
      software released under the ISC and BSD licenses.  See each
      respective file for license details.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/libite/libite.hash | 8 ++++----
 package/libite/libite.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index e16e78c01f..1a553d2bcb 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,8 +1,8 @@
-# From https://github.com/troglobit/libite/releases/download/v2.1.2/libite-2.1.2.tar.xz.md5
-md5  3c23186dec3f3ae135ec4e8b58581f4e  libite-2.1.2.tar.xz
+# From https://github.com/troglobit/libite/releases/download/v2.2.0/libite-2.2.0.tar.xz.md5
+md5  8533ab27d0d4a7c745f11925907795a9  libite-2.2.0.tar.xz
 
 # Locally calculated
-sha256  7a16825c6d02040767ccb9f3faed4bf0e6841857a46cc4cb9e9f36b78a6c7cb3  libite-2.1.2.tar.xz
-sha256  dc6eae50f69af0e848fd6957cdf48895563b4d15fdde7c9d20ae2bfdefbc2b83  LICENSE
+sha256  3fdeb48ea3d9220f91111ed7a68e1e68edfc70346d0108a49bab73a47a7dd761  libite-2.2.0.tar.xz
+sha256  a8a7506c64ce46a58c17838b0f678f8c2567d71869402f97d19460ddec4882f5  LICENSE
 sha256  89053891d46d04a21d4a492f68038703e179986baffa458201810f4222b57427  src/chomp.c
 sha256  a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 62fc0df00a..69a90d7187 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.1.2
+LIBITE_VERSION = 2.2.0
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
-- 
2.26.0
