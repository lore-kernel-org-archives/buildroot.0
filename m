From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun,  5 Apr 2020 21:02:18 +0200
Subject: [Buildroot] [PATCH] package/minizip: bump version to 2.9.2
Message-ID: <20200405190218.122972-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump package version and in addition update indentation of
hash file (two spaces).

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/minizip/minizip.hash | 4 ++--
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index e27eb03d94..0fed09735a 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 90481093302ccda81b2d129fea1800ea53be3f826ab0ec6176ad6807869ec4d9  minizip-2.9.1.tar.gz
-sha256 675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
+sha256  8425399277d9d5e39454e655cfd3eb004607960c8358a3e732f5e741a6b5df0a  minizip-2.9.2.tar.gz
+sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 40e6bcf9a8..313fe87a49 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 2.9.1
+MINIZIP_VERSION = 2.9.2
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.26.0
