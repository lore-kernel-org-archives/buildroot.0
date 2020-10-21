From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 21 Oct 2020 17:18:37 +0200
Subject: [Buildroot] [PATCH 3/4] package/grpc: bump version to 1.33.1
In-Reply-To: <20201021151839.31731-1-buildroot@heine.tech>
References: <20201021151839.31731-1-buildroot@heine.tech>
Message-ID: <20201021151839.31731-3-buildroot@heine.tech>
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
index 3a2dbe2d8a..57852ec63f 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f880ebeb2ccf0e47721526c10dd97469200e40b5f101a0d9774eb69efa0bd07a  grpc-1.32.0.tar.gz
+sha256  58eaee5c0f1bd0b92ebe1fa0606ec8f14798500620e7444726afcaf65041cb63  grpc-1.33.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index a6c1490fac..cca334dec5 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.32.0
+GRPC_VERSION = 1.33.1
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
-- 
2.25.1
