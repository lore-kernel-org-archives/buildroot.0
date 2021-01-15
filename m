From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 15 Jan 2021 23:54:07 +0100
Subject: [Buildroot] [PATCH v1 12/12] package/gst1-python: bump version to
 1.18.3
In-Reply-To: <20210115225407.2350-1-ps.report@gmx.net>
References: <20210115225407.2350-1-ps.report@gmx.net>
Message-ID: <20210115225407.2350-12-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 57bd198501..e64d5c3ab2 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.2.tar.xz.sha256sum
-sha256  e19d0f760b353e88161b3712193cffbd79bf1314418da792b5fec4d8ecef389c  gst-python-1.18.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.3.tar.xz.sha256sum
+sha256  4e630735276e08ff4d70337aa5d91fd008e5f1ed3dc0993674cd5820e264259a  gst-python-1.18.3.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index bf64c2c96a..228665333b 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.18.2
+GST1_PYTHON_VERSION = 1.18.3
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.29.2
