From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 19:58:59 +0200
Subject: [Buildroot] [git commit] package/libzip: bump to version 1.5.2
Message-ID: <20190430180852.6CA6983D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12227863eb91fbeb6aecf036b1d05aff8e876870
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libzip/libzip.hash | 2 +-
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index e9ed4717c5..eb11b526fb 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	04ea35b6956c7b3453f1ed3f3fe40e3ddae1f43931089124579e8384e79ed372  libzip-1.5.1.tar.xz
+sha256	b3de4d4bd49a01e0cab3507fc163f88e1651695b6b9cb25ad174dbe319d4a3b4  libzip-1.5.2.tar.xz
 sha256  04464e729973cf58189051e7a3e8bca2acce9a1058c735e9e2eb1fdbe0fbbf50  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 20c04122ec..b90ea76f5e 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.5.1
+LIBZIP_VERSION = 1.5.2
 LIBZIP_SITE = http://www.nih.at/libzip
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
