From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Dec 2020 11:41:43 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/{libuv,
 uvw}: bump to versions 1.37.0, 2.5.0_libuv-v1.37
Message-ID: <20201226110905.84F23807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c19df4469e5efddb055bfc0e8601ab0c9bdb0f54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7d9ed0a19d8e88b56b389187c38b44563e33e5ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 package/uvw/uvw.hash     | 2 +-
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 270fba722d..8e1824f397 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ff84a26c79559e511f087aa67925c3b4e0f0aac60cd8039d4d38b292f208ff58  libuv-1.35.0.tar.gz
+sha256  7afa3c8a326b3eed02a9addb584ae7e995ae4d30516cad5e1e4af911931162a6  libuv-1.37.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 7e75dcb194..e61f565b54 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.35.0
+LIBUV_VERSION = 1.37.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index c74db9b916..bdc1524bfe 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  578179ee76d010c5c9fb180a1b60e45e9f04968718d62c51ec0f71b43564bab9  uvw-2.3.1_libuv-v1.34.tar.gz
+sha256  bae3e0eccee602b3fb86d89db0c69ae2022a92142f50a042f0949da678614a6c  uvw-2.5.0_libuv-v1.37.tar.gz
 sha256  755b2f245af22830c15b60c54469c0d92fbed42009b0d0074cec4b3959905757  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 71b23b2ac1..98c61c80ac 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 2.3.1_libuv-v1.34
+UVW_VERSION = 2.5.0_libuv-v1.37
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
