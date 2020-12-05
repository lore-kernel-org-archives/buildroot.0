From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Dec 2020 09:09:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 0.8.0
Message-ID: <20201205080953.2443925-1-bernd.kuhls@t-online.de>
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
index 3ff4b1b685..1121ec5cd6 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9eac4f50089f54a9f562827bda4a21187d68c01d8b20055eef1d7efca9f84cf8  dav1d-0.7.1.tar.bz2
+sha256  b62eb846fd8af15b402c8f6615a74405fe4448cf16663efd0358d4124db0829f  dav1d-0.8.0.tar.bz2
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 1e84c21b47..c59f496d83 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 0.7.1
+DAV1D_VERSION = 0.8.0
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
 DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.29.2
