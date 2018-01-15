From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 15 Jan 2018 16:55:38 -0500
Subject: [Buildroot] [PATCH] lttng-libust: bump version to 2.10.1
Message-ID: <20180115215538.12802-1-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/lttng-libust/lttng-libust.hash | 6 +++---
 package/lttng-libust/lttng-libust.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 897bcf6299..6e5fdf23ce 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-ust/lttng-ust-2.10.0.tar.bz2.{md5,sha1}
-md5 8c539bc749c4533877095aa4c0f3cee8  lttng-ust-2.10.0.tar.bz2
-sha1 40fd9f1f405d155fe27a699cf44b87c768a20e7e  lttng-ust-2.10.0.tar.bz2
+# From http://lttng.org/files/lttng-ust/lttng-ust-2.10.1.tar.bz2.{md5,sha1}
+md5 4863cc2f9f0a070b42438bb646bbba06  lttng-ust-2.10.1.tar.bz2
+sha1 3779c9ed75e3fa532797431f2c47979ce73614a7  lttng-ust-2.10.1.tar.bz2
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 5496e926d5..d645220ba6 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################

 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.10.0
+LTTNG_LIBUST_VERSION = 2.10.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
--
2.15.1
