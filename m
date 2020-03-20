From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 21:42:26 +0100
Subject: [Buildroot] [git commit] package/dav1d: bump version to 0.6.0
Message-ID: <20200320203014.8854C82A48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c0bc3c1d74f6f46b28497826715e8b30f7f3edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: two spaces in hash files]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index a2f2ea4dfc..b91ae0710a 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1780199d71e62a82ca1bfca2d71da5c599c7e1edc68c72f6fc3c0c25ce1880b7  dav1d-0.5.2.tar.bz2
-sha256 b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
+sha256  7fcfb4d2e43681f99faaad29d2a81c0ecc42d6e2b94eb4d1fded4e9dcb3661f1  dav1d-0.6.0.tar.bz2
+sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
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
