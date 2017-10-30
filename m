From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Oct 2017 22:49:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
	mesa3d-headers}: bump version to 17.2.4
Message-ID: <20171030214921.19902-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 12 +++++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index a978e6430b..c9db3f551b 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.2.3
+MESA3D_HEADERS_VERSION = 17.2.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e4bd8abe96..476e1bcb29 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-October/000367.html
-md5 a7dca71afbc7294cb7d505067fd44ef6  mesa-17.2.3.tar.xz
-sha1 c46b8c71fe44e3346323835dc9a44cdfe2bffac7  mesa-17.2.3.tar.xz
-sha256 a0b0ec8f7b24dd044d7ab30a8c7e6d3767521e245f88d4ed5dd93315dc56f837  mesa-17.2.3.tar.xz
-sha512 749a0a46b772974633e405804ace7f509afb79f47811dbbdd390333721d744f2ac64f985ff1fd6c5aa3019b700be70bc1f75f60745ed9f4c5b08a9a8f77dfc76  mesa-17.2.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-October/000371.html
+md5 cf0b7a297eedd0549cda5ba071d7561f  mesa-17.2.4.tar.xz
+sha1 2faad5bd48243a1b80f5522a26144a176f841a20  mesa-17.2.4.tar.xz
+sha256 5ba408fecd6e1132e5490eec1a2f04466214e4c65c8b89b331be844768c2e550  mesa-17.2.4.tar.xz
+sha512 665b63aab6af3f8f263f182d85d9ad71db7a23bcbaf67d62fe53c258cb0f600266ac82e72d681ec20cf7c66b47d4076aad5c3f553519f19110ee577da2707085  mesa-17.2.4.tar.xz
+# License
+sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index dca8d36936..9305523bdf 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.2.3
+MESA3D_VERSION = 17.2.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
