From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 28 Aug 2017 19:49:03 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
	mesa3d-headers}: bump version to 17.1.8
Message-ID: <20170828174903.8919-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0ef08b66b..c30c67366 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.1.7
+MESA3D_HEADERS_VERSION = 17.1.8
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b04689b12..82a97d5ec 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-August/000349.html
-md5 e40bb428a263bd28cbf6478dae45b207  mesa-17.1.7.tar.xz
-sha1 dfc7decc37bbad96bb0af8fa6dedae59424a9370  mesa-17.1.7.tar.xz
-sha256 69f472a874b1122404fa0bd13e2d6bf87eb3b9ad9c21d2f39872a96d83d9e5f5  mesa-17.1.7.tar.xz
-sha512 a1cb22b78c74572bef720c132294a028413402520260afff3d46e79f8837dce35aafd8675a8d6834574a4a15ded3611f06dddd5a9fc5882a6dcedab63d0b3e35  mesa-17.1.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-August/000352.html
+md5 829777b6a95090e8ea58be93f00e75c7  mesa-17.1.8.tar.xz
+sha1 dee665bfc495c992967e439463f25f5061c9be16  mesa-17.1.8.tar.xz
+sha256 75ed2eaeae26ddd536150f294386468ae2e1a7717948c41cd14b7875be5269db  mesa-17.1.8.tar.xz
+sha512 d29fd999d75967683f5aa836cf0b701705f54de428ebbbac059c3e335e94552c0b455aa67fa2870464a086dc58994f2f320710a1abc265dea363241aede71c5b  mesa-17.1.8.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 71978f877..76f632d7c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.1.7
+MESA3D_VERSION = 17.1.8
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
