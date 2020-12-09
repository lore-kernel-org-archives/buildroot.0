From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  9 Dec 2020 22:27:10 +0100
Subject: [Buildroot] [PATCH v1 08/14] package/gst1-vaapi: bump version to
 1.18.2
In-Reply-To: <20201209212716.15472-1-ps.report@gmx.net>
References: <20201209212716.15472-1-ps.report@gmx.net>
Message-ID: <20201209212716.15472-8-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 8c7dee6c31..a6607ac405 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.1.tar.xz.sha256sum
-sha256  400d3c42810b50b4566df03f37319a6bdd758f969560c40147e7d9a3b0e8a6ea  gstreamer-vaapi-1.18.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.2.tar.xz.sha256sum
+sha256  8c7b2c74fda095d83dea67accde6a68ba9f608d97ed969fdcf278930f9b1c7c0  gstreamer-vaapi-1.18.2.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 800cfe4394..41ab13a0c4 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.18.1
+GST1_VAAPI_VERSION = 1.18.2
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.29.2
