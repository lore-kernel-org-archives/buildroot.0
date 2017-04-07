From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Apr 2017 22:17:31 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.78
Message-ID: <20170407202025.73D907F8B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06988e58ee76cb26c2f88c694f2289f4c5138f1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add additional md5, sha1 & sha256 hashes according to buildroot docs:
http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash

> If upstream provides more than one type of hash (e.g. sha1 and sha512),
> then it is best to add all those hashes in the .hash file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 7 +++++--
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index eb826ed..82bcc05 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-April/137998.html
-sha512 df313bdd9186efdb0e60acdd55e0d5dba402b19011bc3899d56efb4d065f67b6e8c44108fbd8fd258120d4b5c1cc53090beaab732c763bf52f8b352d3c30d101  libdrm-2.4.77.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-April/138416.html
+md5 049ee80ce816cbef7669e7807b2ee816  libdrm-2.4.78.tar.bz2
+sha1 fdf0e8f2951e75d8d230a7960d32f4f3ca6ceb90  libdrm-2.4.78.tar.bz2
+sha256 3dbe2ed3e2ee6ebe8a848195286ef362f66675a7102958e42906d734aa6925d8  libdrm-2.4.78.tar.bz2
+sha512 f5010583322a4742bbbb55d5d7083f11366be0f11ae51a6830a9ce14c1cb7e2a8163f92db15d2c90a464a5cfce9d3bfa4e6f9739bcb382fe7007eae1b288ee85  libdrm-2.4.78.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 9a78f20..2b294fe 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.77
+LIBDRM_VERSION = 2.4.78
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
