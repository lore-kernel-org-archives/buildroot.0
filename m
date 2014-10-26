From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:51 +0100
Subject: [Buildroot] [PATCH 45/51] lttng-modules: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-45-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a hash file

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/lttng-modules/lttng-modules.hash | 6 ++++++
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 package/lttng-modules/lttng-modules.hash

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
new file mode 100644
index 0000000..25dba0c
--- /dev/null
+++ b/package/lttng-modules/lttng-modules.hash
@@ -0,0 +1,6 @@
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.5.1.tar.bz2.sha1
+sha1   75d9662ed3f8d7c53833663a5d89fe31c015b3ca  lttng-modules-2.5.1.tar.bz2
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.5.1.tar.bz2.md5
+md5    2d99bb7311ba92e82e3b675f0b8dee7d  lttng-modules-2.5.1.tar.bz2
+# Locally generated
+sha256 962238175f0959ac71b97fdde144a3f76a84f63aea6b3645f94da88512bcccdb  lttng-modules-2.5.1.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 089fa62..02ec202 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.5.0
+LTTNG_MODULES_VERSION = 2.5.1
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
-- 
2.1.1
