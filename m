From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Dec 2020 11:41:35 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libuv: bump to
 version 1.35.0
Message-ID: <20201226110905.763308830E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4aa12ace243ce9161df682f9ba814ece77348f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 60011f1456fa58208983b5fd105992a6ed7cb275)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 923cd1cb37..270fba722d 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3e0105c9b26e181e0547607cb6893462beb0c652674c3795766b2e5555288b3  libuv-1.34.1.tar.gz
+sha256  ff84a26c79559e511f087aa67925c3b4e0f0aac60cd8039d4d38b292f208ff58  libuv-1.35.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index d7160d1e0a..7e75dcb194 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.34.1
+LIBUV_VERSION = 1.35.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
