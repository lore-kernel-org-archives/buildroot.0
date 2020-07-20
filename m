From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 18:03:28 +0200
Subject: [Buildroot] [git commit] package/libzip: bump version to 1.7.3
Message-ID: <20200720160000.A0E5A821BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a61f45137f461eb9c6a47d1220e1b7a3240fca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://libzip.org/news/

Updated license hash due to copyright year bump:
https://github.com/nih-at/libzip/commit/40098f0445599d53eb85254777734ccef6ce6915

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libzip/libzip.hash | 4 ++--
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index 1ca4828f09..a298b9aba9 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a020dc1b17a79faa748e43a05f8605d65e403813e8e97ad3a300a90ddba097ac  libzip-1.7.1.tar.xz
-sha256  af6d9141427cf40b7d1fa6d7f5473b06a7faa9f9b0a2ea588eb6ba7b2e1c8a9e  LICENSE
+sha256  a60473ffdb7b4260c08bfa19c2ccea0438edac11193c3afbbb1f17fbcf6c6132  libzip-1.7.3.tar.xz
+sha256  deae392de70503672793ee784d603bfa8069dcd5974a325dfbf91160f3a147d6  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index c30ad037c3..379eb2c5df 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.7.1
+LIBZIP_VERSION = 1.7.3
 LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
