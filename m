From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:49 +0100
Subject: [Buildroot] [PATCH 43/51] lttng-libust: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-43-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/lttng-libust/lttng-libust.hash | 6 ++++++
 package/lttng-libust/lttng-libust.mk   | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 package/lttng-libust/lttng-libust.hash

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
new file mode 100644
index 0000000..ac897f3
--- /dev/null
+++ b/package/lttng-libust/lttng-libust.hash
@@ -0,0 +1,6 @@
+# From http://lttng.org/files/lttng-ust/lttng-ust-2.6.0-rc1.tar.bz2.sha1
+sha1    8db1627f16f466589c7842822ea4ad2f9d406b02  lttng-ust-2.5.1.tar.bz2
+# From http://lttng.org/files/lttng-ust/lttng-ust-2.6.0-rc1.tar.bz2.md5
+md5     d551d601bdc1a9285e1cd6c5728fb803  lttng-ust-2.5.1.tar.bz2
+# Locally generated
+sha256  fbd9e2d78641e5c659f1d51f8097c8279c155ff50f8e38a4c57f188ca4b84546  lttng-ust-2.5.1.tar.bz2
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index a84cbc6..e6f02ca 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.5.0
+LTTNG_LIBUST_VERSION = 2.5.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
-- 
2.1.1
