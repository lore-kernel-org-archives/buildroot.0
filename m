From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:46:50 +0100
Subject: [Buildroot] [git commit] package/grpc: bump to version 1.36.2
Message-ID: <20210316202334.117B9814E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b008910936c1d268bda1469827a97a387bdab771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/grpc.hash | 2 +-
 package/grpc/grpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 2e6bd71cb3..cfeb7eaa29 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a5127c81487f4e3e57973bb332f04b9159f94d860c207e096d8a587d371edbd  grpc-1.36.0.tar.gz
+sha256  51403542b19e9ed5d3b6551ce4a828e17883a1593d4ca408b098f04b0767d202  grpc-1.36.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 8426ff5736..8a04435654 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.36.0
+GRPC_VERSION = 1.36.2
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
