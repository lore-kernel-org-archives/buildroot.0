From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:38:23 +0200
Subject: [Buildroot] [git commit] package/c-icap-modules: bump to version
 0.5.4
Message-ID: <20200428052428.536C9804F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f708ed8d065ac7a8487e9b531c7a41a4103764f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash file to two space format.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-icap-modules/c-icap-modules.hash | 8 ++++----
 package/c-icap-modules/c-icap-modules.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.hash b/package/c-icap-modules/c-icap-modules.hash
index fa0eb08983..cc7949a092 100644
--- a/package/c-icap-modules/c-icap-modules.hash
+++ b/package/c-icap-modules/c-icap-modules.hash
@@ -1,7 +1,7 @@
 # From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.5.x/
-md5 d5f1e553cfe60180f9fa22c9a13005be  c_icap_modules-0.5.3.tar.gz
-sha1 df76f30b2cc29aeef700f477693e7017eaa847f4  c_icap_modules-0.5.3.tar.gz
+md5  2f8c174f7a5414616f5a0a976ac4a221  c_icap_modules-0.5.4.tar.gz
+sha1  ec7bb138d7775895cd8b2e12adc41dbf48eba1b7  c_icap_modules-0.5.4.tar.gz
 
 # Locally calculated
-sha256 6e2f87a60379ffde26947c6e82ff0c7f614bc005588bf1efb40c74f69c82f925  c_icap_modules-0.5.3.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  87409920c66027204e9cca5f20e137b63cd12daf6dfcd85c1fa62ab2bd1c57cc  c_icap_modules-0.5.4.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index b5356b1db1..2eaa141afe 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_MODULES_VERSION = 0.5.3
+C_ICAP_MODULES_VERSION = 0.5.4
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_MODULES_LICENSE = GPL-2.0+
