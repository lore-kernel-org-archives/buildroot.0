From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 23:04:03 +0100
Subject: [Buildroot] [git commit] package/proj: bump to 7.2.1
Message-ID: <20210116214505.AF644870BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d704809f86cf2108812f56fd9052887fb91113a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 60b6b22c07..27cbc38490 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-7.2.0.tar.gz.md5
-md5  12748b74e4d6c12ade32ec3ca68dafc7  proj-7.2.0.tar.gz
+# Fetched from http://download.osgeo.org/proj/proj-7.2.1.tar.gz.md5
+md5  befbafd25e65ddf0c26a8321d8bcdcd2  proj-7.2.1.tar.gz
 # Locally calculated
-sha256  2957798e5fe295ff96a2af1889d0428e486363d210889422f76dd744f7885763  proj-7.2.0.tar.gz
+sha256  b384f42e5fb9c6d01fe5fa4d31da2e91329668863a684f97be5d4760dbbf0a14  proj-7.2.1.tar.gz
 sha256  2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 3a390deb59..03ed9c0a2e 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 7.2.0
+PROJ_VERSION = 7.2.1
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
