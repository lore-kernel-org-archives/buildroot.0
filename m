From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 24 Feb 2021 11:31:51 +0100
Subject: [Buildroot] [PATCH 2/4] package/lttng-libust: bump to version 2.12.1
In-Reply-To: <20210224103154.174602-1-nolange79@gmail.com>
References: <20210224103154.174602-1-nolange79@gmail.com>
Message-ID: <20210224103154.174602-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/lttng-libust/lttng-libust.hash | 4 ++--
 package/lttng-libust/lttng-libust.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 62a65897f4..40bd870e86 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-ust/lttng-ust-2.12.0.tar.bz2.sha256
-sha256  1983edb525f3f27e3494088d8d5389b4c71af66bbfe63c6f1df2ad95aa44a528  lttng-ust-2.12.0.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.12.1.tar.bz2.sha256
+sha256  48a3948b168195123a749d22818809bd25127bb5f1a66458c3c012b210d2a051  lttng-ust-2.12.1.tar.bz2
 
 # Hash for license file
 sha256  74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index f3c660c56f..69dc4473f0 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.12.0
+LTTNG_LIBUST_VERSION = 2.12.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
-- 
2.30.0
