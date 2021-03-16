From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:40:00 +0100
Subject: [Buildroot] [git commit] package/libfm: bump to version 1.3.2
Message-ID: <20210316201633.D1D3487764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc5582e85714f8376f8573ae6838296fa8fc6c06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libfm/libfm.hash | 11 ++++++-----
 package/libfm/libfm.mk   |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/libfm/libfm.hash b/package/libfm/libfm.hash
index d63a436119..74781b2a0b 100644
--- a/package/libfm/libfm.hash
+++ b/package/libfm/libfm.hash
@@ -1,7 +1,8 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/LibFM/
-md5 c15ecd2c9317e2c385cd3f046d0b61ba  libfm-1.3.1.tar.xz
-sha1 29539f50acd5c00a00362adffd532053b0688e66  libfm-1.3.1.tar.xz
+md5  c87a0ff41ae77825079b2f785ec0741e  libfm-1.3.2.tar.xz
+sha1  7c5c14dd0615b457687966ce4e55c2d054bf93e1  libfm-1.3.2.tar.xz
 
-# Hash for license files:
-sha256 d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
-sha256 c3a3d93e111462f2b0292b56a6a7b87d342fd7156741d8b81b8b08723be4597e  src/extra/fm-xml-file.c
+# Locally computed:
+sha256  a5042630304cf8e5d8cff9d565c6bd546f228b48c960153ed366a34e87cad1e5  libfm-1.3.2.tar.xz
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
+sha256  c3a3d93e111462f2b0292b56a6a7b87d342fd7156741d8b81b8b08723be4597e  src/extra/fm-xml-file.c
diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index 47f01b17cb..29f6d7d56a 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFM_VERSION = 1.3.1
+LIBFM_VERSION = 1.3.2
 LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
 LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_DEPENDENCIES = menu-cache libglib2 cairo
