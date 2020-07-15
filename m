From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:12:58 +0200
Subject: [Buildroot] [git commit] package/semodule-utils: bump to 20200710
Message-ID: <20200715151043.7C2B085B4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=557975921f15d98e9bdce0d4cb35e4caaa894457
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/semodule-utils/semodule-utils.hash | 2 +-
 package/semodule-utils/semodule-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index c1a4ef1b9b..d015205d53 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 14ee2db21f36766ffbbb65770f8e7236d21675db9f0f5d40f50974711da598cf semodule-utils-3.0.tar.gz
+sha256 0cc37f9cec751d9c2abb5f2b228b060567e973cb47c19b53b8a4a7378baaa853 semodule-utils-3.1.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index ec1759ece1..c89f28d60e 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.0
-SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
+SEMODULE_UTILS_VERSION = 3.1
+SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = COPYING
 SEMODULE_UTILS_DEPENDENCIES = libsepol
