From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 21:16:57 +0100
Subject: [Buildroot] [git commit] package/minizip: bump to version 2.9.1
Message-ID: <20200203200907.16A1388DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0166125e3e132eb47902fc3c6e96e0718fb913f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 1b4f32a966..e27eb03d94 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d9501b1048064855222a42264ce773eebc29bbad5bcadbbeb22db2c3e65ae447  minizip-2.9.0.tar.gz
+sha256 90481093302ccda81b2d129fea1800ea53be3f826ab0ec6176ad6807869ec4d9  minizip-2.9.1.tar.gz
 sha256 675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 3ae8d1d6f0..40e6bcf9a8 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 2.9.0
+MINIZIP_VERSION = 2.9.1
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = \
 	host-pkgconf \
