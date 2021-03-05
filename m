From: Michael Vetter <jubalh@iodoru.org>
Date: Fri,  5 Mar 2021 16:49:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump version to 2.0.26
Message-ID: <20210305154913.29414-1-jubalh@iodoru.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes:
* Fix JP2 decoder bug that can cause a null pointer dereference for
  some invalid CDEF boxes. (#268)

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index d4ed191f91..c1f1b4f602 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f5bc48e2884bcabd2aca1737baff4ca962ec665b6eb673966ced1f7adea07edb  jasper-2.0.25.tar.gz
+sha256  a82a119e85b7d1f448e61309777fa5f79053a9adca4a2b5bfe44be5439fb8fea  jasper-2.0.26.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index d487e8e2d6..bc66f11057 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.25
+JASPER_VERSION = 2.0.26
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-- 
2.26.2
