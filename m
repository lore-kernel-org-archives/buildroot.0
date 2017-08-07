From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  7 Aug 2017 19:24:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libatomic_ops: bump version to
	7.4.6
Message-ID: <20170807172449.8247-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libatomic_ops/libatomic_ops.hash | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 47a281ddf..9e67624d9 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ef8335676f18a111f885d48810ab090fb6bfad94e5a5dd76cdccd2a536828662  libatomic_ops-libatomic_ops-7_4_4.tar.gz
+sha256 cf7e61f7f929651b65d6186a03446819805c867f4f75c7148c8f26321eb66260  libatomic_ops-v7.4.6.tar.gz
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 52d274521..483f11812 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = libatomic_ops-7_4_4
+LIBATOMIC_OPS_VERSION = v7.4.6
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
-- 
2.11.0
