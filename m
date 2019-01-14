From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Jan 2019 07:50:58 +0100
Subject: [Buildroot] [PATCH 1/1] i2pd: bump to version 2.22.0
Message-ID: <20190114065058.13302-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/i2pd/i2pd.hash | 2 +-
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 451ee006a4..c3c9a48ec5 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	e424c368f92be5050f3dd5e98ed9ce2ea8d6076e36444c99b96e3b10f69420b1	i2pd-2.20.0.tar.gz
+sha256	6547d7a560482c5eda9106ae19267bc8afbb6af48fed3bebf423ade28103e173	i2pd-2.22.0.tar.gz
 sha256	d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c	LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 8447f3e06b..a92d513159 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.20.0
+I2PD_VERSION = 2.22.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.14.1
