From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 31 May 2021 21:02:56 +0200
Subject: [Buildroot] [PATCH 3/3] package/grpc: bump version to 1.38.0
In-Reply-To: <20210531190258.4092984-1-buildroot@heine.tech>
References: <20210531190258.4092984-1-buildroot@heine.tech>
Message-ID: <20210531190258.4092984-3-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/grpc/grpc.hash | 2 +-
 package/grpc/grpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 925761f37a..6f4b765c0f 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  acf247ec3a52edaee5dee28644a4e485c5e5badf46bdb24a80ca1d76cb8f1174  grpc-1.37.1.tar.gz
+sha256  abd9e52c69000f2c051761cfa1f12d52d8b7647b6c66828a91d462e796f2aede  grpc-1.38.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index f3ce3de34f..41d3135b91 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.37.1
+GRPC_VERSION = 1.38.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
-- 
2.25.1
