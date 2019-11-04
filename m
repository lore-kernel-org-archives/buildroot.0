From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Nov 2019 08:26:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/msgpack: bump version to 3.2.0
Message-ID: <20191104072642.4837-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/msgpack/msgpack-c/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/msgpack/msgpack.hash | 2 +-
 package/msgpack/msgpack.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
index df4e54b181..6b3a7ef134 100644
--- a/package/msgpack/msgpack.hash
+++ b/package/msgpack/msgpack.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  bda49f996a73d2c6080ff0523e7b535917cd28c8a79c3a5da54fc29332d61d1e  msgpack-3.1.1.tar.gz
+sha256  ff865a36bad5c72b8e7ebc4b7cf5f27a820fce4faff9c571c1791e3728355a39  msgpack-3.2.0.tar.gz
 sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 781e67e37a..1e13464ca1 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSGPACK_VERSION = 3.1.1
+MSGPACK_VERSION = 3.2.0
 MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
 MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
-- 
2.20.1
