From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 23:31:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 0.7.1
Message-ID: <20200621213142.51615-1-bernd.kuhls@t-online.de>
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
index 812b4fb13b..3ff4b1b685 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8057149f5f08c5ca47e1344fba9046ff84ac85ca409d7adbec8268c707ec5c19  dav1d-0.7.0.tar.bz2
+sha256  9eac4f50089f54a9f562827bda4a21187d68c01d8b20055eef1d7efca9f84cf8  dav1d-0.7.1.tar.bz2
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 9243267e97..1e84c21b47 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 0.7.0
+DAV1D_VERSION = 0.7.1
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
 DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.26.2
