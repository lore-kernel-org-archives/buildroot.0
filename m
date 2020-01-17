From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 17 Jan 2020 22:57:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/cppzmq: bump to version 4.6.0
Message-ID: <20200117215754.2581091-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppzmq/cppzmq.hash | 2 +-
 package/cppzmq/cppzmq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index 98b365f61b..f0e256dc14 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 64eb4e58eaf0c77505391c6c9a606cffcb57c6086f3431567a1ef4a25b01fa36  cppzmq-4.5.0.tar.gz
+sha256 e9203391a0b913576153a2ad22a2dc1479b1ec325beb6c46a3237c669aef5a52  cppzmq-4.6.0.tar.gz
 sha256 7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 7b65383bff..c2994ecfcb 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.5.0
+CPPZMQ_VERSION = 4.6.0
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
-- 
2.24.1
