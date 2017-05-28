From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:34:19 +0200
Subject: [Buildroot] [git commit] package/exiv2: bump version to 0.26
Message-ID: <20170601202858.641B082641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd9d93d1b438f1b421175f6bca16431cf417789d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed download URL according to http://www.exiv2.org/download.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exiv2/exiv2.hash | 4 ++--
 package/exiv2/exiv2.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index b1e78d2..cdd840c 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,4 +1,4 @@
 # From http://www.exiv2.org/download.html
-md5 258d4831b30f75a01e0234065c6c2806 exiv2-0.25.tar.gz
+md5 f936d2ca5cbe1e18c71ca2baa5e84fb4 exiv2-0.26-trunk.tar.gz
 # Locally calculated
-sha256 c80bfc778a15fdb06f71265db2c3d49d8493c382e516cb99b8c9f9cbde36efa4 exiv2-0.25.tar.gz
+sha256 0c625cbeb494aa1b9221280a5b053b54d0c9720d48fa9120cef7c6f93efd4dc3 exiv2-0.26-trunk.tar.gz
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 95d03cf..f56e861 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.25
-EXIV2_SITE = http://www.exiv2.org
+EXIV2_VERSION = 0.26
+EXIV2_SITE = http://www.exiv2.org/builds
+EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-trunk.tar.gz
 EXIV2_INSTALL_STAGING = YES
 
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
