From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2020 12:36:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/msgpack: bump version to 3.2.1
Message-ID: <20200412103621.1287449-1-bernd.kuhls@t-online.de>
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
index 6b3a7ef134..3829a70222 100644
--- a/package/msgpack/msgpack.hash
+++ b/package/msgpack/msgpack.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ff865a36bad5c72b8e7ebc4b7cf5f27a820fce4faff9c571c1791e3728355a39  msgpack-3.2.0.tar.gz
+sha256  464f46744a6be778626d11452c4db3c2d09461080c6db42e358e21af19d542f6  msgpack-3.2.1.tar.gz
 sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 1e13464ca1..81670deddc 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSGPACK_VERSION = 3.2.0
+MSGPACK_VERSION = 3.2.1
 MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
 MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
-- 
2.25.0
