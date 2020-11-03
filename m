From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue,  3 Nov 2020 09:05:39 +0100
Subject: [Buildroot] [PATCH] package/grpc: bump version to 1.33.2
Message-ID: <20201103080537.4942-1-buildroot@heine.tech>
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
index 57852ec63f..b264694800 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  58eaee5c0f1bd0b92ebe1fa0606ec8f14798500620e7444726afcaf65041cb63  grpc-1.33.1.tar.gz
+sha256  2060769f2d4b0d3535ba594b2ab614d7f68a492f786ab94b4318788d45e3278a  grpc-1.33.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index cca334dec5..04c741fe9d 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.33.1
+GRPC_VERSION = 1.33.2
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
-- 
2.25.1
