From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Sep 2017 15:22:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencore-amr: bump version to 0.1.5
Message-ID: <20170916132203.3724-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added md5 & sha1 hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opencore-amr/opencore-amr.hash | 5 ++++-
 package/opencore-amr/opencore-amr.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/opencore-amr/opencore-amr.hash b/package/opencore-amr/opencore-amr.hash
index a984514d0f..5d11286b6a 100644
--- a/package/opencore-amr/opencore-amr.hash
+++ b/package/opencore-amr/opencore-amr.hash
@@ -1,2 +1,5 @@
+# From https://sourceforge.net/projects/opencore-amr/files/opencore-amr/
+md5 e0798587b91411cc092aa73091a97dfc  opencore-amr-0.1.5.tar.gz
+sha1 bef4d1e3a8a155b47569b6691a223843b33e279e  opencore-amr-0.1.5.tar.gz
 # Locally computed:
-sha256  106bf811c1f36444d7671d8fd2589f8b2e0cca58a2c764da62ffc4a070595385  opencore-amr-0.1.3.tar.gz
+sha256 2c006cb9d5f651bfb5e60156dbff6af3c9d35c7bbcc9015308c0aff1e14cd341  opencore-amr-0.1.5.tar.gz
diff --git a/package/opencore-amr/opencore-amr.mk b/package/opencore-amr/opencore-amr.mk
index 8b6aa29a96..115f97cb37 100644
--- a/package/opencore-amr/opencore-amr.mk
+++ b/package/opencore-amr/opencore-amr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCORE_AMR_VERSION = 0.1.3
+OPENCORE_AMR_VERSION = 0.1.5
 OPENCORE_AMR_SITE = http://downloads.sourceforge.net/project/opencore-amr/opencore-amr
 OPENCORE_AMR_INSTALL_STAGING = YES
 OPENCORE_AMR_LICENSE = Apache-2.0
-- 
2.11.0
