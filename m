From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  5 Jan 2021 20:27:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 0.8.1
Message-ID: <20210105192706.1353044-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dav1d/dav1d.hash | 2 +-
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 1121ec5cd6..45152f7a80 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b62eb846fd8af15b402c8f6615a74405fe4448cf16663efd0358d4124db0829f  dav1d-0.8.0.tar.bz2
+sha256  842da2945afcf54e651d17112bf2823a238e6c935a6c8dff3a8e96a2eb740269  dav1d-0.8.1.tar.bz2
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index c59f496d83..68f6fc8805 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 0.8.0
+DAV1D_VERSION = 0.8.1
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
 DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.29.2
