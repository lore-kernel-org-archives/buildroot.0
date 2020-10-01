From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Oct 2020 21:33:11 +0200
Subject: [Buildroot] [git commit] package/cppzmq: bump to version 4.7.0
Message-ID: <20201001192357.E0B57826D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0039c783a254468f1b1da775a08900473729826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/zeromq/cppzmq/releases/tag/v4.7.0

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cppzmq/cppzmq.hash | 4 ++--
 package/cppzmq/cppzmq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index f0e256dc14..7e40d4e32f 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e9203391a0b913576153a2ad22a2dc1479b1ec325beb6c46a3237c669aef5a52  cppzmq-4.6.0.tar.gz
-sha256 7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
+sha256  ffbedc8ffb95caea0b82f9be208c8ac5d6040870b63f2a9c780ccff681d5464c  cppzmq-4.7.0.tar.gz
+sha256  7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index c2994ecfcb..0f0ace2541 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.6.0
+CPPZMQ_VERSION = 4.7.0
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
