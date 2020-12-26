From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Dec 2020 11:41:49 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/{libuv,
 uvw}: bump to versions 1.38.0, 2.6.0_libuv-v1.38
Message-ID: <20201226110905.8994F8153B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32c7626f32ff958f92247c306a8b030fc0c7cf33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3634b9d11a0f84c1055e5814182a1cf16f064045)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 package/uvw/uvw.hash     | 2 +-
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 8e1824f397..2aba18490e 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7afa3c8a326b3eed02a9addb584ae7e995ae4d30516cad5e1e4af911931162a6  libuv-1.37.0.tar.gz
+sha256  2cd9a757fe6c512440933e2bdcab21143d4aa6249b2541399908ce038b756c9d  libuv-1.38.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index e61f565b54..493168cd99 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.37.0
+LIBUV_VERSION = 1.38.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index bdc1524bfe..f842345ea6 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bae3e0eccee602b3fb86d89db0c69ae2022a92142f50a042f0949da678614a6c  uvw-2.5.0_libuv-v1.37.tar.gz
+sha256  2695276bb4b154174ac0a6401bde5c0768bca99a43c9a469af67526f7e2e9410  uvw-2.6.0_libuv-v1.38.tar.gz
 sha256  755b2f245af22830c15b60c54469c0d92fbed42009b0d0074cec4b3959905757  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 98c61c80ac..dd9b6b27dc 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 2.5.0_libuv-v1.37
+UVW_VERSION = 2.6.0_libuv-v1.38
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
