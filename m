From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 10:49:44 +0200
Subject: [Buildroot] [git commit] package/tinyxml2: bump version to 8.0.0
Message-ID: <20200413083634.36C458E9C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ef2a3cc435f4642a7faa3ca98c63cfa810e7e8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched license file to LICENSE.txt due to upstream commit:
https://github.com/leethomason/tinyxml2/commit/db39dbc0fdf0376674b0fd94a6ff9f16a4d5b174

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinyxml2/tinyxml2.hash | 4 ++--
 package/tinyxml2/tinyxml2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index bb0f8108f9..3c59d159b5 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 68ebd396a4220d5a9b5a621c6e9c66349c5cfdf5efaea3f16e3bb92e45f4e2a3  tinyxml2-7.1.0.tar.gz
-sha256 beed3466425970b9d970e573947f1fe7d3cbe41ed7e2c39b0daf45f7de053c43  readme.md
+sha256 6ce574fbb46751842d23089485ae73d3db12c1b6639cda7721bf3a7ee862012c  tinyxml2-8.0.0.tar.gz
+sha256 9332252e9b9e46db8285d4a3f0bf25f139bf1dca6781b956d57f2302efca6432  LICENSE.txt
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 67f626428a..b06d849b21 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 7.1.0
+TINYXML2_VERSION = 8.0.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
-TINYXML2_LICENSE_FILES = readme.md
+TINYXML2_LICENSE_FILES = LICENSE.txt
 TINYXML2_INSTALL_STAGING = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
