From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 10 Sep 2017 05:37:30 -0500
Subject: [Buildroot] [PATCH] jemalloc: bump version to 5.0.1
Message-ID: <20170910103730.17091-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/jemalloc/jemalloc.hash | 2 +-
 package/jemalloc/jemalloc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
index 65dbecc530..50ac682839 100644
--- a/package/jemalloc/jemalloc.hash
+++ b/package/jemalloc/jemalloc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9409d85664b4f135b77518b0b118c549009dc10f6cba14557d170476611f6780  jemalloc-4.5.0.tar.bz2
+sha256 4814781d395b0ef093b21a08e8e6e0bd3dab8762f9935bbfb71679b0dea7c3e9  jemalloc-5.0.1.tar.bz2
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 17a3c9aad9..2424eb54c7 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JEMALLOC_VERSION = 4.5.0
+JEMALLOC_VERSION = 5.0.1
 JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
 JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLOC_VERSION)
 JEMALLOC_LICENSE = BSD-2-Clause
-- 
2.13.5
