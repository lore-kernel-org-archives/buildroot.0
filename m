From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 18:14:07 +0300
Subject: [Buildroot] [PATCH 4/4] package/cog: bump to version 0.10.0
In-Reply-To: <20210518151407.264769-1-aperez@igalia.com>
References: <20210518151407.264769-1-aperez@igalia.com>
Message-ID: <20210518151407.264769-5-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:

  https://wpewebkit.org/release/cog-0.10.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 2cafe8ca6e..566d30fa2a 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.8.1.tar.xz.sums
-md5  21664fb04c9149dea6d68e13e6074276  cog-0.8.1.tar.xz
-sha1  baabba7f0f6009c64ef0c4f7c5f807382cffef5d  cog-0.8.1.tar.xz
-sha256  b82e917eb764943b9859c631974f8f0e748b79ae87bb7a944f46c818740e0208  cog-0.8.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.10.0.tar.xz.sums
+md5  1b0407b6163a3a01afdfc0fb454a7570  cog-0.10.0.tar.xz
+sha1  911816c00a2b08f4cfd388b1d2e176835c9b4e9e  cog-0.10.0.tar.xz
+sha256  2c72369c636ca4684370adad1344071b23c9ee2c851eb7d738fa2e1d7092031f  cog-0.10.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 86bdf935d2..d373e6e1b6 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.8.1
+COG_VERSION = 0.10.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-- 
2.31.1
