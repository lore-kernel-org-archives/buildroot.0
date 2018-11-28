From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:05:50 +0100
Subject: [Buildroot] [git commit] package/msgpack: bump to version 3.1.1
Message-ID: <20181202071600.21A7A803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fe3edaf497e3bc370fd959c564fd788dc6a44f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/msgpack/msgpack.hash | 4 +++-
 package/msgpack/msgpack.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
index f1033ade42..df4e54b181 100644
--- a/package/msgpack/msgpack.hash
+++ b/package/msgpack/msgpack.hash
@@ -1,2 +1,4 @@
 # Locally computed:
-sha256  9c87f80fc651b900772deaef0ab154b63160c74d292529b5be6d06d6485d4640  msgpack-2.1.5.tar.gz
+sha256  bda49f996a73d2c6080ff0523e7b535917cd28c8a79c3a5da54fc29332d61d1e  msgpack-3.1.1.tar.gz
+sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 38df8f53af..2b02a4d7f7 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSGPACK_VERSION = 2.1.5
+MSGPACK_VERSION = 3.1.1
 MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
 MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
