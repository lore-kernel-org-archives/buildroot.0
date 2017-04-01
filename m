From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Apr 2017 21:08:22 +0200
Subject: [Buildroot] [PATCH 2/3] package/libdrm: bump version to 2.4.76
In-Reply-To: <20170401190823.11566-1-bernd.kuhls@t-online.de>
References: <20170401190823.11566-1-bernd.kuhls@t-online.de>
Message-ID: <20170401190823.11566-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 4 ++--
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index dc10b295f..f9d82174c 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-January/131209.html
-sha256 2d5a500eef412cc287d12268eed79d571e262d4957a2ec9258073f305985054f  libdrm-2.4.75.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-March/137337.html
+sha256 7cdfb83ea77def453299dd95332aa9257c9f3534ff5844f5c0ce87265c275f3a  libdrm-2.4.76.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index ae7b75bad..8ece196d2 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.75
+LIBDRM_VERSION = 2.4.76
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.11.0
