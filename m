From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:50 +0100
Subject: [Buildroot] [PATCH 44/51] lttng-tools: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-44-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add hash file

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/lttng-tools/lttng-tools.hash | 2 ++
 package/lttng-tools/lttng-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/lttng-tools/lttng-tools.hash

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
new file mode 100644
index 0000000..c0c4bc1
--- /dev/null
+++ b/package/lttng-tools/lttng-tools.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256  3c6511e6ceef975cfe36b5644ab9bfaa6780c71b1d2551718279823924429739  lttng-tools-2.5.1.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index f42fb16..187b851 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.5.0
+LTTNG_TOOLS_VERSION = 2.5.1
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
-- 
2.1.1
