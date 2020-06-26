From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 27 Jun 2020 00:06:00 +0200
Subject: [Buildroot] [PATCH 2/4] package/lttng-libust: bump version to 2.12.0
In-Reply-To: <20200626220603.29561-1-nolange79@gmail.com>
References: <20200626220603.29561-1-nolange79@gmail.com>
Message-ID: <20200626220603.29561-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update hash file formatting (2 spaces).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/lttng-libust/lttng-libust.hash | 6 +++---
 package/lttng-libust/lttng-libust.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 85e1acc261..62a65897f4 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-ust/lttng-ust-2.11.0.tar.bz2.sha256
-sha256 683280cfe5e12021e64c32cef9eeb0128f1f23dec32ba28adb5a2074be37c4d8  lttng-ust-2.11.0.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.12.0.tar.bz2.sha256
+sha256  1983edb525f3f27e3494088d8d5389b4c71af66bbfe63c6f1df2ad95aa44a528  lttng-ust-2.12.0.tar.bz2
 
 # Hash for license file
-sha256 74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
+sha256  74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 0c2fdb57ef..8e6537690b 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.11.0
+LTTNG_LIBUST_VERSION = 2.12.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
-- 
2.27.0
