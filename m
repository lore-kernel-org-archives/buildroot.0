From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 15 Nov 2020 21:56:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.40.0, 2.8.0_libuv_v1.40
Message-ID: <20201115195654.88212-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 package/uvw/uvw.hash     | 2 +-
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 2aba18490e..c682affae7 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2cd9a757fe6c512440933e2bdcab21143d4aa6249b2541399908ce038b756c9d  libuv-1.38.0.tar.gz
+sha256  70fe1c9ba4f2c509e8166c0ca2351000237da573bb6c82092339207a9715ba6b  libuv-1.40.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 493168cd99..5876ab8935 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.38.0
+LIBUV_VERSION = 1.40.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index f842345ea6..ba8c7b893d 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2695276bb4b154174ac0a6401bde5c0768bca99a43c9a469af67526f7e2e9410  uvw-2.6.0_libuv-v1.38.tar.gz
+sha256  aa5769f5b9ba50de72ab02a8f8acf298b4aa9ceaef07992418a13a0fa119ce7d  uvw-2.8.0_libuv_v1.40.tar.gz
 sha256  755b2f245af22830c15b60c54469c0d92fbed42009b0d0074cec4b3959905757  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index dd9b6b27dc..39952caa11 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 2.6.0_libuv-v1.38
+UVW_VERSION = 2.8.0_libuv_v1.40
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
-- 
2.27.0
