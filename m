From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Oct 2018 16:09:43 +1030
Subject: [Buildroot] [PATCH] pdbg: Bump to version v2.0
Message-ID: <20181029053943.19150-1-joel@jms.id.au>
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
index cd7a6b0cb7a6..2f11ad5996a1 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bb1a77b66322b6976c9a11a573cf29d59bf4179f839c0157aa1cd49db6c0f25c pdbg-pdbg-1.1-rc3.tar.gz
+sha256 da65ebbd9a710555e9684472ee36fff37e897111034fcc2c07172cc39016d169 pdbg-v2.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 45a1a288eebf..ba3b0b8877ed 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = pdbg-1.1-rc3
+PDBG_VERSION = v2.0
 PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
-- 
2.19.1
