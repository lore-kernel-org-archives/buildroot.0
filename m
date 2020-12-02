From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  2 Dec 2020 21:15:51 +0100
Subject: [Buildroot] [PATCH/next v1] package/ripgrep: bump version to 12.1.1
Message-ID: <20201202201551.6380-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ripgrep/ripgrep.hash | 4 ++--
 package/ripgrep/ripgrep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 0841c0185c..6b75f6f383 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3 ripgrep-0.8.1.tar.gz
-sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f LICENSE-MIT
+sha256  2513338d61a5c12c8fea18a0387b3e0651079ef9b31f306050b1f0aaa926271e  ripgrep-12.1.1.tar.gz
+sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 9dd8d58de1..bbc24e5889 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RIPGREP_VERSION = 0.8.1
+RIPGREP_VERSION = 12.1.1
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
-- 
2.29.2
