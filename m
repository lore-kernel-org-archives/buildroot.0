From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:25:03 +0100
Subject: [Buildroot] [git commit] package/proj: bump to 7.2.0
Message-ID: <20201213210939.519BF814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdc43df6f4a4e6afda8fd661b6f4a12113c95b95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 0d59d54e26..60b6b22c07 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-7.1.1.tar.gz.md5
-md5  b7ce84943dcf2b660b11c2ef9657dad5  proj-7.1.1.tar.gz
+# Fetched from http://download.osgeo.org/proj/proj-7.2.0.tar.gz.md5
+md5  12748b74e4d6c12ade32ec3ca68dafc7  proj-7.2.0.tar.gz
 # Locally calculated
-sha256  324e7abb5569fb5f787dadf1d4474766915c485a188cf48cf07153b99156b5f9  proj-7.1.1.tar.gz
+sha256  2957798e5fe295ff96a2af1889d0428e486363d210889422f76dd744f7885763  proj-7.2.0.tar.gz
 sha256  2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 663db4abcc..3a390deb59 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 7.1.1
+PROJ_VERSION = 7.2.0
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
