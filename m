From: Ferdinand van Aartsen <ferdinand@ombud.nl>
Date: Fri, 21 Sep 2018 12:40:13 +0200
Subject: [Buildroot] [PATCH 2/2] chrony: Update to 3.4
Message-ID: <20180921104013.5317-1-ferdinand@ombud.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
---
 package/chrony/chrony.hash | 6 +++---
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 38f1534295..925240cf6a 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2017/09/msg00000.html
-md5 f4c4eb0dc92f35ee4bb7d3dcd8029ecb  chrony-3.2.tar.gz
-sha1 64db6c31e013222cc0a2b66322192b4cedf6e048  chrony-3.2.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2018/09/msg00000.html
+md5 7170e750469c198fc6784047d6f71144  chrony-3.4.tar.gz
+sha1 fa41e595e7041a9deda76a69e970a023091474f6  chrony-3.4.tar.gz
 # Locally calculated
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 8868e8481c..b5821b238d 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 3.2
+CHRONY_VERSION = 3.4
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.19.0
