From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 18 Mar 2020 22:28:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 0.6.0
Message-ID: <20200318212814.311286-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dav1d/dav1d.hash | 2 +-
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index a2f2ea4dfc..9595e91c0e 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1780199d71e62a82ca1bfca2d71da5c599c7e1edc68c72f6fc3c0c25ce1880b7  dav1d-0.5.2.tar.bz2
+sha256 7fcfb4d2e43681f99faaad29d2a81c0ecc42d6e2b94eb4d1fded4e9dcb3661f1  dav1d-0.6.0.tar.bz2
 sha256 b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 150c40f099..4dc1e46826 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 0.5.2
+DAV1D_VERSION = 0.6.0
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
 DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.25.0
