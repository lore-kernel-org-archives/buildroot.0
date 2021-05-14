From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 May 2021 21:52:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxml2: bump to version 2.9.12
Message-ID: <20210514195234.2224052-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brown-paper bag release:
https://github.com/GNOME/libxml2/commit/b48e77cf4f6fa0792c5f4b639707a2b0675e461b

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 563a5f89c9..ce6c3c4825 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	886f696d5d5b45d780b2880645edf9e0c62a4fd6841b853e824ada4e02b4d331	libxml2-2.9.11.tar.gz
+sha256  c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92  libxml2-2.9.12.tar.gz
 # License files, locally calculated
-sha256	c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd	COPYING
+sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index f39e688781..5d688acae5 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.11
+LIBXML2_VERSION = 2.9.12
 LIBXML2_SITE = http://xmlsoft.org/sources
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
-- 
2.30.2
