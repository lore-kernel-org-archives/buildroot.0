From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Jul 2020 07:18:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/libva-utils: bump version to 2.8.0
In-Reply-To: <20200701051851.26560-1-bernd.kuhls@t-online.de>
References: <20200701051851.26560-1-bernd.kuhls@t-online.de>
Message-ID: <20200701051851.26560-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://github.com/intel/libva-utils/blob/v2.8-branch/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-utils/libva-utils.hash | 6 +++---
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 45bbbf8517..a83e28389b 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva-utils/releases/download/2.7.1/libva-utils-2.7.1.tar.bz2.sha1sum
-sha1  9e86f45f76c169e7d376ab757d5bf14b7641475b  libva-utils-2.7.1.tar.bz2
+# From https://github.com/intel/libva-utils/releases/download/2.8.0/libva-utils-2.8.0.tar.bz2.sha1sum
+sha1  10351adf67aa03f5eeb54cb0aab3e2631ba4d102  libva-utils-2.8.0.tar.bz2
 # Locally computed
-sha256  ffcd698a7d4312750d7c9338ba6b26774c7028ee6f9f3cbbf34c122c05bcea9a  libva-utils-2.7.1.tar.bz2
+sha256  8acad2c16bfef408643cf4de56c324345449f202e4a3a5b012a62a1d3af400ef  libva-utils-2.8.0.tar.bz2
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index cb1df66459..5d3fb95c41 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.7.1
+LIBVA_UTILS_VERSION = 2.8.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
-- 
2.26.2
