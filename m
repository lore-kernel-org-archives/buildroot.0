From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 21:43:49 +0100
Subject: [Buildroot] [git commit] package/gst1-python: bump version to 1.18.3
Message-ID: <20210116203504.96DF487015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af073bcdbef93848834a965d0a27cd5c90e3da02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
