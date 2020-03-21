From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 15:43:13 +0100
Subject: [Buildroot] [git commit] package/kodi-*: mass update of license
 files
Message-ID: <20200321143010.9A2AE836C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cad21f319769c59de22963b58334fe45172caae3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch _LICENSE_FILES to debian/copyright instead of using a source
code file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash            | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk              | 2 +-
 package/kodi-platform/kodi-platform.hash                                | 2 +-
 package/kodi-platform/kodi-platform.mk                                  | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash    | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk      | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash      | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk        | 2 +-
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash    | 2 +-
 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk  | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash        | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk          | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash                | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk                  | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash              | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk                | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash                                  | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk                                    | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash                                | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk                                  | 2 +-
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash  | 2 +-
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk    | 2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 8067d495ca..6ff1edf8b9 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 c1d755230b0f2fe943cf7297a6d187371088f39391944d422d2bf5969c8863c1  kodi-peripheral-xarcade-51e1a4550a6c7d7feeb01760a731af17bea6c524.tar.gz
-sha256 6d79d409e34af80656244d38643cfb60c715b19a266d82fb27c4ec8caf46bb5b  src/addon.cpp
+sha256 848ad4f3a480c953b556467fb9a315dd352ec1d267e012144c46adc571e39efb  debian/copyright
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index 0946a90d7b..42d7af8a02 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -7,7 +7,7 @@
 KODI_PERIPHERAL_XARCADE_VERSION = 51e1a4550a6c7d7feeb01760a731af17bea6c524
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
-KODI_PERIPHERAL_XARCADE_LICENSE_FILES = src/addon.cpp
+KODI_PERIPHERAL_XARCADE_LICENSE_FILES = debian/copyright
 KODI_PERIPHERAL_XARCADE_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-platform/kodi-platform.hash b/package/kodi-platform/kodi-platform.hash
index 3c4da93afb..2f1164cfb5 100644
--- a/package/kodi-platform/kodi-platform.hash
+++ b/package/kodi-platform/kodi-platform.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 d5b9b61c1c22b471d948b2c8de50f77ccadbd908869b13b5d98c42f447268d56  kodi-platform-915da086fa7b4ea72796052a04ed6de95501b95c.tar.gz
-sha256 0c4ce7041d4a3059389fb8b6d85e417447072adbc149a55664e02cad6995b434  src/util/XMLUtils.h
+sha256 2f4bc4c1244b679121749378ff1a2b4b4e318897dac3d346a236432948ebeea7  debian/copyright
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
index 8bf517fa5d..8c42bfd953 100644
--- a/package/kodi-platform/kodi-platform.mk
+++ b/package/kodi-platform/kodi-platform.mk
@@ -7,7 +7,7 @@
 KODI_PLATFORM_VERSION = 915da086fa7b4ea72796052a04ed6de95501b95c
 KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
 KODI_PLATFORM_LICENSE = GPL-2.0+
-KODI_PLATFORM_LICENSE_FILES = src/util/XMLUtils.h
+KODI_PLATFORM_LICENSE_FILES = debian/copyright
 KODI_PLATFORM_INSTALL_STAGING = YES
 KODI_PLATFORM_DEPENDENCIES = libplatform kodi
 
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 4c1c0d0fc4..df07f9fbc5 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  b0f721d112282f633a769e7b077c5dd52e5045a8f1ae32c4e602b0e2e937acb0  kodi-screensaver-biogenesis-2.2.3-Leia.tar.gz
-sha256  2bca14bf4f7391885dc6bb7c7ef190238e529a03b92cb22c09a37c178bc94b76  src/Life.cpp
+sha256  d38b9e2768b49acdedcb21a202d12753c8f1d7e85e5ee24ff1e4aee3c7601a65  debian/copyright
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 7222c16bc3..562c279ec6 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -7,7 +7,7 @@
 KODI_SCREENSAVER_BIOGENESIS_VERSION = 2.2.3-Leia
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
+KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_BIOGENESIS_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 546f8c5c77..814d139689 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 02114c9c7467cba26ce93090ee66c015dd74fc1f0d74b46e609e53d1fd8fd218  kodi-screensaver-greynetic-2.2.2-Leia.tar.gz
-sha256 f3e1fc9e8f86842be8af2500e9b2a50ab8597ad997908228a00c3c8a4abb9426  src/GreyNetic.cpp
+sha256 2905fdee5c68dc4944c42711d45f47794e8fb881bd67d66d0875d10f9a2156a0  debian/copyright
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index d126251c7a..21cbe23a64 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -7,7 +7,7 @@
 KODI_SCREENSAVER_GREYNETIC_VERSION = 2.2.2-Leia
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
+KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 01a26bf5fd..9a657a10dd 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  2d2c795853c5a72184bb6720247d79c48b1d9fbc97e9c2913003a707d612e3ac  kodi-screensaver-matrixtrails-2.2.1-Leia.tar.gz
-sha256  5f8e5e8435ce1c5ca39d0cb081a9ae4d8ab56a8b6b7f438d7bbe65cdf1603453  src/matrixtrails.cpp
+sha256  4cfbc2bc766d343a70ba0322bc7203332c232ba57b62fb57a0ee9189cca4ac27  debian/copyright
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index 674a0116e2..937c43d8fc 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -7,7 +7,7 @@
 KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.2.1-Leia
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,v$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
+KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 128bd251d5..6374f3aff1 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 618a7dfc85961c803b6292cea9004bdb71566e10a32aec2870cd29775681a808  kodi-screensaver-pingpong-2.1.2-Leia.tar.gz
-sha256 47ff769788026a338740772250197acd0a84f26b57dda49e5b14d63f2f2937ee  src/readme.txt
+sha256 96e9b817ea6384e3d2c5241c8a0504df11d6f8bd0a2f58f25df7152da64f263c  debian/copyright
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 647417f211..12d9430651 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -7,7 +7,7 @@
 KODI_SCREENSAVER_PINGPONG_VERSION = 2.1.2-Leia
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
+KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index 16a37d3161..f35a62a08d 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 cf9ed582b70460682175366641e6a00eaea085a1d3477a02710ba8398a1d17bd  kodi-screensaver-pyro-3.0.1-Leia.tar.gz
-sha256 b945c014a69091c728caa3fca547c2747911e61e1dd2cef9928cf92a6a45655f  src/Pyro.cpp
+sha256 24354cf1e6058ba0a95c7652eab9f1be2224c835ce36d14e82c0f401f65a53b7  debian/copyright
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 880212ee72..8a6ea93e83 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -7,7 +7,7 @@
 KODI_SCREENSAVER_PYRO_VERSION = 3.0.1-Leia
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
+KODI_SCREENSAVER_PYRO_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_PYRO_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 9a8246e9d5..9ff902243f 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 dca39e68d803cca3c1d9524df17feb3e12fc7eeae4166c6311a97dc68c29f523  kodi-screensaver-stars-2.1.3-Leia.tar.gz
-sha256 962bb1e8e5da407e871adcdb6868371fdb2ca0c01e8ffb4bb01a8e87b1eafe88  src/StarField.cpp
+sha256 004b08d7a7bbd574c6e3a4499c13b4f930de780e0cae5b35f85310642d5cdd1e  debian/copyright
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index a23f4d93f7..678165b666 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -7,7 +7,7 @@
 KODI_SCREENSAVER_STARS_VERSION = 2.1.3-Leia
 KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
-KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
+KODI_SCREENSAVER_STARS_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_STARS_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index f0b539852f..7c9053810a 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -2,4 +2,4 @@
 sha256 09a16bf0be13c7d9ed43c6608f662374cb3b8b35c05492ce1117f58270d8d005  kodi-vfs-rar-60f92ff28ee6c94211b628990696c60518bffcf6.tar.gz
 # License files
 sha256 e0c2f13c3a78c8d2b91cb846b8a13fb650fcc88c0630e38ce9c0b7c34631d1cc  lib/UnrarXLib/license.txt
-sha256 2ddada473db917f5d0ed191d8b571aa04af8926807f61398e602b971eaf5ccb7  src/RarManager.h
+sha256 649854722a936822ab52e0801c7d7274c9a1933c9f9566a83003c96ca2c9c657  debian/copyright
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index b113fa5a0b..f7dcbbd111 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -7,7 +7,7 @@
 KODI_VFS_RAR_VERSION = 60f92ff28ee6c94211b628990696c60518bffcf6
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
-KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt src/RarManager.h
+KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt debian/copyright
 KODI_VFS_RAR_DEPENDENCIES = libplatform kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index 08115847bb..9cfe9e5c08 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 6a6d7fc777f574746bcc34b618700a4db3981aee470b68d60c3407eeeb0c16d9  kodi-vfs-sftp-1.0.5-Leia.tar.gz
-sha256 394c58f6cf5e728770c1ac7ea7d509fa54f950cad6e757a9f093344f5230b7b9  src/SFTPFile.cpp
+sha256 65fd90626c2d3d9aa3f9908f524174fa46bb359f3edecb6d86044dbd31652465  debian/copyright
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index 8657ebdcef..c01a584f71 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -7,7 +7,7 @@
 KODI_VFS_SFTP_VERSION = 1.0.5-Leia
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
-KODI_VFS_SFTP_LICENSE_FILES = src/SFTPFile.cpp
+KODI_VFS_SFTP_LICENSE_FILES = debian/copyright
 KODI_VFS_SFTP_DEPENDENCIES = kodi-platform libplatform libssh
 
 $(eval $(cmake-package))
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index fd29651b60..c0a04759f9 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 7b09de334ed3c96d2e2552e0594b8f76c11e36edfc10efd725851140132a4d4f  kodi-visualisation-shadertoy-1.2.3-Leia.tar.gz
-sha256 bf8d322650b3d36c6781a9d14c6194530d5677c14291d51e2a3992c6550a62da  src/main.cpp
+sha256 e33ac3ac6ca1bdd4a4a411481d43579d855622e7ecc207809b5f49ea617db480  debian/copyright
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index add0f3ddea..f6e417bef3 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -7,7 +7,7 @@
 KODI_VISUALISATION_SHADERTOY_VERSION = 1.2.3-Leia
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
-KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
+KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = debian/copyright
 KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = glm kodi libplatform
 
 $(eval $(cmake-package))
