From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Apr 2021 14:03:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/cppzmq: bump to version 4.7.1
Message-ID: <20210410120355.69717-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/zeromq/cppzmq/releases/tag/v4.7.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppzmq/cppzmq.hash | 2 +-
 package/cppzmq/cppzmq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index 7e40d4e32f..4fd07b4052 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ffbedc8ffb95caea0b82f9be208c8ac5d6040870b63f2a9c780ccff681d5464c  cppzmq-4.7.0.tar.gz
+sha256  9853e0437d834cbed5d3c223bf1d755cadee70e7c964c6e42c4c6783dee5d02c  cppzmq-4.7.1.tar.gz
 sha256  7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 0f0ace2541..ccab92e2ef 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.7.0
+CPPZMQ_VERSION = 4.7.1
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
-- 
2.30.2
