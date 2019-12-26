From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 16:08:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump to version 0.5.2
Message-ID: <20191226150819.3415268-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dav1d/dav1d.hash | 2 +-
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index b8f29af160..a2f2ea4dfc 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0214d201a338e8418f805b68f9ad277e33d79c18594dee6eaf6dcd74db2674a9  dav1d-0.5.1.tar.bz2
+sha256 1780199d71e62a82ca1bfca2d71da5c599c7e1edc68c72f6fc3c0c25ce1880b7  dav1d-0.5.2.tar.bz2
 sha256 b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 1de2fdd979..150c40f099 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 0.5.1
+DAV1D_VERSION = 0.5.2
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
 DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.24.0
