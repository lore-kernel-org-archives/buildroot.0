From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Jan 2021 15:39:10 +1030
Subject: [Buildroot] [PATCH] package/pdbg: Bump to version v3.2
Message-ID: <20210111050910.339814-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/pdbg/pdbg.hash | 2 +-
 package/pdbg/pdbg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index bc5772f064d4..bc9f99b149b6 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 622446c76adbb41ccbe0b1e3a84b704ef66cdd8429e1e6fedec80493c54801e7 pdbg-3.1.tar.gz
+sha256 c47adcac1c404266217be8c4acb408d9eba59562b094c941e96e4f77f3ced7d2 pdbg-3.2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 79e4f5c7cc39..e8bb36c3272e 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 3.1
+PDBG_VERSION = 3.2
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
-- 
2.29.2
