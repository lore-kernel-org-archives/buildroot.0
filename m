From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:33 -0000
Subject: [Buildroot] [git commit] package/tinyxml2: bump to version 7.1.0
Message-ID: <20190903133617.588ED8A5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0cf1d15bbd1b47b24f4b9ea5457dc54c0605947
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Readme file changed due to some modifications (typos, update)

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinyxml2/tinyxml2.hash | 4 ++--
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index 88291e4f39..bb0f8108f9 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a381729e32b6c2916a23544c04f342682d38b3f6e6c0cad3c25e900c3a7ef1a6  tinyxml2-7.0.1.tar.gz
-sha256 35e49ea659da39b72b0e2f38214f9799b548225b0950c8dbb6d183b4c1455263  readme.md
+sha256 68ebd396a4220d5a9b5a621c6e9c66349c5cfdf5efaea3f16e3bb92e45f4e2a3  tinyxml2-7.1.0.tar.gz
+sha256 beed3466425970b9d970e573947f1fe7d3cbe41ed7e2c39b0daf45f7de053c43  readme.md
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 7f362f3d33..67f626428a 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 7.0.1
+TINYXML2_VERSION = 7.1.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = readme.md
