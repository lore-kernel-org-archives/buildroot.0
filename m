From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 17 Jan 2019 21:11:26 +0100
Subject: [Buildroot] [PATCH 1/1] zbar: bump to version
 b3b4e32b55f570372fc3af473e51f0a13ee57869
Message-ID: <20190117201126.14247-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- Fix build with kernel headers >= 4.4 with:
  https://git.linuxtv.org/zbar.git/commit/?id=b3b4e32b55f570372fc3af473e51f0a13ee57869

Fixes:
 - http://autobuild.buildroot.org/results/630204315eac6e2800bc13c1486a5a525bf9ab37

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zbar/zbar.hash | 3 ++-
 package/zbar/zbar.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index 20930761d1..dcad1bd55c 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 115486dfb314da0dab26c745ab3056eb56f16f74a9fddda89a1ea9d0d51007ae zbar-006b465a267ad3c6c754b88bbe77bb1c1f49f40b.tar.gz
+sha256 fac99e835c4ced03a5a3d9c94c99aea118aef9663ed86a0ac45c9b7162dac4b1 zbar-b3b4e32b55f570372fc3af473e51f0a13ee57869.tar.gz
+sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89 LICENSE
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index b3b16e12ec..fd56e94e70 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZBAR_VERSION = 006b465a267ad3c6c754b88bbe77bb1c1f49f40b
+ZBAR_VERSION = b3b4e32b55f570372fc3af473e51f0a13ee57869
 ZBAR_SITE = git://linuxtv.org/zbar.git
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE
-- 
2.14.1
