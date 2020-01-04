From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 19:45:41 +0100
Subject: [Buildroot] [PATCH 3/3] package/libva-utils: bump version to 2.6.0
In-Reply-To: <20200104184541.3883743-1-bernd.kuhls@t-online.de>
References: <20200104184541.3883743-1-bernd.kuhls@t-online.de>
Message-ID: <20200104184541.3883743-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-utils/libva-utils.hash | 6 +++---
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index a50a01b4a1..881b56fca1 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva-utils/releases/download/2.5.0/libva-utils-2.5.0.tar.bz2.sha1sum
-sha1 1bd6f5bf14af7a8a72e867e3dc94fcdd90f9ad0f  libva-utils-2.5.0.tar.bz2
+# From https://github.com/intel/libva-utils/releases/download/2.6.0/libva-utils-2.6.0.tar.bz2.sha1sum
+sha1 ef6f9abe8954ec94bae0ea3bc82ffd1fa4fc5735  libva-utils-2.6.0.tar.bz2
 # Locally computed
-sha256 9238c9d5110d60f935683390b8383fdac3507346384cd5f117a23c6db1d72a17  libva-utils-2.5.0.tar.bz2
+sha256 2249b5d08bffc3862bbdcc9a6a4827afd504330b8d101564d39fe1a1e7adc426  libva-utils-2.6.0.tar.bz2
 sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 9b5cbdf97b..40b05e4590 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.5.0
+LIBVA_UTILS_VERSION = 2.6.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
-- 
2.20.1
