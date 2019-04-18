From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:25:28 +0200
Subject: [Buildroot] [git commit] package/i2pd: bump to version 2.24.0
Message-ID: <20190418092108.514FD87F43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82a6ccb14d618add2330d857062b0cdb0d8641fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build with boost 1.70.0

Fixes:
 - http://autobuild.buildroot.org/results/b35466da7308e60024cec743728aef045dc24405

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/i2pd/i2pd.hash | 2 +-
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index c3c9a48ec5..f104590f3a 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	6547d7a560482c5eda9106ae19267bc8afbb6af48fed3bebf423ade28103e173	i2pd-2.22.0.tar.gz
+sha256	809b37100f0f176432b01ab6edee96dc62b0f65d5bf7531e008a87117e742566	i2pd-2.24.0.tar.gz
 sha256	d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c	LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 3ce5f97fb8..5fa815c21d 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.22.0
+I2PD_VERSION = 2.24.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
