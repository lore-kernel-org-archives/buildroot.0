From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 21:07:56 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.95
Message-ID: <20181007191921.8A1608DFE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ae0a7f0288b656d88bd4995a81069177be8a281
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 2043ee780e..ac59dac4f5 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2018-August/185041.html
-md5 0ba45ad1551b2c1b6df0797a3e65f827  libdrm-2.4.93.tar.bz2
-sha1 550ba4bb50236fc2e9138cbeadcb4942ce09410e  libdrm-2.4.93.tar.bz2
-sha256 6e84d1dc9548a76f20b59a85cf80a0b230cd8196084f5243469d9e65354fcd3c  libdrm-2.4.93.tar.bz2
-sha512 ba4221e8d6a3a9872fb6d30a0ea391e30ea0e17f249c66f067bed9c2161ed1ad8083959cb2c212834c6566c3e025f4daae31e9533d77aae19bbbbb9de6c2ab3d  libdrm-2.4.93.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2018-October/191989.html
+md5 41b9ed196a27f5dc7fb88412b704e9fd  libdrm-2.4.95.tar.bz2
+sha1 fd7c1002001ef1aa1b6094eb2b78f1031e233bb3  libdrm-2.4.95.tar.bz2
+sha256 ef772a51b4bed97a2c243194d9a98da97319e0dbdf800d07773b025aacc895c6  libdrm-2.4.95.tar.bz2
+sha512 9bf8178a871bb059471f58f236c8362245e08877b732b2c8366d402e8066c9a74707e4ec3bf680fca12303f1319875edc98ae8e31bc9826f172798f47197e631  libdrm-2.4.95.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 1871488284..e5b693cb11 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.93
+LIBDRM_VERSION = 2.4.95
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
