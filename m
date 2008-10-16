From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Oct 2008 14:32:20 -0600
Subject: [Buildroot] [PATCH 1/9] Typo fix in
	toolchain/external-toolchain/ext-tool.mk
Message-ID: <20081016203220.15826.26173.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Grant Likely <grant.likely@secretlab.ca>

Comment block header documentation typo
---

 toolchain/external-toolchain/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index a830329..bbf430c 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -3,7 +3,7 @@
 #
 # $1: source
 # $2: destination
-# $2: strip (y|n)       default is to strip
+# $3: strip (y|n)       default is to strip
 #
 copy_toolchain_lib_root = \
 	LIB="$(strip $1)"; \
