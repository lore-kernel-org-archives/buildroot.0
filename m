From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:49:40 +0200
Subject: [Buildroot] [git commit branch/next] proj: upgrade to 5.0.1
Message-ID: <20180520134903.7079981018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a76aabd8842d28747fa8ec62b9c4a19f062b7fb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proj/proj.hash | 4 ++--
 package/proj/proj.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 6a791baae4..aadbc385df 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
 # Fetched from http://download.osgeo.org/proj/proj-4.9.3.tar.gz.md5
-md5 d598336ca834742735137c5674b214a1 proj-4.9.3.tar.gz
+md5 15c8d7d6a8cb945c7878d0ff322a232c proj-5.0.1.tar.gz
 # Locally calculated
-sha256 6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7 proj-4.9.3.tar.gz
+sha256 a792f78897482ed2c4e2af4e8a1a02e294c64e32b591a635c5294cb9d49fdc8c proj-5.0.1.tar.gz
 sha256 2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6 COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 6d029bba06..0b239b2bbe 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 4.9.3
+PROJ_VERSION = 5.0.1
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
